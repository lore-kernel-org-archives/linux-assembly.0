From: Jason Borden <jborden@sorenson.com>
Subject: Re: system_read() question
Date: Tue, 4 Feb 2003 10:09:03 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200302041009.03943.jborden@sorenson.com>
References: <200302031700.40580.davidkedrosky@rogers.com> <200302031546.18672.jborden@sorenson.com> <200302040855.h148tgqs003077@hirsch.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200302040855.h148tgqs003077@hirsch.in-berlin.de>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: lx@snafu.de, hpr <phpr@snafu.de>, dAvId KeDrOsKy <davidkedrosky@rogers.com>, linux-assembly@vger.kernel.org

On Tuesday 04 February 2003 01:48 am, hpr wrote:
> Jason Borden am Montag, 3. Februar 2003 22:46:
> > Supposing that you're using buffered input (default), it will add a line
> > feed character (0x0A) to the end of the string.
>
> 	certainly not!
>
> > Jason

I can't tell if you're agreeing with me or not, but here's proof of concept in 
nasm format:

section .data
hex     db      "0123456789ABCDEF"
section .text
global _start

_start:
mov eax, 3
mov ebx, 0
mov ecx, foo_input
mov edx, 0x40
int 0x80

mov ecx, eax
mov edi, foo_output
mov esi, foo_input
mov eax, 0

loop_output:
lodsb
mov ebx, eax
and al, 0xF0
shr al, 4
mov edx, eax
add edx, hex
mov al, byte[edx]
stosb
mov eax, ebx
and al, 0x0F
mov edx, eax
add edx, hex
mov al, byte[edx]
stosb
mov al, 0x20
stosb
loop loop_output

mov al, 0x0A
stosb

mov eax, 4
mov ebx, 1
mov ecx, foo_output
mov edx, edi
sub edx, foo_output
int 0x80

mov eax, 1
xor ebx, ebx
int 0x80

section .bss
foo_input       resb    0x40
foo_output      resb    0x101
