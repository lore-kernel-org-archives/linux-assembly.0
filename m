From: "Rick A. Hohensee" <rickh@capaccess.org>
Subject: I'm booted.
Date: Thu, 19 Jun 2003 03:48:41 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <fc.0010c7b20092aa7a0010c7b20092aa7a.92aa87@capaccess.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rhyde@cs.ucr.edu, BethStone21@hotmail.com, konst@linuxassembly.org, linux-assembly@vger.kernel.org, j2thomas@cavtel.net, jvn@virginia.edu, m_l_g3@yahoo.com, erather@forth.com, m-coughlin@attbi.com, cjakeman@bigfoot.com, koopman@cmu.edu, jdhall@mac.com, Fox@UltraTechnology.com

I just got proof of a 32-bit world from some boot code I wrote in
osimplay. osimplay is the latest incarnation of shasm. I got slashdotted a
while back for shasm, which is a 386 assembler written entirely in GNU
Bash shell scripts. In the present code, I boot from floppy and send four
vertically aligned junk charachters to the screen, the fourth of which is
visibly four bytes in one store to memory. Howdy.

osimplay is shasm with some cleanups and some semi-high-levelism. It has
execution arrays, which are a nightmare in C, and some other goodies, like
min and max, cheesy struct-like things, a couple flavors of procedure and
so on. No DO/WHILE type flow-control abstractions though. That way lies
Java. And it has Forth-like naming. It's as Forthy as I can get without
the inner interpreter, or stack machine silicon. I think it obsoletes C,
basically. Particularly for kernels, although I muchly prefer it to C for
regular apps now also. I have about a third of a text editor written in
osimplay too. If you write an OS in osimplay, there's no asm("") issues.
It's all assembly. And there's no blessed toolchain. You need a unix-like
shell. This is for real bootstraps, as opposed to C compilers that you
need a C compiler to build. osimplay is not GNEIOU, GNU Never Existed
Independant Of UNIX.  osimplay is a trivial port to pdksh, BTW.

Here's what is currently the Ha3sm 0.000001 or whatever top-level source
file. HL and opnote are listing twiddlers.
..........................................................................

. boot/fromfloppy

        nosurprises
                                # I'm a live 8086 with VGA
        = 0xb800 to A
        = A to DS               # 8086 data segment is the screen.
        = 0x3344 to A
        = A to @ 544            # blip 1
        zero A
        = A to DS               # setGDT offsets from DS. That cost me a
day.

        setGDT initial_gdtr
        = 0xb800 to A
        = A to DS
        = 0x7772 to A
        = A to @ 864            # blip 2

        = 1 to A
        ab 0x0f 0x01 0xf0               # load machine status word from A

        jump PMODE16                    # icache cleaner
L  PMODE16

        = 0x7372 to A           # blip 3
        = A to @ 1184
                        HL
        ab 0xea
        ad BIG_CS
        ad 8
                        opnote          far jump addr./GDTindex ptr
L BIG_CS
cell=4                          # tell osimplay to compemble for 32-bit.
        = 0x37423392 to A
        = A to @ 1504           # blip 4, 32 bit, two cells with attribs.
halt
        = 0x10 to A
        = A to DS
L BIG_DS



. boot/GDTdata

........................................................................

Here's the listing analagous to "gas -a", which shows the includes also.
In e.g. 00007c00 270 50 02 the 270 is octal, 50 and 02 are hex. There's
some decimal in the source (right) column.

00000000  00...                         ALLOT 0x7C00
00007c00  270 50 02                     = 592 to A
00007c03  271 01 00                     = 1 to C
00007c06  31 322                        XOR D with D
00007c08  273 00 7c                     = 0x7c00 to B
00007c0b  cd 13                         submit 0x13
00007c0d  fa                    nosurprises
00007c0e  270 00 b8                     = 0xb800 to A
00007c11  8e 330                        = A to DS
00007c13  270 44 33                     = 0x3344 to A
00007c16  89 006 20 02                  = A to @ 544
00007c1a  31 300                        XOR A with A
00007c1c  8e 330                        = A to DS
00007c1e  0f 01 16 57 7c                        setGDT initial_gdtr
00007c23  270 00 b8                     = 0xb800 to A
00007c26  8e 330                        = A to DS
00007c28  270 72 77                     = 0x7772 to A
00007c2b  89 006 60 03                  = A to @ 864
00007c2f  270 01 00                     = 1 to A        0f 01 f0
00007c35  e9 00 00                      jump PMODE16
00007c38                (O) PMODE16
00007c38  270 72 73                     = 0x7372 to A
00007c3b  89 006 a0 04                  = A to @ 1184
00007c3f  ea 44 7c 08 00                        far jump addr./GDTindex ptr
00007c44                (O) BIG_CS
00007c44  270 92 33 42 37                       = 0x37423392 to A
00007c49  89 005 e0 05 00 00                    = A to @ 1504
00007c4f  f4                    halt
00007c50  270 10 00 00 00                       = 0x10 to A
00007c55  8e 330                        = A to DS
00007c57                (O) BIG_DS
00007c57                (O) initial_gdtr
00007c57  00 02 5d 7c 00 00
00007c5d                (O) GDT_templates
00007c5d  00 00 00 00 00 00 00 00
00007c65  ff ff 00 00 00 9a cf 00                       index 1
00007c6d  ff ff 00 00 00 92 cf 00


An osimplay not exactly like this one is on my webpage in cLIeNUX/interim.
With some docs. I'm on welfare Internet access at the moment, and I'm not
gonna cut-paste the current osimplay between vts to email it. :o) It's a
shell script. Foot yourself shoot in.

        URL: ftp://linux01.gwdg.de/pub/cLIeNUX/interim/osimplay.tgz


Rick Hohensee
Precision Mojo Engineer

