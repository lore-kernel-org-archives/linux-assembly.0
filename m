From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: sys_fork
Date: Mon, 28 Nov 2005 13:48:40 +0000
Message-ID: <438B0AB8.6080304@comcast.net>
References: <20051126192634.43926.qmail@web26006.mail.ukl.yahoo.com> <200511271337.56268.hitoc_mail@yahoo.it> <20051127172743.587c2c41.rnsanchez@terra.com.br> <200511281110.51363.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200511281110.51363.hitoc_mail@yahoo.it>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

HIToC wrote:

...
> 		mov	eax, 0x02	; sys_fork
> 		xor	ebx, ebx
> 		int	0x80

I don't know much about socket programming, but I got sys_fork to work, 
once... At this point, you're "two places at once". If eax=0, you're the 
child (and want to do the echo_loop stuff, I guess). If eax is non-zero 
- and positive, we hope! - you're the parent, and eax is the PID of the 
child. In this case, I guess you want to jump back to the "accept" call. 
By not checking eax at this point, *both* the parent and child fall 
through into the echo_loop... and the sys_exit. At least, I *think* 
that's what's happening...

or eax, eax  ; or "test eax, eax"
js webefukt  ; might be an error!
jnz wait_new_con  ; parent
... ; child

See if something like that helps... There may be other things you need 
to do, besides just going back to "accept" (probably should clean up 
stack after the call?)...

Best,
Frank

