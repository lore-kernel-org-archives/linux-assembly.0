From: "Rick A. Hohensee" <rickh@capaccess.org>
Subject: descriptor compembler extensions
Date: Sat, 28 Jun 2003 03:10:47 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <fc.0010c7b20093e31a0010c7b20093e31a.93e325@capaccess.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

# true=1.

echo "

Compemble 386 segment descriptor init values to binary file. Keep a table
index count. Extends shasm/osimplay and works here with... GNU bash,
version 2.02.0(1)-release (i486-pc-linux-gnulibc1) Copyright 1998 Free
Software Foundation, Inc. Trailing commentary is about half from
386INTEL.TXT

No bounds-checking of your inputs supplied. Things that are too big get
ORed into the wrong fields.

Do the sddefault routine, do the sdinstantiate, and you should get a
descriptor like a Linux KERNEL_CS seg. This is how I found out there's a
typo in 386INTEL in chart 6-1 or so. Then change things between sddefault
and sdinstantiate for successive descriptors. The gate types haven't been
checked because I haven't needed them yet.

Rick Hohensee
Precision Mojo Engineer


" >> /dev/null

....................................................................

                # special descriptor type-numbers in decimal
LDT=2
CallGate=4
TaskGate=5

InterruptGate16=6
TrapGate16=7
CallGate32=12
InterruptGate32=14
TrapGate32=15
AvailableTSS32=9
BusyTSS32=11
AvailableTSS16=1
BusyTSS16=3


sddefaults () {   # set defaults to ring0 code

        sdtype=                 # assert for special types only
        sdexecutable=1          # apparently there's a typo in
                                # 386intel.txt. Bit 3 of byte 6
                                # differentiates data and code segments.
        sdlimit=0xfffff
        sdlimitshifted=1        # Granularity, 1 or 4k, 4k default
        sdbase=0
        sdnon0based=0           # expanddown, same bit pos. as Conforming
        sdinheritperms=0        # Conforming, same bit pos. as expanddown
        sdDPL=0
        sdreadcode=0            # RW bit        OR these two in builder
        sdwritedata=1           # RW bit
        sdpresent=1
        sdothersizing=0         # Default Bit    - same bit
        sdstack32=1             # Big           /
 }



sdinstantiate () { #
        ad  $sdlimit
        sdlimit=$((sdlimit>>16))

        ad  $sdbase
        sdbase=$((sdbase>>16))
        ab  $sdbase                     # 5 easy ones in the bin
        sdbase=$((sdbase>>8))
                                        # fold together the twofers
        sdRW=$((sdreadcode|sdwritedata))
        sdCZ=$((sdnon0based|sdinheritperms))
        sdBO=$((sdothersizing|sdstack32))

        sdlospec=$((sdpresent<<2))
        sdlospec=$((sdlospec|sdDPL))
        sdlospec=$((sdlospec<<1))               # make room for issegment
        if test "$sdtype"  ; then
                sdlospec=$((sdlospec<<4))       # skip issegment
                sdlospec=$((sdlospec|sdtype))
        else
                sdlospec=$((sdlospec|1))
                sdlospec=$((sdlospec<<1))
                sdlospec=$((sdlospec|sdexecutable))
                sdlospec=$((sdlospec<<1))
                sdlospec=$((sdlospec|sdCZ))
                sdlospec=$((sdlospec<<1))
                sdlospec=$((sdlospec|sdRW))
                sdlospec=$((sdlospec<<1))
        fi
        ab $sdlospec                            # 6 down, two to go

        sdhispec=$((sdlimitshifted<<1))
        sdhispec=$((sdhispec|sdBO))

        sdhispec=$((sdhispec<<6))
        sdhispec=$((sdhispec|sdlimit))
        ab $sdhispec

        ab $sdbase

}

echo "

bit-resolution 386 segment/gate selector layout

per pmode GDT/IDT/LDT descriptor, 8 bytes each...

skipped 


" > /dev/null

....................................................................

Use the above on this....
................................................
. selectormaker

duh () {
        opnote $*
        HL
}


duh GDT

aq 0 0
duh  0 NULL

sddefaults
sdinstantiate

duh "1 ring0 CS"



sddefaults
sdexecutable=0
sdinstantiate
duh  "2 ring0 data"

sddefaults
sdlimitscaled=0
sdbase=0xb8000
sdexecutable=0
sdinstantiate

duh "3 8086 VGA"


sddefaults
sdlimitscaled=0
sdbase=0xc0000
sdinstantiate

duh "4 8086 VBIOS "


sddefaults
sdlimitscaled=0
sdbase=0xf0000
sdinstantiate

duh "5 8086 BIOS"

................................................................


and you get this (and a binary) ...
..................................................................

                        GDT
00000000  00 00 00 00 00 00 00 00                       0 NULL
00000008  ff ff 00 00 00 9a cf 00                       1 ring0 CS
00000010  ff ff 00 00 00 92 cf 00                       2 ring0 data
00000018  ff ff 00 80 0b 92 cf 00                       3 8086 VGA
00000020  ff ff 00 00 0c 9a cf 00                       4 8086 VBIOS
00000028  ff ff 00 00 0f 9a cf 00                       5 8086 BIOS
00000030



