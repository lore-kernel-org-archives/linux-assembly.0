From: "John Rodriguez" <jr534@columbia.edu>
Subject: RE: programming bug
Date: Fri, 16 Jan 2004 09:44:11 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <000501c3dc3f$37eee7c0$310d3b80@mrl.cs.columbia.edu>
References: <4007E54B.7080306@tnn.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4007E54B.7080306@tnn.net>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?'erg=FCn_koray'?= <ergky@tnn.net>, linux-assembly@vger.kernel.org

There are a couple of bugs here.

=46irst, although it worked for some reason, stdin is 0 while stdout is=
 1
Perhaps the assembler catched the error?  Who knows.  Just make a note.
:)

So your code as written says,=20
"check character to see if is lower case letter"
"if not, exit"
"otherwise, convert to upper and continue"

The problem with this is:
a) what if I put "The", it should return "THE" ignoring the first
character.
However, your code will see "T", complain, and exit

b) if I put "many words", your code will see "m","a","n","y" and do as
expected, but when it sees " " (the space between the words -- counts a=
s
a valid character), it will complain and exit.

The solution is to add more error checks as the following.
ASCII goes roughly like this

  0 NUL
 ..
 13 newline
 ..
 65 A
 ..
 90 Z
 ..
 96 a
 ..
122 z
 ..

So
"if char is newline", stop, end of input from keyboard
"if less than a", ignore (punctuation, upper case letter, etc)
"if less or equal to z", then is lower case letter, CONVERT this
"else", it's some other meaningless character, just ignore

The order is important since the second test will only be reached if th=
e
first test failed (that is, it's not a newline).

Hope this helps.

One last note, xorl'ing each register per step doesn't seem "proper" fo=
r
two reasons.

1) Some of the registers aren't used at all, and so can be reused.
=46or example %edx which tells the number of characters to read/write i=
s
always 1.  So basically you clear it and set it to 1, over and over...

2) If this is extended as a function later on, you should "save" the
registers so that the caller gets back the same state that it left when
it called the function, just an FYI.

-John

-----Original Message-----
=46rom: linux-assembly-owner@vger.kernel.org
[mailto:linux-assembly-owner@vger.kernel.org] On Behalf Of erg=FCn kora=
y
Sent: Friday, January 16, 2004 8:21 AM
To: linux-assembly@vger.kernel.org
Subject: programming bug

hi there,
i am new to assembly and i have written just this tiny code that turns=20
lowercase characters to uppercase.
but unfortunately after the first characters have been converted the=20
program exits, and i can't find why ?
can anybody help me ? thanks

=2Edata
        chr:    .byte
=2Etext
        .global _start
_start:
read:
        movl $3, %eax   /* read */
        movl $1, %ebx   /* from stdin */
        movl $chr, %ecx /* to chr */
        movl $1, %edx   /* 1 char */
        int $0x80       /* using int 0x80 */

        xorl %eax, %eax /*eax =3D 0 */
        xorl %ebx, %ebx /*eax =3D 0 */
        xorl %edx, %edx
        xorl %ecx, %ecx
check:
        movb chr, %al
        cmpb $'a', %al
        jl endprog
        cmpb $'z', %al
        jg endprog

        xorl %eax,%eax


convert:
        movb chr, %al   /* al <- chr */
        subb $'a' , %al /* Convert small letter */
        addb $'A', %al  /* to capital */
        movb %al, chr   /* write converted char to memory */

write:
        movl $4, %eax   /* write */
        movl $1, %ebx   /* to screen */
        movl $chr, %ecx /* from chr */
        movl $1, %edx   /* 1 char */
        int $0x80       /* using int 0x80 */
        xorl %eax, %eax
        xorl %ebx, %ebx
        xorl %ecx, %ecx
        jmp read

endprog:


        movl $1, %eax   /* exit sys call */
        movl $0, %ebx   /* exit value   */
        int $0x80       /* call int */

-
To unsubscribe from this list: send the line "unsubscribe
linux-assembly" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
