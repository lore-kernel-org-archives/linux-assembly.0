From: kt <kt1023@comcast.net>
Subject: Re: Linux Assembly language programming.
Date: Fri, 16 Jul 2004 21:27:35 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <40F88087.6020005@comcast.net>
References: <40F8416E.50905@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <40F8416E.50905@verizon.net>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org


Hi,

 there is a wonderful page on the web called something like 
linuxassembly.org but I had to use a mirror:

http://linuxasm.gerf.org/

This really looks helpful with docs, tutorials, examples and other 
things. I never had to use a book but who knows there may be good ones 
out there (the above page tells you about this too).

I wonder what you would like to know beyond that, but I find it helpful 
to know what tools to use.  Also  you want to know about the ABI 
(Application Binary Interface) which defines your interaction with the 
system around your routine. I have a PowerPC based machine so I don't 
know how much help I can offer you . I have seen a number of methods to 
deal with assembly though.

I generally like dealing with GNU tools since they are identical accross 
the architectures except maybe for the instructions and the ABI. Some 
people find other assemblers better (nasm) because they may support the 
format they like, but I never dealt much with DOS assemblers so I went 
straight to 'as'.

I can never keep my ABI in my head so I generally ask gcc for help :

int add(int a, int b) {
     return a+b;
}

then call

$ gcc -O -S add.c -o add.S

that produces:

        .file   "add.c"
        .section        ".text"
        .align 2
        .globl add
        .type   add, @function
add:
        add 3,3,4
        blr
        .size   add,.-add
        .section        .note.GNU-stack,"",@progbits
        .ident  "GCC: (GNU) 3.3.3 (Yellow Dog Linux)"

Now that our curiosity is satisfied... , hold it I have to explain some 
more. Most necessary explanations about the assembler can be found here:

http://www.gnu.org/software/binutils/manual/gas-2.9.1/html_chapter/as_toc.html

the .section tag is important in that it defines where your assembly 
goes in the ELF output of the compiler. There is a nice documentation 
about the ELF fileformat out there, you can find that on the page 
mentioned above or here:

http://www.skyfree.org/linux/references/ELF_Format.pdf

Most of the tags in the file above are not required for a functioning 
assembly program. The page mentioned on the top gives better examples I 
guess. To decipher it a little bit notice the 'add' instruction. The 
last two registers are input  registers  which are used to pass the 
first and the second parameter from a caller to the function.  The 
destination register 3 is used to return the result. Notice that we 
don't have to deal with the stack or the temporary storage of register 3 
and 4 because the ABI defines that those registers will not be saved by 
a function. The tough stuff is described in whatever manual you can find 
about your architecture (try this link: 
http://www-106.ibm.com/developerworks/linux/library/l-ppc/  , link at 
top & gcc manual also helps).
 
Now we can fiddle with it a bit. You can use gcc to compile the assembly 
code and also invoke the preprocessor if you keep the .S suffix.

How about that :

// Helpful comment:
// subtract - prototype: int sub(int a, int b)
//
        .section        ".text"
        .align 2
        .globl sub
        .type   sub, @function
sub:
        sub 3,3,4
        blr

Now if you call:
gcc -c add.S  -o add.o

you get an object file you can link into your project.  If you want to 
disassemble the output use:

$ objdump -d add.o

add.o:     file format elf32-powerpc

Disassembly of section .text:

00000000 <sub>:
   0:   7c 64 18 50     subf    r3,r4,r3
   4:   4e 80 00 20     blr

See, its really called subf which means that there are simplified 
mnemonics which are described right at the end of the PowerPC manual 
(Appendix F) just in case this ever drives somebody nuts.

Notice that you can also use inline assembly when using gcc. There is a 
nice manual page you can get with

$ info gcc

and then select:

C Extensions -> Extended Asm

This usually helps me.

 >(I have progrmmed in MVS/S390 and Windows/DOS Programming environment 
using Asssembly). 

The S390 seems to have an acceptable number of registers (16?) switching 
to x86/DOS must have been a pain, eh?

Now that I think about it you may have wanted to know about more 
involved things but this is what I have.

Regards,

K. Timmler

