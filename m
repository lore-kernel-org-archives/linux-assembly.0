From: dAvId KeDrOsKy <davidkedrosky@rogers.com>
Subject: Seg Fault
Date: Sat, 25 Jan 2003 19:39:05 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200301251939.05251.davidkedrosky@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Can somebody help me out with why I'm getting a segmentation fault  All I'm 
trying to do is send some text to stdout.  The output I get is:.

Some message
Segmentation Fault

--------------------------------------------------------------------------------
section         .model small
section         .stack 100h

section         .data
mesg            db      'Some message',0ah, 0

section         .text

global  _start
_start:

        mov     eax, 4
        mov     ebx, 1
        mov     ecx, mesg
        mov     edx, 13
        int        0x80
        ret

        mov     eax, 1
        xor     ebx, ebx
        int     0x80

