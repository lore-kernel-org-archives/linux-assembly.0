From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: Prblem with AT&T
Date: Sat, 10 Aug 2002 13:47:35 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D54FD57.9E453151@wp.pl>
References: <20020810044121.24633.qmail@web14510.mail.yahoo.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Anticipating a Reply wrote:
> 
> Hi All !
> 
>   I got the below code compiled , but it does not
> give the desired results .
> 
>   I have two modules , stored on a  boot floppy .
> The first module residing in the boot sector
> loads the second module ( residing
> on second sector of floppy )  into RAM and
> transfers control to it . The Second module
> prints a string onto the screen .

I've tried very similar code some time ago and all the information
needed to assembly and link it properly i've found in "info as" &
Linux's arch/i386/boot/Makefile. Try to study it, it's very interesting
lecture ;)
 
>   All the relevant code is given below .
> Please help this newbie  find out ,
> what the problem is ?

I've chceck it. bsect.s, sect2.s & write.c are OK but Makefile is wrong!
Please look below.
 
> ---------THE MAKEFILE --------
> 
> all : bsect sect2 write
> 
> bsect : bsect.o
>         ld -s -oformat binary -Ttext 0x000 -o bsect bsect.o

ld --oformat binary -Ttext 0x0 -o bsect bsect.o

   ^^ 2 "-" are needed & "-s" isn't useful for us
 
> sect2 : sect2.o
>         ld -s -oformat binary -Ttext 0x500 -o sect2 sect2.o

ld --oformat binary -Ttext 0x0 -Tdata 0x1c -o sect2 sect2.o

The same thing with "-" & "-s". The text section in this "module" begins
at 0x0 address and the data section is 0x1c bytes after text section.
This is needed to properly do:

mov $mymsg,%bp

and see the beautiful string :)

Hope I helped You, regards
 
> bsect.o : bsect.s
>         as bsect.s -o bsect.o
> 
> sect2.o : sect2.s
>         as sect2.s -o sect2.o
> 
> write : write.c
>         cc write.c -o write
> 
> clean :
>         rm bsect.o sect2.o bsect sect2 write
> 
> ------( Module 1) bsect.s - Boot sector code
> ----------
> 
> .code16
> 
> .globl _start
> 
> _start:
> 
>         movw $0x500,%ax
>         movw %ax,%es
>         movw $0,%bx #segment offset
>         movb $0,%dl #drive no.
>         movb $0,%dh #head no.
>         movb $0,%ch #track no.
>         movb $2,%cl #sector no.( 1..18 )
>         movb $1,%al #no. of sectors tranferred
>         movb $2,%ah #function no.
>         int  $0x13
> 
>         ljmp $0x500,$0
> 
> -----(Module 2)sect2.s -Code in 2nd sector --------
> 
> .code16
> 
> .data
> 
> mymsg:
>         .byte 13,10
>         .ascii "Handling BIOS interrupts"
> .text
> 
> .globl _start
> 
> _start:
>         movb $0x03,%ah   # read cursor position.
>         xor  %bh,%bh
> 
>         int  $0x10
> 
>         movw $26,%cx     # length of our beautiful string.
>         movw $0x0007,%bx # page 0, attribute 7 (normal)
>         movw $mymsg,%bp
>         movw $0x1301,%ax # write string, move cursor
> 
>         int  $0x10
> 
> loop1:
>         jmp loop1
> 
> 
> ------------ write.c ---------------------
> 
> /*
>  * Program to write to boot sector and
>  * desired code to second sector
>  *
> */
> 
> #include <sys/types.h> /* unistd.h needs this */
> #include <unistd.h> /* contains read/write */
> #include <fcntl.h>
> 
> int main()
> {
>         char boot_buf[512];
>         int floppy_desc, file_desc;
> 
>         file_desc = open("./bsect", O_RDONLY);
>         read(file_desc, boot_buf, 510);
>         close(file_desc);
> 
>         boot_buf[510] = 0x55;
>         boot_buf[511] = 0xaa;
> 
>         floppy_desc = open("/dev/fd0", O_RDWR);
>         lseek(floppy_desc, 0, SEEK_SET);
>         write(floppy_desc, boot_buf, 512);
> 
> 
>         file_desc = open("./sect2", O_RDONLY);
>         read(file_desc, boot_buf, 512);
>         close(file_desc);
> 
>         lseek(floppy_desc, 512, SEEK_SET);
>         write(floppy_desc, boot_buf, 512);
>         close(floppy_desc);
> 
> }
> 
> ---------------------THE END ----------------------

-- 
Maciej Hrebien

