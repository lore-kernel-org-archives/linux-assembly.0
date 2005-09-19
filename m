From: Al Boldi <a1426z@gawab.com>
Subject: Re: Fork capture
Date: Mon, 19 Sep 2005 18:01:47 +0300
Message-ID: <200509191801.47546.a1426z@gawab.com>
References: <200509181748.40029.a1426z@gawab.com> <2cd57c9005091823551e49bc23@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-smp-owner@vger.kernel.org>
In-Reply-To: <2cd57c9005091823551e49bc23@mail.gmail.com>
Content-Disposition: inline
Sender: linux-smp-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: coywolf@gmail.com
Cc: linux-assembly@vger.kernel.org, linux-kernel@vger.kernel.org, linux-smp@vger.kernel.org

Coywolf Qi Hunt wrote:
> On 9/18/05, Al Boldi <a1426z@gawab.com> wrote:
> > Is there a way to capture a process-fork?
> >
> > Something like:
> > process/kModule A monitors procs for forking, captures it and manages
> > further processing.
>
> Look at the fork_connector patch.

Nice, but how could this be used to _manage_ further process-execution?

Also, would a user-space solution be possible?

Thanks!

--
Al

