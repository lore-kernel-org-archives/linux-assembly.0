From: =?iso-8859-1?q?Anticipating=20a=20Reply?= <ruxyz@yahoo.com>
Subject: Re: Prblem with AT&T
Date: Sat, 10 Aug 2002 05:41:21 +0100 (BST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020810044121.24633.qmail@web14510.mail.yahoo.com>
References: <3D52969E.E87E83A9@wp.pl>
Reply-To: ruxyz@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3D52969E.E87E83A9@wp.pl>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: m_hrebien@wp.pl, linux-assembly@vger.kernel.org

Hi All !

  I got the below code compiled , but it does not 
give the desired results .

  I have two modules , stored on a  boot floppy .
The first module residing in the boot sector 
loads the second module ( residing 
on second sector of floppy )  into RAM and 
transfers control to it . The Second module 
prints a string onto the screen . 

  All the relevant code is given below . 
Please help this newbie  find out ,
what the problem is ?

  Thanks in Advance .

With Best Regards.


---------THE MAKEFILE --------

all : bsect sect2 write 

bsect : bsect.o 
	ld -s -oformat binary -Ttext 0x000 -o bsect bsect.o 

sect2 : sect2.o 
	ld -s -oformat binary -Ttext 0x500 -o sect2 sect2.o

bsect.o : bsect.s 
	as bsect.s -o bsect.o 

sect2.o : sect2.s 
	as sect2.s -o sect2.o 

write : write.c 
	cc write.c -o write 

clean : 
	rm bsect.o sect2.o bsect sect2 write
	
------( Module 1) bsect.s - Boot sector code
----------

.code16

.globl _start 

_start: 


	movw $0x500,%ax 
	movw %ax,%es 
	movw $0,%bx #segment offset 
	movb $0,%dl #drive no. 
	movb $0,%dh #head no. 
	movb $0,%ch #track no. 
	movb $2,%cl #sector no.( 1..18 ) 
	movb $1,%al #no. of sectors tranferred 
	movb $2,%ah #function no. 
	int  $0x13 

	ljmp $0x500,$0

-----(Module 2)sect2.s -Code in 2nd sector --------


.code16

.data

mymsg: 
	.byte 13,10 
	.ascii "Handling BIOS interrupts"
.text

.globl _start 

_start: 
	movb $0x03,%ah   # read cursor position. 
	xor  %bh,%bh
 
	int  $0x10 

	movw $26,%cx     # length of our beautiful string. 
	movw $0x0007,%bx # page 0, attribute 7 (normal) 
	movw $mymsg,%bp 
	movw $0x1301,%ax # write string, move cursor 

	int  $0x10 
	
loop1: 
        jmp loop1 
	

------------ write.c ---------------------

/*
 * Program to write to boot sector and
 * desired code to second sector 
 *
*/

#include <sys/types.h> /* unistd.h needs this */ 
#include <unistd.h> /* contains read/write */ 
#include <fcntl.h> 

int main() 
{ 
	char boot_buf[512]; 
	int floppy_desc, file_desc; 
	
	file_desc = open("./bsect", O_RDONLY); 
	read(file_desc, boot_buf, 510); 
	close(file_desc); 

	boot_buf[510] = 0x55; 
	boot_buf[511] = 0xaa; 
	
	floppy_desc = open("/dev/fd0", O_RDWR); 
	lseek(floppy_desc, 0, SEEK_SET); 
	write(floppy_desc, boot_buf, 512);

 
	file_desc = open("./sect2", O_RDONLY); 
	read(file_desc, boot_buf, 512); 
	close(file_desc); 

	lseek(floppy_desc, 512, SEEK_SET); 
	write(floppy_desc, boot_buf, 512); 
	close(floppy_desc); 

}

---------------------THE END ----------------------






 --- Maciej Hrebien <m_hrebien@wp.pl> wrote: >
Anticipating a Reply wrote:
> > 
> >  But I get the error in "ld" .
> > 
> > sect2.o: In function `_start':
> > sect2.o(.text+0xd): relocation truncated to fit:
> > R_386_16 data
> > 
> > 
> > -------------AT&T SYNTAX --------------------
> > 
> > .code16
> > 
> > .align 4
> > 
> > .data
> > 
> > mymsg:
> >         .byte 13,10
> >         .ascii "Handling BIOS interrupts"
> > 
> > .text
> > 
> > .globl _start
> > 
> > _start:
> >         movb $0x03,%ah   # read cursor position.
> >         xor  %bh,%bh
> > 
> >         int  $0x10
> > 
> >         movw $24,%cx     # length of our beautiful
> string.
> >         movw $0x0007,%bx # page 0, attribute 7
> (normal)
> >         movw $mymsg,%bp
> >         movw $0x1301,%ax # write string, move
> cursor
> > 
> >         int  $0x10
> > 
> > loop1:
> >         jmp loop1
> 
> try ld like this:
> 
> ld -Ttext 0x0 -o beauty_str beauty_str.o
> 
> it works but You must set right "text" address -
> more useful to You than
> 0x0 in this example.
> 
> Regards
> 
> -- 
> Maciej Hrebien
> 
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
http://vger.kernel.org/majordomo-info.html 

________________________________________________________________________
Want to sell your car? advertise on Yahoo Autos Classifieds. It's Free!!
       visit http://in.autos.yahoo.com
