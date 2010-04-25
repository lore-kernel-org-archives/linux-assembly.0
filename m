From: Bai Shuwei <baishuwei@gmail.com>
Subject: how i get the USB Disk serial number with assembler language?
Date: Sun, 25 Apr 2010 19:05:53 +0800
Message-ID: <q2qf3566d61004250405t2b73e534t3f8988941af92f1@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=N4eQpfxraK+6b3F/yKfyNWOP+VSuokC06D5hDctX5dg=;
        b=uMOJYYvpAOP1jwn74zC77L5xTJvE93p1TUeAufi88bA3pzZCVhUEaA+MV+DDquMUlI
         8ekZ/hydjkFsTc8st9rCFoTQO7wFH3qW2SYpRAnoAagMXMvJpgY1bM7A6Uval58KOs8s
         M87jVHckK/q6T2g6R5qL8/SBm+eu6u3Z1he+w=
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hi, All:
     As i know, every usb-disk has a unique serial number. And it can
be get by "lsusb" command, but sometime there is no usb driver. So how
i get the usb-disk unique information will assemble language or
without the USB driver. I want to get the USB-DISK serial number in
the bootloader. The development platform is x86.

Thanks!

Bai Shuwei

-- 
Love other people, as same as love yourself!
Don't think all the time, do it by your hands!

E-Mail: baishuwei@gmail.com
