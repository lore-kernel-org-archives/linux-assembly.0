From: "httu" <httu@tma.com.vn>
Subject: RE: please help me
Date: Wed, 10 May 2006 21:05:32 +0700
Message-ID: <000001c6743a$ce133bd0$c41e1ec7@TuThuyHa>
References: <4460C09B.70107@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4460C09B.70107@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Frank Kotler' <fbkotler@comcast.net>
Cc: linux-assembly@vger.kernel.org

Hi Frank,

I am aware of segment assumption problem but I am still trapped :(

I think the wrong installation of address of interrupt_handler cause the CPU
to jump to the wrong place and the code at that place make the floppy
drive's motor to run forever. When I install the right address of
interrupt_handler, the floppy drive is turned off right the way.

Thank you for your aware of STACK_SIZE. Now, I understand why my CPU runs so
slow!!!
I have changed it to match memory alignment of 4 and it run as it should.

I realize the potential bug when changing %ss, %sp that way. I am a new
assembly programmer.
Please correct me any points or programming style. Thanks a lot :)


>Hope it helped. I haven't tested your code - what's the command-line to 
>as? "-oformat=binary"? (I'm a Nasm user).
Yes, the command-line to is "-oformat=binary"

By the way, please give me any links to websites or books, articles,
documents etc. that talk about the memory organization, memory map or memory
status (I don't know the correct term) right after the bios finishes POST
and tries to load boot sector. Or just give me the correct key words to
search them.

Do you have any good documents, books, etc. talking about the whole BIOS
API? Free or commercial ones are ok :)

Best regards,

Tuha.


-----Original Message-----
From: Frank Kotler [mailto:fbkotler@comcast.net] 
Sent: Tuesday, May 09, 2006 11:18 PM
To: httu
Cc: linux-assembly@vger.kernel.org
Subject: Re: please help me

Hi Tuha,

> Coming on with my bootin :)

Good!

> I install my interrupt handler at the vector 0x21.
> But I cannot reach the interrupt handler.

Another segment:offset mismatch, I think. The label "interrupt_handler" 
is calculated as the offset into the file, plus any ".org" we specify - 
none, in this case. This is correct with respect to BOOTSEG, 0x7C0. 
07C0:00xx will hit code or data in our bootsector... but %cs is still 
whatever bios set it - almost certainly zero. (there are rumors of 
biosen that jump to 07C0:0000 - extremely rare, if it exists at all) You 
want the address in the IVT to be 07C0:00xx or 0000:7Cxx - 0000:00xx 
won't work.

> The led of floppy drive lights up
> forever. It should be turned off when bios has loaded the boot sector into
> RAM!!?

I don't know about this one. I've seen code that turns off the floppy 
motor - via ports on the floppy controller - pretty much "first thing". 
I *thought* that would only be necessary if we had interrupts 
disabled... as we would when entering protected mode, or sometimes when 
altering %ss:%sp. The fact that your code jumps off into lala-land 
attempting the int 21h may be causing it. I'd try to get that fixed 
first, and tackle this if it's still a problem.

> Here is the piece of code.
> 
> .code16
> .section .text
> .globl _start
> _start:
> 	movw	$STACK_SEGMENT, %sp
> 	movw	%sp, %ss
> 	movw	$STACK_SIZE, %sp

A STACK_SIZE of 0xffff is going to mis-align your stack, so all stack 
access will be slow! If you want to use the entire segment, zero is a 
perfectly good initial %sp - it will be decremented, and the first 
(word) push will go at 0xfffe.

I mentioned that sometimes we cli/sti around altering %ss:%sp... I don't 
think it's really necessary these days - non-buggy CPUs disable 
interrupts for one instruction after a load of %ss anyway. Altering %sp 
first, then %ss, then %ss again might be "dangerous", I'm not sure. 
It'll work most of the time anyway - the odds of an interrupt occuring 
in the middle of this are small - but I suppose you'd like it to work 
*all* the time...

> 	pushw	$BOOTSEG
> 	popw	%ds
> 	pushw	$SCREEN_SEGMENT
> 	popw	%es
> 
> #Blank screen
> 	call 	clearScreen
> 
> #Say hello
> 	movw	$MESSAGE_POS, cursor_pos
> 	call 	printString
> 
> #install interrupt handler
> 	pushw	%ds
> 	pushw	$0
> 	popw	%ds
> 	movw    $interrupt_handler, %ds:(4 * 0x21)
> 	movw    %cs, %ds:(4 * 0x21 + 2)

Try "$BOOTSEG" here instead of %cs - I *think* that's the problem.

> 	popw	%ds
> 
> 
> #test interrupt hander
> 	int	$0x21
> 
> 
> die:	jmp	die
> 
> #
> # Functions 
> #
> 
> .type   clearScreen, @function
> clearScreen:
> 	movb	$SCREEN_COLS, %al
> 	movb	$SCREEN_ROWS, %bl
> 	mulb	%bl
> 	movw	%ax, %cx
>         movb    screen_color, %ah
>         movb    $0, %al
> 	xorw 	%di, %di
> 	rep
> 	stosw		#Write ax to to screen and decrement cx, until cx
> equals 0
> 	movw	$0, cursor_pos
> 	ret
> 
> 
> .type   printString, @function
> printString:
> 	movb	message_color, %ah
> 	movw	$MESSAGE_SIZE, %cx
> 	movw	$welcomeMessage, %si
> 	movw	cursor_pos, %di
> loop0:
> 	lodsb		#load byte from string
> 	stosw		#store byte and color on screen
> 	loop 	loop0	#decrement cx, jump to loop0 if cx > 0
> 	movw	%di,  cursor_pos
> 	call	newline

???

> 	ret
> 
> 
> #
> #interupt handlers
> #
> 
> interrupt_handler:
> 	pusha
> 
>         movb    screen_color, %ah
>         movw    $MESSAGE_SIZE, %cx
>         movw    $welcomeMessage, %si
>         movw    cursor_pos, %di
> loop1:
>         lodsb           #load byte from string
>         stosw           #store byte and color on screen
>         loop    loop1   #decrement cx, jump to loop0 if cx > 0
>         movw    %di,  cursor_pos
> 
> 	popa
> 	iret
> 
> 
> #.section .data
> welcomeMessage: .ascii "Hey! my boot loader."
> MESSAGE_SIZE	= . - welcomeMessage
> screen_color:   .byte 0x07      # White on black
> message_color:  .byte 0x03	# cyan on black     
> cursor_pos:     .word 0x0
> 
> 
> .org 510
> boot_flag:      .word 0xAA55
>  
> 
> #constants
> .equ MESSAGE_POS       , 860		#offset 30 at line 5.
> .equ STACK_SEGMENT     , 0x9000      # Top of conventional memory
> .equ STACK_SIZE        , 0xffff      # 64K - 1 bytes of stack
> .equ SCREEN_SEGMENT    , 0xb800
> .equ SCREEN_COLS       , 80
> .equ SCREEN_ROWS       , 25
> .equ BOOTSEG           , 0x07C0                /* original address of
> boot-sector */
> 
> Thanks in advance,

Hope it helped. I haven't tested your code - what's the command-line to 
as? "-oformat=binary"? (I'm a Nasm user). I'm cc'ing this to the list 
(if you just hit "reply", it goes only to sender - you gotta "reply all" 
to have it go to the list. PITA!), in case someone can correct any 
errors. Hope that's what you intended. (If not... too late! :)

Best,
Frank

