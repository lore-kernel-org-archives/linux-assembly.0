From: Darius Stout <darstout@yahoo.com>
Subject: a-linux:   Kernel panic:  No init found
Date: Thu, 24 Oct 2002 11:27:17 -0700 (PDT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20021024182717.63201.qmail@web40207.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org
Cc: darstout@yahoo.com

Hello,

I really like what you are doing and I am trying my best to use a-linux
but I am having some problems.  I have downloaded the "a-linux" and
the "asmutils".  I have been able to boot just fine from the 
"a-linux.img" file but when I try to build my own I get an error at
boot stating "Kernel panic: No init found".  This is the way that
I build the boot image.....

a-linux:  Downloaded at /home/download1/alinux
asmutils: Downloaded at /home/download1/alinux

cd /home/download1/alinux/a-linux-0.17
./bootdisk.bash a-linux.img /home/download1/alinux/asmutils-0.17 /mnt >
new_boot.img

Then I ftp the image to a windows machine and move it to a floppy disk
with "rawwrite"

Then I get a failure "Kernel panic: No init found"

I am trying to build a very small web server and I really need 
your help.


Thanks!
Darius 

__________________________________________________
Do you Yahoo!?
Y! Web Hosting - Let the expert host your web site
http://webhosting.yahoo.com/
