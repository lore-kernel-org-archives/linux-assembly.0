From: hp <lx@lxhp.in-berlin.de>
Subject: Re: Retrieving compilation flags from Executables / Object files
Date: Tue, 29 Jul 2003 12:36:30 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200307291236.30708.lx@lxhp.in-berlin.de>
References: <20030729074351.66043.qmail@web41105.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20030729074351.66043.qmail@web41105.mail.yahoo.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ruxyz@yahoo.com, Assembly Linux <linux-assembly@vger.kernel.org>

Anticipating a Reply am Dienstag, 29. Juli 2003 08:43:
> Hi ,
>
>   I wanted to know how to find out,
> the compilation flags used ,
> from a given executable/object file ?
>
>   Is it possible ? Are the compilation
> flags stored in the executable/object file ?

not really/completely, i.e. depends on what 'flags' you mean.
the 'objdump' and 'readelf' programs show what a binary was compiled for and 
some other information, i.e. whether it is 'stripped', symbols, &c.

hp

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
	FAQ(s) + DOCs at http://linuxassembly.org
  pse, reply to << lx -at- lxhp -dot- in-berlin -dot- de >>

