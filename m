From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: Getting ALT and CTRL keystrokes
Date: Sun, 15 May 2005 14:06:00 -0400
Message-ID: <42878F88.427D24CD@comcast.net>
References: <051520051620.1970.428776E8000A45E9000007B222007481849B9D9A0D0409@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: glburt@comcast.net
Cc: linux-assembly@vger.kernel.org

glburt@comcast.net wrote:
> 
> In Linux Assembly, X86/NASM, how can I find out if a ALT-a or CTRL-a has been pressed?

Well, here's a half-baked attempt to explore that question.
CTRL-A is 1, as expected... CTRL-C or CTRL-Z quit... as does
SysReq (???). CTRL_Q, and a few other combinations don't
return anything(???). ALT- combinations... and function
keys, editing keys, etc. return multiple bytes, starting
with 1Bh (ESC).

Maybe you can have some fun playing with it anyway...

Best,
Frank

; shows hex bytes returned from "getc"
;
; nasm -f elf myprog.asm
; ld -s -o myprog myprog.o

global _start

; misc. equates
%define NL 10
%define STDIN 0
%define STDOUT 1

; sys_calls
%define SYS_EXIT 1
%define SYS_READ 3
%define SYS_WRITE 4
%define SYS_IOCTL 54

; ioctl subfunctions
%define TCGETS		0x5401 ; tty-"magic"
%define TCSETS		0x5402

; flags for 'em
%define ICANON	2	;.Do erase and kill processing.
%define ECHO	8	;.Enable echo.


    struc termios
	alignb 4
	.c_iflag:	resd 1	; input mode flags
	.c_oflag:	resd 1	; output mode flags
	.c_cflag:	resd 1	; control mode flags
	.c_lflag:	resd 1	; local mode flags
	.c_line:	resb 1	; line discipline
	.c_cc:		resb 19	; control characters
    endstruc
;---------------------------------

section .text
_start:
    nop    ; parking place for gdb
top:
    call getc
    call show_al_hex
    jmp top    

exit:
    xor ebx, ebx
    mov eax, SYS_EXIT
    int 80h
;-------------------

;------------------------------
show_al_hex:
    push eax
    push ebx
    push ecx
    push edx    

    mov ebx, 20200000h

    push eax
    shr eax, 4
    and al, 0Fh
    cmp al, 10
    sbb al, 69h
    das
    mov bl, al
    pop eax

    and al, 0Fh
    cmp al, 10
    sbb al, 69h
    das
    mov bh, al
    push ebx
    mov ecx, esp
    mov ebx, STDOUT
    mov edx, 3
    mov eax, SYS_WRITE
    int 80h
    add esp, byte 4

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
;-----------------------------------

;-----------------------------

getc:
    push ebp
    mov ebp, esp
    
    sub esp, termios_size     ; make a place for current kbd
mode
    
    push edx
    push ecx
    push ebx
    
    mov eax, SYS_IOCTL        ; get current mode
    mov ebx, STDIN
    mov ecx, TCGETS
    lea edx, [ebp - termios_size]
    int 80h
                              ; monkey with it
    and dword [ebp - termios_size + termios.c_lflag],
~(ICANON | ECHO)

    mov eax, SYS_IOCTL
    mov ebx, STDIN
    mov ecx, TCSETS
    lea edx, [ebp - termios_size]
    int 80h
    
    xor eax, eax
    push eax         ; this is the buffer to read into

    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, esp     ; character goes on the stack
    mov edx, 1       ; just one
    int 80h          ; do it

                     ; restore normal kbd mode
    or dword [ebp - termios_size + termios.c_lflag], ICANON
| ECHO
    
    mov eax, SYS_IOCTL
    mov ebx, STDIN
    mov ecx, TCSETS
    lea edx, [ebp - termios_size]
    int 80h
    
    pop eax          ; get character into al

    pop ebx          ; restore caller's regs
    pop ecx
    pop edx

    mov esp, ebp     ; leave
    pop ebp
    ret
;-------------------------
