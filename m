From: Frank Kotler <fbkotler@verizon.net>
Subject: Re: Current break round up
Date: Wed, 01 Oct 2008 14:22:40 -0400
Message-ID: <48E3BFF0.6060900@verizon.net>
References: <1222802784.8421.10.camel@kirilla-desktop>
 <48E37E93.3080101@verizon.net>
 <61990392562924881677723846250054653396-Webmail2@me.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <61990392562924881677723846250054653396-Webmail2@me.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Randall Hyde wrote:
> Almost everything I've read about SYS_BRK says "don't use it."  It's an obsolete memory-management technique that has been left in the kernel to support legacy code. I'm not at all surprised to find that it isn't being maintained as well as it should as the kernel developers probably don't even think about it anymore. The correct way to do memory management under *NIX is to use anonymous memory-mapped files.

Dunno what you've been reading. Reading the output of "strace" gives me 
a different impression. For example, "strace hla" reads like so:

execve("/usr/hla/hla", ["hla"], [/* 37 vars */]) = 0
uname({sys="Linux", node="reltok1", ...}) = 0
brk(0)                                  = 0x80ba544
brk(0x80db544)                          = 0x80db544
brk(0x80dc000)                          = 0x80dc000
write(2, "Usage: hla options filename(s)\n\n"..., 199Usage: hla options 
filename(s)

HLA (High Level Assembler - GAS back end, LD linker)
Version 1.103 build 20424 (prototype)

   -?        Display help message.
   -license  Display license information.
) = 199
exit_group(1)                           = ?
Process 14016 detached

(note, Kircsi, the unaligned return until the third call)

'Course, ya can never tell what those high-level languages are gonna do! :)

Best,
Frank


