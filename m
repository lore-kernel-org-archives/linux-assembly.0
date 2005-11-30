From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Subject: Re: sys_fork
Date: Tue, 29 Nov 2005 22:20:13 -0200
Message-ID: <20051129222013.305cd393.rnsanchez@terra.com.br>
References: <20051126192634.43926.qmail@web26006.mail.ukl.yahoo.com>
	<200511281110.51363.hitoc_mail@yahoo.it>
	<20051128172541.d35e0496.rnsanchez@terra.com.br>
	<200511291857.40019.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200511291857.40019.hitoc_mail@yahoo.it>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Quoting  HIToC <hitoc_mail@yahoo.it>
Sent on  Tue, 29 Nov 2005 19:59:56 +0100

Hello,

> Yes, the problem was that I do not considered the value in EAX!
> A possible solution to free system resources used by chlid, is to call
> sys_waitpid with argument pid setted to 0 and waiting until the
> value returned in EAX is greater than 0...
> Now I understand some more thing over the fork system call!!

that's nice, have you studied man 2 fork already? :)

I wouldn't recommend you to call wait4pid, because your process (the accept
() one) will block, and thus fork() will not be an advantage (you can do
that naturally without forking).

What would be a nice thing to do is to prepare a signal handler for
SIG_CHILD, to clean up its children.  It is very single to use, all you
need is to tell the kernel to use your custom function for handling
SIG_CHILD, instead of the default action (which is to ignore the signal,
and you'll end with a bunch of zombies).

Btw, such a function is like this in C:

void handle_sigchild() {
	wait();
}

notice that the process will not block, as the signal is being delivered
because of a terminating child.  it will be cleaned even if the process is
blocked in accept().

I'm almost sure that you'll also need to handle interrupted accept(), which
will return -1 and errno will have EINTR (interrupted system call).  in
this case, call accept() again :)

have fun :)

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

  Left to themselves, things tend to go from bad to worse.
