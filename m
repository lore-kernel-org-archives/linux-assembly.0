From: "Joseph D. Wagner" <wagnerjd@prodigy.net>
Subject: RE: Using gcc to compiler assembly
Date: Sun, 3 Nov 2002 14:19:07 -0600
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <000201c28376$49daf0a0$35181c43@joe>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux Assembly Programming List <linux-assembly@vger.kernel.org>

What you've got isn't pure Assembly; it's some strange jumble of C and
Assembly.

To include Assembly in C, use
asm {
	;	// Assembly Code Here
}

or=20

__asm {
	;	// Assembly Code Here
}

depending on the compiler.

To program in pure Assembly, ditch GCC.  Go with NASM.
http://sourceforge.net/projects/nasm

And based on your lack of distinction between C and Assembly, I also
recommend:
http://www.amazon.com/exec/obidos/tg/detail/-/0130910139/

Joseph Wagner

-----Original Message-----
=46rom: linux-assembly-owner@vger.kernel.org
[mailto:linux-assembly-owner@vger.kernel.org] On Behalf Of Andrew Haydo=
n
Sent: Saturday, November 02, 2002 5:09 PM
To: linux-assembly@vger.kernel.org
Subject: Using gcc to compiler assembly

Gurus,

How to use GCC compiling assembly codes? I attached my example code and=
=20
tried gcc -c -o foo.o foo.S. This line "typedef foo_bar_t int;" choked.
I=20
read the Makefiles for linux kernel and still could not understand how
these=20
assebmly codes were compiled by GCC.

Thanks in advance,

Andrew




_________________________________________________________________
Unlimited Internet access -- and 2 months free!=A0 Try MSN.=20
http://resourcecenter.msn.com/access/plans/2monthsfree.asp

-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
