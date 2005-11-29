From: HIToC <hitoc_mail@yahoo.it>
Subject: Re: sys_fork
Date: Tue, 29 Nov 2005 19:59:56 +0100
Message-ID: <200511291857.40019.hitoc_mail@yahoo.it>
References: <20051126192634.43926.qmail@web26006.mail.ukl.yahoo.com> <200511281110.51363.hitoc_mail@yahoo.it> <20051128172541.d35e0496.rnsanchez@terra.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20051128172541.d35e0496.rnsanchez@terra.com.br>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org
Cc: Konstantin Boldyshev <konst@linuxassembly.org>

Yes, the problem was that I do not considered the value in EAX!
A possible solution to free system resources used by chlid, is to call
sys_waitpid with argument pid setted to 0 and waiting until the
value returned in EAX is greater than 0...
Now I understand some more thing over the fork system call!!

Thanks a lot!!
HIToC


On Monday 28 November 2005 20:25, Ricardo Nabinger Sanchez wrote:
> you should test here whether eax is < 0 (error), 0 (child) or > 0 (parent)


-- 
With regards,


					HIToC
					hitoc_mail@yahoo.it
