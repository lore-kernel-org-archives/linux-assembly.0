From: Rudolf Marek <MAREKR2@cs.felk.cvut.cz>
Subject: Re: Write sector (int 13h) under Linux?
Date: Wed, 29 Jan 2003 10:42:24 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <38904.8303514302$1043833254@news.gmane.org>
References: <20030129085713.57893.qmail@web11302.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20030129085713.57893.qmail@web11302.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guido Reina <guidore@yahoo.com>
Cc: linux-assembly@vger.kernel.org


> Subject: Write sector (int 13h) under Linux?
> 
> Hi there, 
> 
> I am trying to delete a sector of my linux box from the kernel, for this 
> I have included a small piece of code as inline assembly. With the 13h 
> interruption I write the sector, I don't know why but it is not working. 
> Do you know if the linux kernel avoids such accesses to the hard disk? 

Yes its nasty and dirty. 

If you want to delete - overwrite some sector simply open your device
for read and write if it is first hardisk than open /dev/hda file
with open system call. (man 2 open) 
Then use lseek to get onto right sector (sector size is 512B) so if you 
want to get to 2nd sector  (after zero and first) you should lseek to 
1024. Then you can read/write via standard system calls read and write.

You can get some inspiration at my fdisk program included in asmutils
package. linuxassembly.org/asmutils.html

If you really want to use BIOS you need to use VM86 callbacks. but this 
is nasty and unfair to system. 

Regards
		Rudolf
