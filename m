From: philippe <pvir@freesurf.fr>
Subject: sound
Date: Mon, 24 Jun 2002 23:51:11 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D17944F.E391DBF4@freesurf.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-assembly@vger.kernel.org

hi
I am new on this list and my name is Philippe.
I used to make some programs on windows but wanted to trye on linux.
I have a problem with a small prog i had done for windows witch play
sounds on the fm chip of a sound card.
But when i translate it on linux, it doesn't work any more.
It compile and link correctly(nasm), but on execution it writes:
segmentation fault!
I post you the sources at the end of this message.

I had an other question:
Where can I find bible of all the interruptions and what is the  name of
it?


Philippe




;************************************************
;*		Ecriture sur SoundBlaster		*
;*1-ecrire dans le adresse port0x388		*
;*2-attendre 12 cycles					*
;*3-ecrire dans le data port0x389			*
;*4-attendre 84 cycles					*

;compiler:
; nasm -f elf SBB.asm
; ld -s -o SBB SBB.o


section .text                           ;section declaration

                        ;we must export the entry point to the ELF
linker or
    global _start       ;loader. They conventionally recognize _start as
their
                        ;entry point. Use ld -e foo to override the
default.

_start:


;mettre tous les registres SB a zero
	mov edx,0x388	;port adresse
	mov eax,0x20		;registre sb 20
	out dx,al
	mov edx,0x389	;data port
	mov al,7
	out dx,al

mov edx,0x388	;port adresse
mov al,0x40	;registre sb 40
out dx,al
	;call WaitR
	mov edx,0x389	;data port
	mov al,0x10
	out dx,al
	;call WaitR

mov edx,0x388	;port adresse
mov al,0x60	;registre sb 20
out dx,al
	;call WaitR
	mov edx,0x389	;data port
	mov eax,0xf0
	out dx,al
	;call WaitR

	mov edx,0x388	;port adresse
	mov al,0x80		;registre sb 20
	out dx,al
	mov edx,0x389	;data port
	mov al,70
	out dx,al

mov edx,0x388	;port adresse
mov al,0x23	;registre sb 20
out dx,al
	;call WaitR
	mov edx,0x389	;data port
	mov eax,1
	out dx,al
	;call WaitR

mov edx,0x388	;port adresse
mov eax,0x43	;registre sb 20
out dx,al
	;call WaitR
	mov edx,0x389	;data port
	mov eax,00
	out dx,al
	;call WaitR

mov edx,0x388	;port adresse
mov eax,0x63	;registre sb 20
out dx,al
	;call WaitR
	mov edx,0x389	;data port
	mov eax,0xf0
	out dx,al
	;call WaitR

mov edx,0x388	;port adresse
mov eax,0x83	;registre sb 20
out dx,al
	;call WaitR
	mov edx,0x389	;data port
	mov eax,0x7f
	out dx,al
dest3:
	mov cx,0xff
dest2:

	mov edx,0x388	;port adresse
	mov al,0xa0		;frequency
	out dx,al
	mov edx,0x389	;data port
	mov al,cl
	xor al,dl
	out dx,al
;**send the sound now gogogogo go
	mov edx,0x388	;port adresse
	mov eax,0xb0	;registre sb 20
	out dx,al
	mov edx,0x389	;data port
	mov eax,0x31
	out dx,al
	call Waitc
	call Waitc
	call Waitc
	call Waitc

	loop dest2
;*******************************************************

mov edx,0x388	;port adresse
mov eax,0xb0	;registre sb 20
out dx,al
	;CHK:	;attend qu'on appuye sur la touche espace*****

	;mov ah,8
	;mov dl,0xFF
	;int 0x21
	;cmp al,' '	;espace
	;je SUITE
	;jmp CHK
;SUITE:
	mov edx,0x389	;data port
	mov eax,0
	out dx,al

;mov ax,0x4c
;int 0x21

        mov     ebx,0   ;first syscall argument: exit code
        mov     eax,1   ;system call number (sys_exit)
        int     0x80    ;call kerne



Waitc:
	push ecx
	mov ecx,0x8fff
W1:
	nop
	loop W1
	pop ecx
	ret
Waitb:
	push ecx
	mov ecx,0x1fff
W2:
	nop
	loop W2
	pop ecx
	ret
