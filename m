From: Rudolf Marek <MAREKR2@cs.felk.cvut.cz>
Subject: Re: Newbie Question
Date: Fri, 25 Oct 2002 00:15:20 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <27808.211107231$1035497668@news.gmane.org>
References: <200210241742.35488.davidkedrosky@rogers.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200210241742.35488.davidkedrosky@rogers.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dAvId KeDrOsKy <davidkedrosky@rogers.com>
Cc: Linux Assembly Programming List <linux-assembly@vger.kernel.org>


> BUT I was wondering how it is possible to push BX instead.  Does BX also hold 
> the string in this case, considering the size of the string it isn't that 
> big?  If not, is there a way to put the contents of EBX (the string) into BX? 
> For the time being I would like to just deal with 16-bit registers because it 
> is easier to follow along with the book I am using.

Yes but if you are using linux it uses 32-bit memory pointers so you 
should use the 32 bit regs. If you want use some "done" work which is 
16bit you can just put "e" in front of 16 bit registers to ensure 
functionality. (I think)

Regards

Rudolf


