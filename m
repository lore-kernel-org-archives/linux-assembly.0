From: Vadiraj C S <vadiraj@mail.cyberneme.com>
Subject: Re: newbie :adding larger value
Date: Thu, 27 Nov 2003 17:21:22 +0530
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20031127172122.1dd79019.vadiraj@mail.cyberneme.com>
References: <20031127124723.6b3aeb07.vadiraj@mail.cyberneme.com>
	<200311271241.56060.wklux@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200311271241.56060.wklux@yahoo.co.uk>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: peter willy krause <wklux@yahoo.co.uk>
Cc: linux-assembly@vger.kernel.org

> --------------
> counted integer representation:
> 	l.s.cell [ count ][ cell-1 ] ... [ celll-n ]
> 	  EDI--^  EAX [ .. memory             ]
> 	  tos --^    n     (n) cells           ^-- m.s. cell
> 
> 'cell' is a 32-bit item in memory.
> 2-s complement representation for -ve values.
> 


  Thanks a lot, got some idea, i guess you have algos for these type of mathematical calculations..called GMP..

-- 
Regards
Vadiraj C S


