From: peter willy krause <wklux@yahoo.co.uk>
Subject: Re: newbie :adding larger value
Date: Thu, 27 Nov 2003 12:57:11 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200311271257.11678.wklux@yahoo.co.uk>
References: <20031127124723.6b3aeb07.vadiraj@mail.cyberneme.com> <200311271241.56060.wklux@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200311271241.56060.wklux@yahoo.co.uk>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vadiraj C S <vadiraj@mail.cyberneme.com>, linux-assembly@vger.kernel.org, linux-assembly@mlists.in-berlin.de

sorry for the confusion...

> example from 'lib4th', adding two counted (by l.s. cell value)
> unlimited size integers (re http://www.lxhp.in-berlin.de/lhpf8.html ).

data in memory (which is of no concern w. the mentioned example):
> counted integer representation:
> 	l.s.cell [ count ][ cell-1 ] ... [ celll-n ]
> 	  EDI--^  EAX [ .. memory             ]
> 	  tos --^    n     (n) cells           ^-- m.s. cell

data on 'stack', on which the example operates, are stored in the opposite 
order, 'count' in EAX & @tos, m.s.cell at 'tos'-4, l.s.cell @tos-(4*eax):

	[ count ][ cell-n ] ... [ cell-1 ]
  EDI--^  EAX    [ .. memory             ]
  tos --^    n   ^-- m.s.cell (n) cells  ^-- l.s. cell

-- 
mail to 'hp': lx at lxhp : in-berlin : de

