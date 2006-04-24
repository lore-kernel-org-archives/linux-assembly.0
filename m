From: Tu Ha <httu@tma.com.vn>
Subject: please help me
Date: 24 Apr 2006 06:11:31 -0400
Message-ID: <1145873491.3998.17.camel@gaucon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi,
I am a beginner writing a boot loader. I use gas to write it and got a
weird issue. The following code just try to show out the screen the
symbol "1" ten times

.code16
.section .text
.globl _start
_start:
        movw    $STACK_SEGMENT, %sp
        movw    %sp, %ss
        movw    $STACK_SIZE, %sp
        pushw   %cs
        popw    %ds
        pushw   $SCREEN_SEGMENT
        popw    %es
        jmp     show_banner
 
show_banner:
        movb    $0x07, %ah #white on black
        movb    char, %al  #show this char
        movw    $10,  %cx  #show this char 10 times
        movw    $0, %di    #show at 0,0
run_banner:
        movw    %ax, %es:(%di)
        inc     %di
        inc     %di
        loop    run_banner
 
die:    jmp     die
 
#.section .data
char:   .ascii "1"
.org 510
boot_flag:      .word 0xAA55
                                                                                                                             
#constants
.equ STACK_SEGMENT     , 0x9000      # Top of conventional memory
.equ STACK_SIZE        , 0xffff      # 64K - 1 bytes of stack
.equ SCREEN_SEGMENT    , 0xb800



However, when running, it shows out a symbol in the extend ascii table
instead of "1" !!!?
It seems I cannot reference to the "char" memory location. Why?

How can I debug the binary?

Any help is appreciated.

Tuha.

