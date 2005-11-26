From: Claudio Fontana <sick_soul@yahoo.it>
Subject: Re: sys_fork
Date: Sat, 26 Nov 2005 11:26:33 -0800 (PST)
Message-ID: <20051126192634.43926.qmail@web26006.mail.ukl.yahoo.com>
References: <200511261804.38432.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200511261804.38432.hitoc_mail@yahoo.it>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: HIToC <hitoc_mail@yahoo.it>
Cc: linux-assembly <linux-assembly@vger.kernel.org>


--- HIToC <hitoc_mail@yahoo.it> ha scritto: 

> Hello list,
> 	I have written a small echo program that listen for
> a TCP
> incoming connection on a port, then send all data
> received.
> 
> This program can accept only a session at time: I
> would to
> handle multiple connections using fork(),

also consider using select(2), which is syscall 82 or
poll (kernel 2.2+) which is 168 for descriptor
multiplexing to avoid process creation overhead.

> but in assembly this
> way is little difficult!
> How to hold the controll over the child genereted?
> 
> Can anyone help me?
> Thanks for every suggestion.

Bye,

CLaudio



	

	
		
___________________________________ 
Yahoo! Mail: gratis 1GB per i messaggi e allegati da 10MB 
http://mail.yahoo.it
