From: hp <lx@lxhp.in-berlin.de>
Subject: Re: calculating byte
Date: Thu, 24 Jul 2003 08:54:28 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200307240854.28632.lx@lxhp.in-berlin.de>
References: <web-3860654@b1.c.plasa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <web-3860654@b1.c.plasa.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ssams <ssams@telkom.net>, linux-assembly@vger.kernel.org

ssams am Mittwoch, 23. Juli 2003 23:15:
> hi all
> if u have time, please answer my following question
> i try to learn more about assembly. in a time i'found some
> article that explain about exploit, and i get this
> following code. My question is.. how to calculate byte at
> each line..?

for a rough calculation, as a rule of thumb:

	simple opcode			1 byte	(very few such opcodes, e.g. push/pop)
	opcode w. addressing modifier	2 bytes
	mov immediate data		+ 4 bytes
	signed byte displacement	+ 1 byte

	'other' addressing size		+ 1 byte	(16/32bit)
	'other' data item size		+ 1 byte	(word/dword)

	'exotic operations praefix'	+ 1byte	(e.g. "0F")


hp

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
	FAQ(s) + DOCs at http://linuxassembly.org
  pse, reply to << lx -at- lxhp -dot- in-berlin -dot- de >>

