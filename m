From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: Segfault on ioperm
Date: Fri, 21 Jan 2005 09:29:01 -0500
Message-ID: <41F111AD.7A2283BA@comcast.net>
References: <4b0d6e0d0501200552126d8cbb@mail.gmail.com>
		 <41EFFB12.64D2C558@comcast.net> <4b0d6e0d050121044310b6a9c6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: joy_mm@ieee.org
Cc: linux-assembly@vger.kernel.org

joy merwin monteiro wrote:

> > >     mov eax,101
> > >     mov ebx,port
> > >     mov ecx,3
> >
> > This is the number of ports you're enabling, right?
> >
> > >     mov edx,port
> >
> > And this should be the "turn-on" value... I imagine you want
> > "3" here, too, for "in" and "out" permissions...
> 
> No idea, Just used the code available on http://www.janw.easynet.be/eng.html
> as a reference. it works fine, so......

Yup. I learn a lot from that page, too. Not "obsolete" at
all, IMO, and your English is fine, too! Thanks, Jan!

In this case, "man 2 ioperm" differs - says "turn on value"
in edx (well... it doesn't say edx...)

> > >     out 378h,al  <----- segfault here
> >
> > "out dx, al", as Jan suggests...
> 
> However, Jan's  musice speaker on the site above uses
> "out 43h,al"

Unless I'm mistaken, you can use an "immediate" value for
in/out - but only for the first 255 ports. If the value
exceeds a byte (as 378h does), you have to use dx.

In case it would be of interest to you, or anybody, I'll
include my simple "beep the speaker" example. I make no
claim that this is "right" (certainly not "elegant"), but it
"seems to work". The "delay" routine, for example,
special-cases a duration of 1 (since I want 0 for an
end-of-data marker, "no delay" is 1). This "special case"
should be handled in the "main" part of the code, leaving
the "delay" subroutine more "generic" - just haven't gotten
around to changing it. I'm sure there are other things, too
- any feedback welcome. Since the port numbers are small,
this *does* use immediates on in/out...

Good luck,
Frank


; Plays a tune, of sorts - sound, anyway.
; It is said that I'm not artistic.
;
; nasm -f elf [-g] play.asm
; ld [-s] -o play play.o
;
; to be able to run without being root:
; as root, "chown root:root play" "chmod +s play"

section .text
global _start
_start:
    nop      ; parking place for gdb

    mov eax, 101   ; sys_ioperm
    mov ebx, 42h   ; starting port
    mov ecx, 20h   ; how many ports
    mov edx, 3     ; read/write
    int 80h

    test eax, eax
    jns okay_ioperm
    neg eax
    call showeax
    mov ebx, eax
    jmp exit

okay_ioperm:

                                ; set up PIT
    mov al, 10111110b
           ;.......|------ binary 16-bit counter
           ;....|||------- square wave generator
           ;..||---------- r/w bits 0-7, then 8-15
           ;||------------ select counter 2
    out 43h, al

    mov esi, melody

playit_sam:                 ; if she can take it, so can I.
    in al, 61h              ; enable speaker
    or al, 00000011b
          ;.......|------- enable speaker on timer 2 gate
          ;......|-------- enable speaker data
    out 61h, al

    lodsd                       ; get a note
    or eax, eax                 ; check for zero
    jz egress                   ; coda

    out 42h, al                 ; play it
    mov al, ah
    out 42h ,al

    lodsd                       ; for this long
    call delay

    in al, 61h                  ; Turn Speaker OFF
    and al, 11111100b
    out 61h, al

    lodsd                       ; for this long
    call delay

    jmp short playit_sam        ; play more

egress:
    in al, 61h
    and al, 0FCh                ; Turn Speaker OFF. Please.
    out 61h, al

    mov eax, 101   ; sys_ioperm
    mov ebx, 42h
    mov ecx, 20h
    mov edx, 0     ; give back ports
    int 80h

    test eax, eax
    jns okay_exit
    neg eax
    call showeax
    mov ebx, eax
    jmp exit

okay_exit:

    xor ebx, ebx
exit:
    mov eax, 1     ; sys_exit
    int 80h
;------------------

;------------------
delay:
    push ebx
    push ecx

    cmp eax, byte 1
    jz .no_delay

    xor ebx, ebx
.check_ns
    cmp eax, 1000000000   ; limit for nanosleep 999999999
ns...
    jb .okay_ns
    sub eax, 1000000000
    inc ebx
    jmp short .check_ns
.okay_ns

    push eax     ; set up a time_spec structure on the stack
    push ebx

.take_a_nap
    mov eax, 162    ; sys_nanosleep
    mov ebx, esp    ; same structure for "request"
    mov ecx, esp    ; and "remaining" - does this work?
    int 80h
    cmp eax, -4     ; -EINTR
    jz .take_a_nap

    add esp, byte 8     ; remove time_spec "structure"

.no_delay:
    pop ecx
    pop ebx
    ret
;------------------

;-----------------------------------
; showeax - prints a decimal representation of eax to stdout
; expects - number to print in eax
; returns - nothing
;------------------------------------
showeax:
    pushad

    xor edi, edi     ; counter
    mov esi, 10      ; divide by ten

    push esi         ; double as LF :)
    inc edi
.top
    xor edx, edx     ; zero edx for the divide
    div esi          ; quotient in eax, remainder in edx
    add dl, '0'      ; convert number to ascii char
    push edx         ; save it
    inc edi          ; bump counter
    or eax, eax      ; is quotient zero?
    jnz .top         ; if not, do more

.print
    mov eax, 4       ; sys_write
    mov ebx, 1       ; stdout
    mov ecx, esp     ; character's on the stack
    mov edx, 1       ; just one
    int 80h          ; do it
    pop edx          ; get rid of the character we've
printed
    dec edi          ; decrement counter
    jnz .print       ; 'til done

    popad
    ret
;-----------------------

section .data

; Some equates, for your compositional assistance
; It is said that I'm not artistic.

    A0 equ 21728
    B0 equ 19328
    C0 equ 18244
    D0 equ 16144
    E0 equ 14080
    F0 equ 13668
    G0 equ 12176
    A1 equ 10864
    B1 equ 9664
    C1 equ 9122
    D1 equ 8072
    E1 equ 7040
    F1 equ 6834
    G1 equ 6088
    A2 equ 5432
    B2 equ 4832
    C2 equ 4561
    D2 equ 4063
    E2 equ 3520
    F2 equ 3417
    G2 equ 3044
    A3 equ 2712
    B3 equ 2416
    C3 equ 2280
    D3 equ 2032
    E3 equ 1810
    F3 equ 1708
    G3 equ 1522
    A4 equ 1356
    B4 equ 1208
    C4 equ 1140
    D4 equ 1016
    E4 equ 905
    F4 equ 854
    G4 equ 762
    A5 equ 678
    B5 equ 604
    C5 equ 558

; Some "durations" for sys_nanosleep
    Z equ 1
    S equ 60000000
    Q equ 120000000
    P equ 240000000
    R equ 480000000
    L equ 1920000000

; The opus itself.
;
; It is said that I'm not artistic.
;
; Format is "note", "duration", "pause", "note", ... , 0
; Write your own!

melody:

       dd G2, P, Z, E2, Q, Z, G2, Q, Q, G1, Q, Q
       dd G1, Q, Q, C2, Q, Q, B2, Q, Z, C2, Q, Z
       dd D2, Q, Q, G2, Q, Q, A3, Q, Z, G2, Q, Z
       dd A3, Q, Q, A2, Q, Q, A2, Q, Q, G2, Q, Q
       dd E2, Q, Z, G2, Q, Z, F2, Q, Z
       dd E2, Q, Z, D2, Q, Q, F2, Q, Z, G2, Q, Z
       dd A3, Q, Z, G2, Q, Z, F2, Q, Z, E2, Q, Z
       dd F2, Q, Z, E2, Q, Z, D2, Q, Z, B2, Q, Z
       dd C2, Q, Z, D2, Q, Z, E2, Q, Z, C2, Q, Z
       dd D2, Q, Q, G3, Q, Z, F3, Q, Z, E3, Q, Z
       dd D3, Q, Z, C3, Q, Z, B3, Q, Z, A3, Q, Z
       dd B3, Q, Z, C3, Q, Z, D3, Q, Z, B3, Q, Q
       dd G0, Q, Q, G0, R, Z, 0
