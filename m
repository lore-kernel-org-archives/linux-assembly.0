From: Jack Dennon <jdd@seasurf.net>
Subject: Re: Local Symbol Names
Date: Wed, 25 Jun 2003 11:50:08 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <03062511461400.00228@linux24>
References: <Law14-F6AauNjVuMhvq0002ae10@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Law14-F6AauNjVuMhvq0002ae10@hotmail.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

On Wednesday 25 June 2003 01:23, S kris wrote:
> Hi,
>
> In some of the assembly files, it's noticed that Local Symbol Names have
> been used that in the following way,
>
>      ................
>      call 0f
> 0: popl %eax
>     ................
> The call is referring to immediately next statement. Please help me in
> finding out the significance of the above lines in the assembly code.
>
> Thanks
>
> Kris
>
	The call instruction probably was used to empty the
	the Execution Unit's instruction cache; thereby
	forcing it to be reloaded from memory. Or, it could
	be used just to force a time delay.
	jdennon@seasurf.com
