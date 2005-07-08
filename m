From: Vadim Lobanov <vlobanov@speakeasy.net>
Subject: Re: x86 Endiannes and libc printf
Date: Fri, 8 Jul 2005 12:25:53 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0507081212270.24940@shell4.speakeasy.net>
References: <42117.62.38.142.34.1120849517.squirrel@webmail.wired-net.gr>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <42117.62.38.142.34.1120849517.squirrel@webmail.wired-net.gr>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nanakos Chrysostomos <nanakos@wired-net.gr>
Cc: linux-assembly@vger.kernel.org

The x86 architecture is little endian. By definition, "little endian"
means that the little end of a multi-byte number is stored first. In
other words, if you want to store the integer value '1', then the bytes
will be arranged in the following order in memory:
  0x01 0x00 0x00 0x00

In your example below, the bytes are arranged in the following order:
  0x44 0x43 0x42 0x41
since that's the order in which they were read from the file.
That's why when you print the first byte in the buffer, you get
0x44. However, because x86 is little endian, it will interpret 0x44 as
the low-order digits in the "overall number", and 0x41 as the high-order
digits in the "overall number".

Printf doesn't need to do anything special when printing the number. I
don't remember the code offhand, but it probably does something along
the lines of:
    while (num != 0) {
	print(num & 0x0000000F);
        go to previous character;
        num >>= 4;
    }
The processor is the one that takes that 4-byte quantity and treats the
first bit as low-order (first to get split off by the mask and shift).
That's what makes the processor little endian.

Big endian flip the byte order, as you might expect. They store the big
end of the number in the first byte, etc.

Hope that was more clear than confusing. :-)

- Vadim L

On Fri, 8 Jul 2005, Nanakos Chrysostomos wrote:

> Hi all,
> i am searching for a few hours now the endianness in the x86
> environment,and i have the following
> snippets of code,which in some places i cant understand.Please help me!!!
>
> endian.c
> ---------
> #include <stdio.h>
> #include <fcntl.h>
> #include <sys/types.h>
>
>
> int main()
> {
>         char *filename= "endian.txt";
>         unsigned long buf;
>         char *k=(char *)&buf;
>         int fd;
>
>         fd = open("makis",O_RDONLY);
>
>         read(fd,&buf,4);
>
>         printf("%.4s\n",&buf);
>         printf("%p\n",buf);
>         printf("&buf: %p %#x %p\n",&buf,*k,k);
>         return 0;
> }
>
> endian.txt
> ----------
> DBCA
>
>
> #./read
> DCBA
> 0x41424344
> &buf: 0xbffff8b0 0x44 0xbffff8b0
> #
>
>
> In the first printf everything is fine.In the second printf we see that
> the 0x44,0x43,0x42,0x41 byte-data is printed in the revserse order,while
> we can see
> that in memory it is in the right order after the read system call.Why
> this happens?Is it being internal in printf???
>
>
> I tried to explain that with similar approaches like unions, but the same
> happens.endian2.c
> ---------
> #include <stdio.h>
> #include <unistd.h>
>
> int   main()
> {
>
>         union {
>                 long   s;
>                 char    c[sizeof(long)];
>         } un;
>
>         un.s = 0x41424344;
>         if (sizeof(short) == 2) {
>                 if (un.c[0] == 0x41 && un.c[1] == 0x42)
>                         printf("big-endian\n");
>                 else if (un.c[0] == 0x44 && un.c[1] == 0x43)
>                         printf("little-endian\n");
>                 else
>                         printf("unknown\n");
>         } else
>                 printf("sizeof(short) = %d\n", sizeof(short));
>
>
>         printf("%.4s\n",&(un.s));
>         printf("%p\n",(un.s));
>         _exit(0);
>
> }
>
>
>
> The same as above.Should i assume that an internal operation in printf is
> doing this???
>
>
> I also used the above assembly example,to see what
> happens.Memory-to-memory movements (with push & pop) dont inherit the
> little-endian way.Is this
> happens only from memory-to-register and the opposite????
>
> read.asm
> --------
> section .bss
> buf     resd    1
>
> section .data
>         pathname db "makis",0
> section .text
>
> global _start
>
> _start:
>
> ;open
> mov eax,5
> mov ebx,pathname
> mov ecx,02
> int 0x80
>
>
> ;read
> mov ebx,eax
> mov eax,3
> mov ecx,buf
> mov edx,4
> int 0x80
>
> ;write
> mov eax,4
> mov ebx,1
> mov ecx,buf
> mov edx,4
> int 0x80
>
> ;exit
> mov eax,1
> mov ebx,0
> int 0x80
>
>
> Everything works just fine.Can anynone knows how can i revserse the order
> of the data,from 0x44434241 to 0x41424344 into the stack?? Without using
> AND and OR.Can
> this be done????
>
>
> The last two examples is the output from gcc,one "fixed" from me to find
> out what is in the stack and the other is the default output from the
> first example.My example
> has been changed only in the printf call from the library,after the read
> call,which i suppose is the "black box" to the "problem" i cant
> understand...........read.s
> ------
>         .file   "read.c"
>         .version        "01.01"
> gcc2_compiled.:
>                 .section        .rodata
> .LC0:
>         .string "makis"
> .LC1:
>         .string "%#x\n"
> .text
>         .align 4
> .globl main
>         .type    main,@function
> main:
>         pushl   %ebp
>         movl    %esp, %ebp
>         subl    $24, %esp
>         movl    $.LC0, -4(%ebp)
>         subl    $8, %esp
>         pushl   $0
>         pushl   $.LC0
>         call    open
>
>         addl    $16, %esp
>         movl    %eax, %eax
>         movl    %eax, -12(%ebp)
>         subl    $4, %esp
>         pushl   $4
>         leal    -8(%ebp), %eax
>         pushl   %eax
>         pushl   -12(%ebp)
>         call    read
>
> ---->Before it was the printf call which retrieves its arguments from the
> stack.Which as we can see its different for every conversion specifier..
>
>         movl    $4,%eax
>         movl    $1,%ebx
>         leal    -8(%ebp),%ecx
>         movl    $4,%edx
>         int     $0x80
>
>
>         movl    $1, %eax
>         movl    $0,%ebx
>         int $0x80
> .Lfe1:
>         .size    main,.Lfe1-main
>         .ident  "GCC: (GNU) 2.96 20000731 (Red Hat Linux 7.3 2.96-110)"
>
>
>
> Can someone please help me with that???
>
> Thanks in advance,Chris.
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
