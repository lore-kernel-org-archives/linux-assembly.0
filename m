From: =?iso-8859-1?q?Anticipating=20a=20Reply?= <ruxyz@yahoo.com>
Subject: Re: Assembly Newbie - about real mode / protected mode basics
Date: Wed, 29 Jan 2003 06:49:18 +0000 (GMT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030129064918.72261.qmail@web41115.mail.yahoo.com>
References: <20030128133400.90160.qmail@web41113.mail.yahoo.com>
Reply-To: ruxyz@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20030128133400.90160.qmail@web41113.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ruxyz@yahoo.com, Assembly Linux <linux-assembly@vger.kernel.org>

Hello All , 

  I resolved the problem , by 
changing the linker option as below :

ld -oformat binary -tText 0x7c00 -tdata 0x7d00 -o code
code.o

in the Makefile .

   Thanks for bearing with me .

Regards !
 
--- Anticipating a Reply <ruxyz@yahoo.com> wrote: > Hi
All , 
> 
>   I'am trying to write a assembly program
> (using AT&T syntax , with gas on linux ) to 
> understand the basics of the different modes 
> in x-86 processors .
> 
>    Here I try to first print a message in Real mode
> ,
> and then I try to print a message in Protected mode
> .But I get relocation errors during linking stage .
> 
> THE ERROR :
> prompt>> make
> 
> as code.s -o code.o 
> ld -oformat binary -o code code.o
> code.o: In function `begin_boot':
> code.o(.text+0x7c59): relocation truncated to fit:
> R_386_16 data
> make: *** [code] Error 1
> 
>    I did a objdump -d code.o and found some problem
> around the lgdt instruction , but could not debug it
> .
>  
>    I plan to put  this code on the floppy . 
> 
>    All the code goes below .
> 
>    Hope somebody will help me out of this .
> 
>    Thanks in advance .
> 
> ****************************************************
> 
> /* The make file */ 
> 
>  all : code write
>  
>  code : code.o
>     ld -oformat binary -o code code.o
>  code.o : code.s
>     as code.s -o code.o
>  write : write.c
>     cc write.c -o write
>  
>  clean :
>     rm code.o code write
> 
>
*****************************************************
> 
> /* write.c 
>  *
>  * Program to write to boot sector 
>  *
>  */
> 
> #include <sys/types.h> /* unistd.h needs this */ 
> #include <unistd.h> /* contains read/write */ 
> #include <fcntl.h> 
> 
> int main() 
> { 
> 	char boot_buf[512]; 
> 	int floppy_desc, file_desc; 
> 	
> 	file_desc = open("./code", O_RDONLY); 
> 	read(file_desc, boot_buf, 510); 
> 	close(file_desc); 
> 
> 	boot_buf[510] = 0x55; 
> 	boot_buf[511] = 0xaa; 
> 	
> 	floppy_desc = open("/dev/fd0", O_RDWR); 
> 	lseek(floppy_desc, 0, SEEK_SET); 
> 	write(floppy_desc, boot_buf, 512);
> 
> 	close(floppy_desc); 
> 
> }
> 
> ***************************************************
> 
> # THE ASSEMBLY FILE - code.s
> 
> .code16
> .org 0x07c00     # Start address 0000:7c00
> 
> .globl _start 
> _start:
> 	jmp begin_boot   # Jump to start of boot routine &
> skip other data
> 
> .data  
> 
> bootmesg:
>         .ascii "Our OS boot sector loading ......"
> pm_mesg:
>         .ascii "Switching to protected mode ...."
> 
> .word 512           # Bytes per sector
> .byte 1		    # Sectors per cluster
> .word 1		    # Number of reserved sectors
> .byte 2		    # Number of FATs
> .word 0x00e0	    # Number of dirs in root
> .word 0x0b40 	    # Number of sectors in volume
> .byte 0x0f0	    # Media descriptor
> .word 9		    # Number of sectors per FAT
> .word 18		# Number of sectors per track
> .word 2		    # Number of read/write sectors
> .word 0		    # Number of hidden sectors
> 
>
#############################################################
> 
> .text
> 
> print_mesg :
>    movb $0x13,%ah    # Fn 13h of int 10h writes a
> whole string on screen
>    movb $0x00,%al    # bit 0 determines cursor
> pos,0->point to start 
>                      # after function call,1->point
> to
> last position 
> 				     # written
>    movw $0x0007,%bx  # bh -> screen page ie 0,bl =
> 07
> ie white on black
>    movw $0x20,%cx	 # Length of string here 32 
>    movw $0x0000,%dx	 # dh->start cursor
> row,dl->start
> cursor column
>    int $0x10	     # call bios interrupt 10h
>    ret
> 
>
#############################################################
> 
> get_key :
>    movb $0x00,%ah	  
>    int $0x16        # Get_key Fn 00h of 16h,read
> next
> character
>    ret
> 
>
#############################################################
> 
> clrscr :
>    movw $0x0600,%ax # Fn 06 of int 10h,scroll window
> up,if al = 0 clrscr
>    movw $0x0000,%cx # Clear window from 0,0 
>    movw $0x174f,%dx # to 23,79
>    movb $0,%bh	    # fill with colour 0
>    int $0x10	    # call bios interrupt 10h
>    ret
> 
>
#############################################################
> 
> .code16
> 
> begin_boot :
>    call clrscr         # Clear the screen first
>    movl $bootmesg,%ebp # Set the string ptr to
> message
> location
>    call print_mesg     # Print the message
>    call get_key	       # Wait till a key is pressed
> 
>    call clrscr	       # Clear the screen
>    movw $0xb800,%ax	   # Load gs to point to video
> memory
>    movw %ax,%gs	       # We intend to display a
> brown
> A in real mode
>    movw $0x641,%gs:0   # display
>    call get_key        # Get_key again,ie display
> till
> key is pressed	
> 
>    movl $pm_mesg,%ebp  # Set string pointer   	
>    call print_mesg	   # Call print_mesg subroutine  
> 
>    call get_key        # Wait till key is pressed
>    call clrscr         # Clear the screen
> 
>    cli		       # Clear or disable interrupts
> 
>    lgdt gdtr	       # Load GDT	
> 
>    movl %cr0,%eax	   # The lsb of cr0 is the
> protected
> mode bit
>    orb  $0x01,%al	   # Set protected mode bit
>    movl %eax,%cr0	   # Mov modified word to the
> control register
> 
>    ljmpl  $codesel ,$go_pm
> 
> .code32
> 
> go_pm : 
>    movw $datasel,%ax   
>    movw %ax,%ds	       # Initialise ds & es to data
> segment
> 
>    movw %ax,%es	
>    movw $videosel,%ax      # Initialise gs to video
> memory
> 
>    movw %ax,%gs	
>    movw $0x741,%gs:0   # Display white A in
> protected
> mode
> spin : 
>      jmp spin          # Loop
> 
>
##################################################################
> 
> .data 
> 
> gdtr :
> .word (gdt_end - gdt-1)# Length of the gdt
> .long gdt		       # physical address of gdt
> 
> gdt : 
> .equ nullsel, .- gdt   # .->current location,so
> nullsel = 0h
> gdt0 : 		       # Null descriptor,as per convention
> gdt0 is 0
> .long 0		       # Each gdt entry is 8 bytes, so at
> 08h
> it is CS
> .long 0                # In all the segment
> descriptor
> is 64 bits
> 
> .equ codesel, .- gdt   # This is 8h,ie 2nd
> descriptor
> in gdt
> code_gdt:		   # Code descriptor 4Gb flat segment at
> 0000:0000h
> .word    0x0ffff	   # Limit 4Gb  bits 0-15 of
> segment
> descriptor
> .word    0x0000	       # Base 0h bits 16-31 of
> segment
> descriptor (sd)
> .byte 0x00             # Base addr of seg 16-23 of
> 32bit addr,
>                        # 32-39 of sd	
> .byte 0x09a	       # P,DPL(2),S,TYPE(3),A->Present
> bit
> 1,Descriptor
>                        # privilege level 0-3,Segment
> descriptor 1 
>          		   #   ie code
> 			   # or data seg descriptor,Type of seg,Accessed
> bit
> .byte 0x0cf	       # Upper 4 bits G,D,0,AVL ->1
> segment len is page
>                        # granular, 1 default
> operation
> size is 32bit seg
> 			   # AVL : Available field for user or OS
> 			   # Lower nibble bits 16-19 of segment limit
> .byte 0x00	       # Base addr of seg 24-31 of 32bit
> addr,
>                        # 56-63 of sd
> 
> .equ datasel, .-gdt    # ie 10h, beginning of next 8
> bytes for data sd
> data_gdt:		   # Data descriptor 4Gb flat seg at
> 0000:0000h
> .word 0x0ffff	       # Limit 4Gb
> .word 0x0000	       # Base 0000:0000h
> .byte 0x00	       # Descriptor format same as above
> .byte 0x092
> .byte 0x0cf
> .byte 0x00
> 
> .equ videosel, .- gdt  # ie 18h,next gdt entry
> .word 3999	       # Limit 80*25*2-1
> .word 0x8000	       # Base 0xb8000
> .byte 0x0b
> .byte 0x92	       # present,ring
> 0,data,expand-up,writable
> .byte 0x00	       # byte granularity 16 bit
> .byte 0x00
> 
> gdt_end:
> 
>
###############################################################
> 
> 
> 
>
________________________________________________________________________
> Missed your favourite TV serial last night? Try the
> new, Yahoo! TV.
>        visit http://in.tv.yahoo.com
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

________________________________________________________________________
Missed your favourite TV serial last night? Try the new, Yahoo! TV.
       visit http://in.tv.yahoo.com
