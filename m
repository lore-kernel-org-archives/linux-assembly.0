From: ram <ram@curvesoft.com>
Subject: 2 questions on bootsect.S
Date: Sun, 12 Jan 2003 17:24:49 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3E21EB31.3080709@curvesoft.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Hi,

I was looking through the linux (2.5.56) arch/i386/boot/bootsect.S and was
puzzled about a couple of things:

1. Near line 221 we have:
        sread:  .word 0             # sectors read of current track
        head:   .word 0             # current head
        track:  .word 0             # current track

    However, since a diskette can have at most 2 heads, 80 tracks and 36 
sectors
    per track, why are these not bytes instead of words especially since 
space is
    at such a tight premium in this code ?

2. Near line 272 we have "movw    $7, %bx" but the documentation I've
     been able to find about the "int 0x13" BIOS call says that for service
     code 0xe (write character and advance cursor), it does not take an
     attribute byte input parameter but rather uses the existing 
attribute. Is
     this movw instruction superfluous ?

Thanks.

Ram


