From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: how to use linux system call in cross compiling environment
Date: Thu, 18 Nov 2004 10:48:56 +0100
Message-ID: <20041118094856.GB29445@mail.13thfloor.at>
References: <419B0E2A.4090003@cbf.chinese2000.net> <20041117151719.GA26478@mail.13thfloor.at> <419BF832.60804@cbf.chinese2000.net>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <419BF832.60804@cbf.chinese2000.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lawrence <law@cbf.chinese2000.net>
Cc: linux-assembly@vger.kernel.org

On Thu, Nov 18, 2004 at 09:17:38AM +0800, Lawrence wrote:
> Dear Herbert,
> 
> Thanks for your reply.
> 
> I have to apologize that I am not much familiar with C, thus I have some 
> difficulty to digest the code.
> 
> I assume the purpose of the C code is to generate the swi call in 
> assembly format.  From the objdump I see "swi 0x009000de", therefore I 
> just add this to my assembly code and comment out the other swi.  After 
> the asm->ld->run procedure I still got the same answer from arm-elf-run 
> of "sim: unknow SWI encountered - 0999de - ignoring".  Besides, I can't 
> find of any linux syscall that correspondent with 0x9000de, is that a 
> new syscall in kernerl 2.6?

well, that's a test syscall I added for debugging/testing
my iPAQ H1940 (which is arm based) usually it's the tux
syscall IIRC ...

> Once I am thinking if it is because the GNU ARM toolchain doesn't have 
> an arm linux kernel that make any swi syscall impossible.  If this is 
> the case, is there a way to load an arm kernerl first and then debug the 
> assembly program?
> 
> I've also tried a simple "Hello World" program with the toolchain  and 
> arm-elf-run can show the printf string to the screen.  I wonder how they 
> do this without a kernel.

well, did you objdump -d the resulting binary yet?
if so you should already know how they do it ;)

HTH,
Herbert

> Thanks and Regards,
> Lawrence
> 
> 
> >On Wed, Nov 17, 2004 at 04:39:06PM +0800, Lawrence wrote:
> > 
> >
> >>Hi all,
> >>
> >>I'm figuring out the linux-arm assembly right now. I use the GNU ARM
> >>toolchain 3.4.1 provided by www.gnuarm.com on my x86 Linux hosts.
> >>
> >>I've successfully assembled and linked the following code:
> >>
> >>@filename: hello.s
> >>
> >>.text
> >>       .align  2
> >>       .global _start
> >>_start:
> >>       adr     r1, msg         @ address
> >>       mov     r0, #1          @ stdout
> >>       mov     r2, #13         @ length
> >>       swi     #0x900004       @ sys_write
> >>
> >>       mov     r0, #0
> >>       swi     #0x900001       @ sys_exit
> >>
> >>       .align  2
> >>msg:
> >>       .asciz  "hello, world\n"
> >>
> >>the commands I used are as follows:
> >>
> >>arm-elf-as -gdwarf2 -o hello.o hello.s
> >>arm-elf-ld -o hello hello.o
> >>   
> >>
> >
> >hmm, 
> >
> >static inline long mhelper(uint32_t cmd, uint32_t addr, uint32_t value)
> >{
> >       register long _r2 asm("r2")=(long)(value);
> >       register long _r1 asm("r1")=(long)(addr);
> >       register long _r0 asm("r0")=(long)(cmd);
> >       asm volatile(
> >               "swi %1"
> >               : "=r"(_r0)
> >               : "i"(__NR_mhelper), "r"(_r0), "r"(_r1), "r"(_r2)
> >               : "memory");
> >       if(_r0 >=(unsigned long) -4095) {
> >               long err = _r0;
> >               (*__errno_location())=(-err);
> >               _r0=(unsigned long) -1;
> >       }
> >       return (long) _r0;
> >}
> >
> >
> >which looks like this in objdump:
> >
> >   844c:       e1a0200a        mov     r2, sl
> >   8450:       e1a0100a        mov     r1, sl
> >   8454:       e1a0000a        mov     r0, sl
> >   8458:       ef9000de        swi     0x009000de
> >   845c:       e3700a01        cmn     r0, #4096       ; 0x1000
> >   8460:       9a000004        bls     0x8478
> >   ...
> >
> >
> >works fine here ...
> >
> >HTH,
> >Herbert
> >
> > 
> >
> >>When I run the program as "arm-elf-run hello", I got the reply sim:
> >>unknown SWI encountered - 900004 - ignoring. I got the same result when
> >>debugging the program with insight and gdb.
> >>
> >>I would like to know if there is a way to use the arm linux system call
> >>under such simulation environment. Thanks.
> >>
> >>Regards,
> >>Lawrence
> >>
> >>
> >>-
> >>To unsubscribe from this list: send the line "unsubscribe linux-assembly" 
> >>in
> >>the body of a message to majordomo@vger.kernel.org
> >>More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >>   
> >>
> >
> >
> > 
> >
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
