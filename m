From: Konstantin Boldyshev <konst@linuxassembly.org>
Subject: Re: your mail
Date: Wed, 9 Oct 2002 22:04:32 +0400 (MSD)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.43L.0210092152320.1778-100000@alpha.linuxassembly.org>
References: <F129z5Bl8LgFuoe5ciz00000d57@hotmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <F129z5Bl8LgFuoe5ciz00000d57@hotmail.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joshua Hudson <joshudson@hotmail.com>
Cc: linux-assembly@vger.kernel.org, konst@ipian.kazan.ru

On Wed, 9 Oct 2002, Joshua Hudson wrote:

> When hunting down the last errors remaining in tar, I came across
> a particularly weird one in both tar and chmod.
>
> Try chmod 4755 true. True will have mode 755.
> This happens in linux 2.0.63, 2.2.22, 2.4.18-3
> Is anybody else getting this? Anybody have a solution?

It is chmod bug, it did 'mul bl' instead of mul bx.
CVS version has this bug fixed.

-- 
Regards,
Konstantin


