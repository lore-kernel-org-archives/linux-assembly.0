From: willy meier <wklux@yahoo.co.uk>
Subject: Re: flat binary
Date: Thu, 23 Oct 2003 19:05:15 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F98185B.4682E70@yahoo.co.uk>
References: <3F97F5B5.4010108@sh.cvut.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org, linux-assembly@mlists.in-berlin.de
Cc: Mirek Dobsicek <m.dobsicek@sh.cvut.cz>

Mirek Dobsicek wrote:
> 
> Hi,
> 
> I've my asm code in AT&T syntax a want to get flat binary file.
> But gas seems cant produce flat file and nasm dont understand at&t syntax.
> 
> Sure I can use some syntax convertor a use nasm, but that's not what I
> want. Is there any suitable tool which understand at&t and produce flat
> binary?

'objcopy' should do, the program is part of the 'binutils' package.


hp

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
  >> xxxx -at- lxhp -dot- in-berlin -dot- de <<
