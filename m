From: Lorenzo <lollo_c@alice.it>
Subject: Re: Very newbie question...
Date: Sat, 12 Nov 2005 08:35:50 +0100
Message-ID: <43759B56.200@alice.it>
References: <437523A4.6080707@alice.it>	<000301c5e715$e7a90370$619f3b80@NMAPod505BTLR> <17269.16302.176560.847323@eidolon.muppetlabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <17269.16302.176560.847323@eidolon.muppetlabs.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Ah ok... now i understand some more things :)

Thx :)



Brian Raiter wrote:

>As noted, you are confusing the function call method with the system
>call method, and doing a little of both. You need to decide on one or
>the other.
>
>If you want to make direct kernel system calls, then follow the code
>that was posted earlier. Alternately, if you wanted to use the POSIX
>functions, your code would look something like this:
>
>EXTERN write, _exit
>
>; ...
>
>	push	len
>	push	hello
>	push	1
>	call	write
>	add	esp, 12
>	push	0
>	call	_exit
>
>b
>-
>To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>

