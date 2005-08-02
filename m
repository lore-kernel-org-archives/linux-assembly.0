From: TheReader06@comcast.net
Subject: Re: read key from keyboard
Date: Tue, 02 Aug 2005 18:02:49 +0000
Message-ID: <080220051802.10757.42EFB5490001FCD900002A052202888744C0CF9D0A0B0E0AAD0A08AB@comcast.net>
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: HIToC <hitoc_mail@yahoo.it>, Richard Cooper <generic@xersedefixion.com>
Cc: Linux Assembly <linux-assembly@vger.kernel.org>

http://www.unet.univie.ac.at/aix/files/aixfiles/termios.h.htm  explains many of the ioctl constants..  I just figured most of them out last week when I wrote the below program to turn off terminal echo in asm, in case anyone needs an example..  Yes, I over-comment assembly, otherwise I spend forever trying to figure out what I did later ;p   And on a related keyboard note, the A20 gate sucks..

test6.asm:
; for vim syntax highlighting, asmsyntax=nasm
BITS 32

%define TCGETA  0x5405                  ; <asm/ioctls.h>
%define TCSETA  0x5406

%define ICANON  0000002q                ; <bits/termios.h>
%define ECHO    0000010q
%define ECHOE   0000020q
%define ECHOK   0000040q
%define ECHONL  0000100q

%define STDIN_FILENO    0               ; <unistd.h>

%define BUFSIZE 1024

section .bss
buf     resb    BUFSIZE
old     resb    2                       ; save the old flags
tty     resb    17                      ; struct termio tty

section .text
        global _start

_start:
        xor     eax, eax                ; eax = 0
        mov     al, 54                  ; sys_ioctl
        xor     ebx, ebx                ; ebx = 0
        mov     ecx, TCGETA
        lea     edx, [tty]              ; &tty
        int     80h                     ; syscall

        mov     ax, [tty + 6]
        mov     [old], ax               ; save value
;       and     ax, ~(ICANON | ECHO | ECHOE | ECHOK | ECHONL)
        and     ax, ~(ECHO | ECHOE | ECHOK | ECHONL)
        mov     [tty + 6], ax

        xor     eax, eax                ; eax = 0
        mov     al, 54                  ; sys_ioctl
        xor     ebx, ebx                ; ebx = 0
        mov     ecx, TCSETA             ; int request
        lea     edx, [tty]              ; &tty
        int     80h

        xor     eax, eax                ; eax = 0
        mov     al, 3                   ; sys_read
        xor     ebx, ebx                ; ebx = 0
        mov     bl, STDIN_FILENO        ; int fd
        mov     ecx, buf                ; void *buf
        mov     edx, BUFSIZE            ; size_t count
        int     80h                     ; syscall

        mov     ax, [old]               ; retrieve old value
        mov     [tty + 6], ax           ; restore it

        xor     eax, eax                ; eax = 0
        mov     al, 54                  ; sys_ioctl
        xor     ebx, ebx                ; ebx = 0
        mov     ecx, TCSETA             ; int request
        lea     edx, [tty]              ; &tty
        int     80h                     ; syscall

        xor     eax, eax                ; eax = 0
        mov     al, 1                   ; sys_exit
        xor     ebx, ebx                ; ebx = 0
        int     80h                     ; syscall

Hope it helps,

Joshua Roys


> On Tuesday 21 December 2004 08:29, Richard Cooper wrote:
> > I just found this in the archive.  No one else answered it, so I guess I
> > will.  It's quite the pain to figure out really.  I remember spending
> > hours if not days trying to learn enough C that I could figure it out from
> > the kernel source.  I really hate C.
> >
> > > How can I read a key from the keyboard when the key is available?
> >
> > You have to call TCSETSW, which sadly is like the most undocumented IOCTL
> > ever...
> >
> > This code is copy & pasted out of my program Softer.  The assembly syntax
> > is different, but I'm sure you can figure it out.  It also makes the I/O
> > completely raw, meaning you'll receive 127 instead of 8 for backspace, and
> > you'll receive 13 instead of 10 for enter.  This is more than you want if
> > you're just looking to read the characters as they are typed, but I don't
> > remember how I ever figured out the correct values to get it to do what I
> > wanted.  However, if you also want scancodes, then this is exactly what
> > you want.
> >
> > First you need to save the current settings which are creating the line
> > buffering and other nonsense so that you can put them back when your
> > program is done.
> >
> > sys sys_ioctl, 0, TCGETS, old_termios
> >
> > This requires a little structure to save into...
> >
> >    old_termios
> >      .c_iflag resd 1
> >      .c_oflag resd 1
> >      .c_cflag resd 1
> >      .c_lflag resd 1
> >      .c_cc resb 19
> >
> > Then you call another function to set the new mode...
> >
> >    sys sys_ioctl, 0, TCSETSW, new_termios
> >
> > And of course this requires another structure...
> >
> >    new_termios
> >      .c_iflag dd 0
> >      .c_oflag dd ONLCR | OPOST
> >      .c_cflag dd B38400 | CS8 | CREAD | HUPCL
> >      .c_lflag dd 0
> >      .c_cc db $0, $3, $1c, $7f, $15, $4, $0, $1
> >            db $0, $11, $13, $1a, $0, $12, $f, $17
> >            db $16, $0, $0
> 
> Ok. What are the meaning of this constants?
> I suppose that with this type of ioctl function, I can have more
> control over the keyboard.. Where I can find the documentation of
> this constants?
> 
> 
> >
> > And finally when your program is finished you need to put things back like
> > they were...
> >
> >    sys sys_ioctl, 0, TCSETSW, old_termios
> >
> > And those nice constants are:
> >
> > sys_ioctl = 54
> > TCGETS = 0x5401
> > TCSETSW = 0x5403
> > ONLCR | OPOST = 5
> > B38400 | CS8 | CREAD | HUPCL = 0x4BF
> 
> Yes, very nice! Why have you choosen B38400 | CS8 | CREAD | HUPCL ?
> In an aonther example I found this: ICANON | ECHO | ISIG
> 
> Thanks,
> HIToC
> 
> -- 
> With regards,
> 
> 
> 					HIToC
> 					hitoc_mail@yahoo.it
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
