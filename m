From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: bootloader prob
Date: Thu, 11 Dec 2003 15:17:00 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FD87C5C.7070505@eprocess.fr>
References: <3FB27DF6.9060003@tiscali.it> <04e301c3a946$5179af80$6501a8c0@rhyde> <3FB2845B.8070508@tiscali.it> <200311130352.01362.wklux@yahoo.co.uk> <3FB3535C.3070104@tiscali.it> <3FB34D7A.3010406@eprocess.fr> <3FD87CCB.3060503@tiscali.it>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020302000605070901060800"
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3FD87CCB.3060503@tiscali.it>
List-Id: <linux-assembly.vger.kernel.org>
To: zad <zacido@tiscali.it>
Cc: linux-assembly@vger.kernel.org

This is a multi-part message in MIME format.
--------------020302000605070901060800
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Zad,
I cc the assembly list, as it may be interesting for others, and others 
may contribute to help you.

I share part of my work for a custom bootloader. It may (not?) be 
re-usable as is, but it may be a good start for making your own.
As I cut out some parts, I hope it stays understandable..

I start by the end: the installation:
Here is the script I made to install my bootsector:
(see the install.sh file)
=> work on the MBR, as it is the basic (you must use extended bios 
functions if you want to go far on the disk, so, stay basic first! plus, 
some custom bioses only want boot-loade on the MBR)
=> get the disk partition table (else, you erase the partition table, 
and your disk will be unusable)
=> put it into your boot-loader image (zenboot.b here)
=> write all that into the disk
=> be carefull: you will erase the bootsector of the disk, and you may 
corrupt raw data if an error is made somewhere...
Use a spare disk!

My code is made of several ASM files. I don't use C for that.
(see the Makefile)

Now, the asm code.
I've not a lot of time, so, quickly:

#define ZEN_SEG 0x6000
        .text
        .globl  _main
        .org    0
zero:
_main:  cli
        mov     ax,#0x7c0       ;copy itself to an other location
        mov     ds,ax
        mov     ax,#ZEN_SEG     ;destination
        mov     es,ax
        mov     cx,#0x100       ;512 bytes
        sub     si,si
        sub     di,di
        cld
        rep
                movsw
        jmp     #ZEN_SEG:firstStage             ;start there
;Some data here
firstStage:
;To see if your code is working fine, just test the video!
        mov     ah,#0                   ;set mode
        mov     al,#0x3                 ;stay in text mode (80*25 colored)
        int     #0x10
        mov     ah,#9           ;display chars
        mov     bh,#0           ; page number
        mov     cx,#80*25       ; fill the screen
        mov     al,#3           ; with nice hearts! ;-)
        int     #0x10
;Here, you can put all you want, but be carefull, the size is very limited!
; see the next lines

;The first part must stands in 445 bytes (0x1bd), because the partition 
table is here
;I must secure a little bit this prog to prevent unespected error!
if *>0x1bd
fail This program1 is to stand in 0x1bd (445) bytes! It is too big!
endif
        .org    0x1fe   ; skip the partition table
        dw      0xAA55  ; the Boot signature
;you can put some code (or data) here too.


Well, with this, I think you can have nice hearts in the screen at boot. 
It's a good start, no?
Once you're done with this, try by yourself to follow, and ask me (use 
the list please) if you have problems.
Before playing with the disk (loading more data than the 1st sector), 
try to make a simple 'hello world' like this to work.
The second step will be to add more sectors of data, to load them and to 
make them run.
After that only you would be able to try to load the kernel.

Hope it helps

Fred



zad wrote:

>
>
> Frederic Marmond wrote:
>
>> it is pretty easy:
>> get the lilo source, and remove all around the first.S in the makefile.
>> Then, you'll see some 'dd' calls, to get only the good part of your 
>> prog.
>> It took me one hour to make the framework of my own boot loader this 
>> way!
>> You'll have to code it in 100% assembly, but it is very easy (not 
>> linux related though), in real mode, bios calls for disk access, ...
>> Read the documentation and have a look at the lilo first.S code!
>>
>> Then, to test it (raw basic way):
>> - get a spare HD (more secure)
>> - put your resulting code into the MBR (dd if=your_resulting_bin 
>> of=/dev/hdc for exemple)
>> - add the entry to your lilo.conf file (other=/dev/hdc)
>> - try it with lilo! (you'll need to reboot), then, you'll be able to 
>> (reboot) get back to your linux
>>
>> If you need some more specific help, feel free to ask more precise 
>> question!
>>
>> Fred
>
>
> So I write directly to you ! ^_^
>
> I'm writing my bootloader (yes again ) .
> Can you take a look at these simple source an tell my where are my 
> mistakes?
>  I used these follow commands to compile and link :
>
> nasm -f bin boot.asm -o boot.bin
>
> gcc -ffreestanding -c main.c -o main.o
>
> gcc -c kernel.c -o kernel.o
>
> ld -e main -Ttext 0x1000 -o os.o  main.o kernel.o
>
> ld -i -e main -Ttext 0x1000 -o os.o  main.o kernel.o
>
> objcopy -R .note -R .comment -S -O binary os.o os.bin
>
> cat boot.bin os.bin | dd of=a.img
>
> dd if=a.img of=/dev/fd0
>
> then I used bochs to test it , but without any results
>
> PS : If you can't or want not help me reading this , please send me 
> some  link where I can find the answer or a way.
>
> thank a lot by zad
>
>------------------------------------------------------------------------
>
>[Bits 16]
>
>[org 0x7c00]
>
>reset_drive:
>        mov ah, 0               ; RESET-command
>        int 13h                 ; Call interrupt 13h
>        or ah, ah               ; Check for error code
>        jnz reset_drive         ; Try again if ah != 0
>
>        mov ax, 0
>        mov es, ax
>        mov bx, 0x1000          ; Destination address = 0000:1000
>
>        mov ah, 02h             ; READ SECTOR-command
>        mov al, 02h             ; Number of sectors to read = 1
>        mov ch, 0               ; Cylinder = 0
>        mov cl, 02h             ; Sector = 2
>        mov dh, 0               ; Head = 0
>        int 13h                 ; Call interrupt 13h
>        or ah, ah               ; Check for error code
>        jnz reset_drive         ; Try again if ah != 0
>
>
>cli 
>xor ax , ax	 	;metto a zero ax 
>mov ds , ax 		;metto a zero il data segment (base del segmento dati)
>lgdt[gdt_point]	        ;Carico la global descriptor table
>
>mov eax , cr0		;Inizio la procedura per entrare in pmode
>or eax , 1 		;metto il primo bit a 1
>mov cr0 , eax		;setto a 1 il primo bit di cr0
>
>    jmp 08h:lab		;Salto al codice a 32 bit
>
>[Bits 32]
>
>lab:
>      mov ax ,10h
>      mov ds , ax
>      mov ss ,ax
>      mov esp , 090000h
>      jmp 08h:01000h   		;salto nel punto in cui ho caricato il
>      	  			;secondo settore , segmento codice offset 01000h
>				
>
>gdt:
>gdt_null:
>	 dd 0
>	 dd 0
>
>gdt_code:
>	 dw 0ffffh
>	 dw 0
>	 db 0
>	 db 10011010b
>	 db 11001111b
>	 db 0
>gdt_data:
>	 dw 0ffffh
>	 dw 0
>	 db 0 
>	 db 10010010b
>	 db 11001111b
>	 db 0
>	 
>gdt_end:
>
>gdt_point:
>	 dw gdt_end - gdt -1
>	 dd gdt
>
>times 510 -($-$$) db 0
>      dw 0aa55h
>  
>
>------------------------------------------------------------------------
>
>void out(unsigned short   port ,unsigned char data)
>{
>   __asm__ ("out %%al , %%dx" : : "a" (data) , "d" (port));
>}
>
>unsigned char in(unsigned short port )
>{
>   unsigned char result;
>   __asm__ ("in %%dx , %%al " : "=a" (result) : "d" (port));
>   return result;
>}
>
>void clrscr()
>{
>   unsigned char *videomem= (unsigned char * )0xb8000;
>   int a,c=80*25;
>   for(a=0 ;a<*videomem ; a++)
>     {
>	*videomem++=0;
>	*videomem++=0;
>     }
>}
>  
>
>------------------------------------------------------------------------
>
>void main()
>{
>   clrscr();
>   for(;;);
>}
>
>	
>
>
>
>
>  
>


--------------020302000605070901060800
Content-Type: application/x-sh;
 name="install.sh"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="install.sh"

#!/bin/sh
#FMD: this script will install the bootsector!

if [ -z "$1" ];
then
	echo Usage: $0 disk
	echo where disk is "hdc", "sda", ...
	exit 1
fi

if ! [ "$USER" = "root" ]
then
	echo "you must be root to execute this script!"
	exit 2
fi

DISK="/dev/$1"
#DISK="$1"


	ifconfig eth0
	echo "host: $HOSTNAME"
	echo "Please, check your target host!"
	echo -n "You'll erase the disk $DISK first sectors. This will not erase the partition table, just your previous boot-loader code. Ok ? [N/o] "
	read answer
	if [ "$answer" = "o" ]
	then
                echo "Get the actual disk boot sector of $DISK" && dd if=$DISK of=bootsector.b.disk bs=1 count=512 || ( echo "Error 1 reading the target disk $DISK" ; exit 1 ) && \
                echo "Get the code part of zenboot" && dd if=zenboot.b of=bootsector.b bs=1 count=445 || ( echo "Error 2" ;exit 2 ) && \
                echo "Copy the partition table to the map"&& dd if=bootsector.b.disk of=bootsector.b bs=1 skip=445 seek=445 || ( echo "error3" ;exit 3 )&& \
		echo "Copy the remeaning part of the x86 code (55aa, data and second stage)"&& dd if=zenboot.b of=bootsector.b bs=1 skip=510 seek=510 || ( echo "error4"; exit 4 ) &&\
               echo write all to the DISK boot sector && dd if=bootsector.b of=$DISK || ( echo "error6 writing to the disk $DISK" ; exit 5 )&& echo "Ok, Zen installed on $DISK"
	else
		echo "Aborted by user"
	fi

--------------020302000605070901060800
Content-Type: text/plain;
 name="Makefile"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Makefile"

SHELL=/bin/sh
CC=gcc
CPP=$(CC) -E
AS86=as86 -2 -O
LD86=ld86 -0
NASM=nasm

CFLAGS=$(OPT) -Wall -g $(PCONFIG)
LDFLAGS=#-Xlinker -qmagic

.SUFFIXES:	.img .b .com .S .s

all: zenboot.b

.c.o:
		$(CC) -c $(CFLAGS) $*.c

.s.o:
		$(AS86) -w -l $*.lis -m -o $*.o $*.s

.o.img:
		$(LD86) -s -o $*.img $*.o

.img.b:
		dd if=$*.img of=$*.b bs=32 skip=1

zen.s:		zen.S zen.h data1.S zen1.S data2.S zen2.S zendata.h
		gcc-3.3 -E -o zen.s zen.S -D ZEN_ASM

zen.o:		zen.s

zen.img:	zen.o
zen.b:		zen.img

zenboot.b:	zen.b
		cp zen.b zenboot.b

clean:
		rm -f *.o *.s *.i *.img *.b *.lis

--------------020302000605070901060800--

