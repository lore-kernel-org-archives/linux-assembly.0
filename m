From: "Richard Cooper" <peajay@funrestraints.com>
Subject: Re: How to Use the vm86 System Call
Date: Fri, 16 Sep 2005 02:28:11 -0400
Message-ID: <op.sw6mw9tnnro9m0@sucks.airplane.fire>
References: <20050915195205.20599.qmail@web26002.mail.ukl.yahoo.com> <op.sw5v2ltgnro9m0@winfuck> <op.sw5zp8fmnro9m0@sucks.airplane.fire>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <op.sw5zp8fmnro9m0@sucks.airplane.fire>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: Richard Cooper <peajay@funrestraints.com>
Cc: linux-assembly@vger.kernel.org

I've looked over the source for LRMI, and here's what I've discovered about the vm86 call, just in case someone cares.  Feel free to turn this into a webpage or something if you feel the urge.

I should add that LRMI (Linux Real Mode Interface) is the finest piece of code I've ever seen.  I'm used to not liking other people's code at all, but I like this code better than code that I write myself.  It's easy to read, there are very few comments but the variable and function names are nearly always descriptive, and it looks as if the author considered every possible thing that might happen and made the code handle it appropriately.  So if it provides everything that you need, I'd recommend that you just use the LRMI code instead of writing your own.  Unless you're some kind of genius, I don't think your code will be any better.  This code is just awesome.

Overview:
=========

When you call vm86 (the number 113 vm86, at least), the real-mode process inherits your processes address space.  So before calling vm86, you need to map everything you want in the real-mode address space into your address space, at the offsets where you want it to be at.  You also need to allocate any RAM that you want to exist in real mode.

Zero the entire vm86_struct, as it seems that fields not mentioned here should be set to zero.

Then you set the int_revectored field of vm86_struct to specify which interrupts you want to receive from real-mode, and which ones you want Linux to handle automatically for you.  (I assume it just calls the real-mode interrupt handler.)

Then you load the vm86_regs structure in vm_86_struct with what you want the initial register contents of the real mode process to be.  Depending on what you are doing, you will probably want to set up a stack at least.

The real-mode process inherits your FS and GS selectors, the fs and gs fields in vm86_regs are (I guess) only for return values.  You can either leave them as they are, giving the real-mode process access to your protected mode address space via FS and GS, or you can load them with real-mode selectors before calling vm86.

Then you call vm86.  vm86 runs until either a real-mode interrupt occurs, a not-allowed-in-vm86-mode opcode is executed, or some other miscellaneous error occurs.  A handy way to allow your real-mode code to exit the vm86 call is to have it call interrupt 255, which you previously set to be one which you wish to receive.

Upon return from vm86, the vm86_regs structure contains all of the register contents from the real-mode process.

The return value of vm86 contains two fields, a type field and an argument field, the type field being the lowest 8 bits, and the argument field being the eight bits above that.  If the type field is VM86_INTx, then the argument field is the number of the interrupt that was called.

Various Details:
================

There are two vm86 system calls.  LRMI makes sure to get the one that is numbered 113.  This is the one declared as such:

	int vm86(struct vm86_struct *);

The other one takes an additional parameter, about which I know nothing.

Here is vm86_struct:

	struct vm86_struct {
	        struct vm86_regs regs;
	        unsigned long flags;
	        unsigned long screen_bitmap;
	        unsigned long cpu_type;
	        struct revectored_struct int_revectored;
	        struct revectored_struct int21_revectored;
	};

LRMI begins by simply setting the entire thing to zero.

flags, screen_bitmap, cpu_type, and int21_revectored are never accessed by LRMI, except when it zeros the entire structure, so I don't know what any of them do.

int_revectored appears to be a bitmask, with one bit for each interrupt.  Setting a bit to 0 tells Linux that you want it to emulate that interrupt.  Setting a bit to 1 tells Linux that you want to service that interrupt.  I'm not sure if this is reliable, as there's also code in LRMI that emulates the interrupt if Linux doesn't, but maybe that's just a failsafe.

vm86_regs looks like this:

	struct vm86_regs {
	/*
	 * normal regs, with special meaning for the segment descriptors..
	 */
	        long ebx;
	        long ecx;
	        long edx;
	        long esi;
	        long edi;
	        long ebp;
	        long eax;
	        long __null_ds;
	        long __null_es;
	        long __null_fs;
	        long __null_gs;
	        long orig_eax;
	        long eip;
	        unsigned short cs, __csh;
	        long eflags;
	        long esp;
	        unsigned short ss, __ssh;
	/*
	 * these are specific to v86 mode:
	 */
	        unsigned short es, __esh;
	        unsigned short ds, __dsh;
	        unsigned short fs, __fsh;
	        unsigned short gs, __gsh;
	};

All of the register fields are what you would expect.  LRMI never accesses orig_eax, or any of the __null_ segment registers.

Linux ignores the fs and gs fields.  (I think that's worth mentioning twice.)  LRMI loads it's own FS and GS with the real-mode process' FS and GS before calling vm86, and restores it's old FS and GS after the call returns.  It does not save the contents of FS and GS upon return from vm86, leading me to believe that Linux saves them in vm86_regs.

LRMI maps address 0x00000 size 0x400 into it's memory space, so that it has the origional interrupt table from when the computer booted.  It also maps address 0x00400 size 0x00102, as this is the BIOS data area.  It also maps address 0xA0000 size 0x60000, to map in any ROMs that may be in that area.

LRMI maps an anonymous block of /dev/zero of size 0x40000 to address 0x10000.  It uses this memory in it's own internal LRMI_alloc_real function which allocates memory in the real-mode address space.

Although the real-mode process inherits your address space, it does not appear to inherit your I/O permissions.  Either that or the code to emulate I/O instructions in LRMI is never being used.

These are the possible type codes for the vm86 return value:

	#define VM86_SIGNAL     0       /* return due to signal */
	#define VM86_UNKNOWN    1       /* unhandled GP fault - IO-instruction or similar */
	#define VM86_INTx       2       /* int3/int x instruction (ARG = x) */
	#define VM86_STI        3       /* sti/popf/iret instruction enabled virtual interrupts */

If the return code is VM86_UNKNOWN, then LRMI checks to see if it's an opcode that it knows how to emulate.  It emulates every opcode that operates on an I/O port, and thus I assume that those opcodes must be emulated.  Additionally, it emulates segment overrides, data size overrides, and repeat prefixes, taking into account the direction flag.  It ignores the address size override, as well as the F0 and F2 prefixes.

If the instruction isn't one which it knows how to emulate, it appears to have a nice piece of code that prints a register dump of the real mode registers.  It also calls this function if the return value type is anything other than VM86_INTx or VM86_UNKNOWN.

I believe that it's possible that nothing has to be done for VM86_STI.  Judging from the comment in the structure above, it sounds like it's mearly a signal to let you know that interrupts were enabled.

Additionally, I believe VM86_SIGNAL is just like the EINTR return value of many other functions, that is, it simply indicates that your process recieved a signal, but that the vm86 process is otherwise just fine.  This might be useful if you wish to only allow the vm86 process to run for a limited time.  You could use the alarm or itimer system calls to schedual an alarm signal, and when that signal occurs, the vm86 call will exit.

That's it, hopefully I didn't forget anything.
