From: hp <hp@lxhp.in-berlin.de>
Subject: Re: .intel_syntax
Date: Thu, 16 Jan 2003 06:30:00 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200301160638.h0G6c0Dl005355@hirsch.in-berlin.de>
References: <20030116011903.21711.qmail@webmail28.rediffmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20030116011903.21711.qmail@webmail28.rediffmail.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: n mishra <mishra_nn@rediffmail.com>, linux-assembly@vger.kernel.org


AS (dvi, html or ps variant, 'info' is un-readable, 'man' doesn't even exist) 
documentation mentions only the difference wrt att syntax and some specific 
issues, basic coding should refer to intel docs.

find an excerpt at
	http://www.lxhp.in-berlin.de/lhpas86.html

basic rules, very short:
  <source> and <destn> appear exchanged (mostly! fp oprs are different!)
  mnonic+"l" for <dword> opr,  "w" for word, "b" for byte
  the operand never takes a size praefix.
  use "(...)" instead of " [ .. ]" or intel syntax "ptr" or "pointer".
  immediate oprs praefixed w. "$"
  indexed addressing by " disp(reg)" 
  or " disp( base-reg, scaled-reg, scale-factor)"
	where any of the rsp. items migh be left blank, e.g.
		movl $1, (,edx,2)
	which for nasm would be "mov dword[edx*2],1"

AS alway 'optimzes' branches and byte-codeable immeds, uncontrolably, 
but, any branches to labels which are declared "global" will be assembled  
'long' regardless of the displacement figure - "nasm "jmp/jcc near label".

other differences exist wrt pseudo operations, which are fully explaind in AS 
documentation.

insert ".att_syntax noprefix" at top asm line for un-prefixed registers which 
would otherwise be expected w. a leading "%" character.
AS's ".intel_syntax" not orderly implemented, imo, not recommendable.


best,
	hp

n  mishra am Donnerstag, 16. Januar 2003 01:19:
> Hi all,
> Could someone please tell me how the .intel_syntax works.I can't
> seem to find any reference to it in the man pages or any other
> documentation on it.I want to compile some code written in the
> intel syntax using gcc.

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
  >> clf -at- lxhp -dot- in-berlin -dot- de <<
