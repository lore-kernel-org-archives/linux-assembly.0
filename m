From: Tomas Kouba <tomas@jikos.cz>
Subject: RE: c code and asm code linking
Date: Fri, 29 Nov 2002 13:08:33 +0100 (CET)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44-jikos1.0211291303120.10444-100000@twin.jikos.cz>
References: <000001c296b7$76d53120$8172d73f@joe>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <000001c296b7$76d53120$8172d73f@joe>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Joseph D. Wagner" <wagnerjd@prodigy.net>
Cc: 'kiran kumar' <kathireddy01@yahoo.com>, linux-assembly@vger.kernel.org

Or you can do it the way you do it but you must must link the final 
executable with appropriate libs.
gcc does linking after compiling when you ommit -c option. And it links 
with many libs and .o files such as standard c lib etc.
You can see them:

$ gcc -v x.c 
...
GNU assembler version 2.10.91 (i386-redhat-linux) using BFD version 
2.10.91.0.2
 /usr/lib/gcc-lib/i386-redhat-linux/2.96/collect2 -m elf_i386 
-dynamic-linker /lib/ld-linux.so.2 
/usr/lib/gcc-lib/i386-redhat-linux/2.96/../../../crt1.o 
/usr/lib/gcc-lib/i386-redhat-linux/2.96/../../../crti.o 
/usr/lib/gcc-lib/i386-redhat-linux/2.96/crtbegin.o 
-L/usr/lib/gcc-lib/i386-redhat-linux/2.96 
-L/usr/lib/gcc-lib/i386-redhat-linux/2.96/../../.. /tmp/cc4GOXrE.o -lgcc 
-lc -lgcc /usr/lib/gcc-lib/i386-redhat-linux/2.96/crtend.o 
/usr/lib/gcc-lib/i386-redhat-linux/2.96/../../../crtn.o


> asm {
> Assembly Code Here;
> Use semi-colon to separate lines;
> }
> 
> Note: some implementations use () instead of {}.  See your compiler's
> specific asm documentation.
> 
> Joseph Wagner
> 
> -----Original Message-----
> From: linux-assembly-owner@vger.kernel.org
> [mailto:linux-assembly-owner@vger.kernel.org] On Behalf Of kiran kumar
> Sent: Thursday, November 28, 2002 1:06 AM
> To: linux-assembly@vger.kernel.org
> Subject: c code and asm code linking
> 
> Sir,
>  i am trying to call a asm routine in C model, for
> testing i have taken a small program. 
>  
>  my main program is 
> ====================================
> #include<stdio.h>
> 
> extern int BSWAP ( unsigned int a);
> 
> void main()
>   {
> 
>     unsigned int a ;
>     unsigned int b;
> 
>      a=255;
> 
>     b= BSWAP(a);
> 
>     printf(" a = %d b = %d",a,b);
>   return;
>   }
> =========================================
> 
> my bswap.asm code is 
> =========================================
> bits 32
> 
> section .data
> align 16
> 
> section .text
> 
> 
> ;=======================================================================
> ====
> ;
> ; uint32_t bswap(uint32_t a);
> ;
> ;=======================================================================
> ====
> 
> align 64
> 
> global _BSWAP
> 
> _BSWAP
>                 mov     eax, [esp+4]
>                 bswap eax
>                 ret
> 
> ==================================
> 
> i have complied the asm code using 
> $nasm -f elf bswap.asm 
>  i got bswap.o
> then i compiled main code using
> gcc -c main.c
> 
> then i used ld to link
> 
> $ ld -o test main.o bswap.o
> 
> it is giving the error
> ld: warning: cannot find entry symbol _start;
> defaulting to 08048080
> main.o: In function `main':
> main.o(.text+0x14): undefined reference to `BSWAP'
> main.o(.text+0x2d): undefined reference to `printf'
> 
> sir, help me in resolving this linking problem.
> 
>  thanking you sir
> kiran kumar k
> 
> __________________________________________________
> Do you Yahoo!?
> Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
> http://mailplus.yahoo.com
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
-- Tomas Kouba

