From: Emanuele Altieri <ealtieri@hampshire.edu>
Subject: Re: newbie question on gnu 'as'
Date: 30 Jul 2002 17:34:05 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <1028064846.1151.11.camel@italia>
References: <20020730115914.24241.qmail@web14507.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-4C4x4ZFrpSTuVMTq7rfK"
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20020730115914.24241.qmail@web14507.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
To: ruxyz@yahoo.com
Cc: Linux Assembly List <linux-assembly@vger.kernel.org>


--=-4C4x4ZFrpSTuVMTq7rfK
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'm assuming that you want to keep your code as a boot program:

           .code16               # needed for booting
           .global _start
   _start:
           movw    $0xB800, %ax
           movw    %ax, %es
           movb    $0x41, %es:0  
           movb    $0x1f, %es:1
   loop1:  jmp     loop1


To assembly and link the program:

   as -o boot.o boot.s
   ld -s -oformat binary -Ttext 0x0 -o boot boot.o

The last command creates the "boot" file that is ready to be 
installed in the first sector of the floppy disk:

   dd seek=0 if=boot of=/dev/fd0


Hope this helps

  -Emanuele


On Tue, 2002-07-30 at 07:59, Anticipating a Reply wrote:
> Hi Everybody,
> 
>         I have got a small piece of Assembly code ,
> which writes a character "A" on the screen .
> 
>   The below program is compiled and written 
> to the boot sector of a floppy. It compiles
> using the command :
> 
> 	as86 boot.s -o boot.o
> 	ld86 -d boot.o -o boot 
> 
>    I want to rewrite it in AT&T syntax and
> want to use GNU "as" assembler to compile it .
> I tried doing it ,but with no success .
> 
>   Can anybody please help me rewite the
> below code in AT&T syntax and tell me how
> to compile & link it ?
> 
>    Thanks in Advance .
> 
> With Best Regards
> 
> 
> THE CODE :
> ------------
> 
> 
> entry start 
> 
> start: 
>        mov ax,#0xb800 ; Video Memory address is 0xb800
>   
>        mov es,ax      ; Video Memory is made as Extra
> Segment
>        seg es         ; Makes next instruction execute
> wrt Extra Segment 
>        mov [0],#0x41  ; ASCII value of the Character
> to be displayed 
>                       ;  in 1-row & 1-column
>        seg es         ; Makes next instruction execute
> wrt Extra Segment 
>        mov [1],#0x1f  ; Attribute of the Character to
> be displayed
>                       ;  in 1-row & 1-column
>                       ; 0x1f represents White
> Character on a Blue Background
> loop1: 
>        jmp loop1
> 
> 
> ________________________________________________________________________
> Want to sell your car? advertise on Yahoo Autos Classifieds. It's Free!!
>        visit http://in.autos.yahoo.com
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=-4C4x4ZFrpSTuVMTq7rfK
Content-Disposition: attachment; filename=boot.s
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=boot.s; charset=ISO-8859-1

# boot.s
#
# To assembly and link as a **boot** program:
#
#    as boot.s -o boot.o
#    ld -s -oformat binary -Ttext 0x0 -o boot boot.o
#
# To copy it to the boot sector of a floppy disk:
#
#    dd seek=3D0 if=3Dboot of=3D/dev/fd0
#
# ---
# Emanuele (ealtieri@hampshire.edu)
=09
	.code16
	.global _start
_start:
	movw	$0xB800, %ax
	movw	%ax, %es
	movb	$0x41, %es:0
	movb	$0x1f, %es:1
loop1:	jmp	loop1

--=-4C4x4ZFrpSTuVMTq7rfK--

