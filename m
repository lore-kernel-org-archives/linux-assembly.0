From: peter w krause <wklux@yahoo.co.uk>
Subject: Re: appending \n using registers
Date: Mon, 3 Nov 2003 11:21:41 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200311031121.41049.wklux@yahoo.co.uk>
References: <Law9-F53io7W2bLeb1X0000f7f4@hotmail.com> <200311021915.37648.wklux@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200311021915.37648.wklux@yahoo.co.uk>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jason Roberts <v3ct0r99@hotmail.com>, linux-assembly@vger.kernel.org

peter w krause am Sunday 02 November 2003 19:15:
	[...]
>
> 	('as')							('nasm')
> 	movw ax,dest					mov ax,[word dest]
	^^^^^^^^^^^				^^^^^^^^^^^^^^^

	movw src,ax					mov ax,[word src]

	[...]
>
> 	movzwl; movswl					movszw, movsw + destn size spec.
									^^^^^^
 	movzwl; movswl					movzw, movsw + destn size spec.


 hp

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
  >> xxxx -at- lxhp -dot- in-berlin -dot- de <<

