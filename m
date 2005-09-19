From: Coywolf Qi Hunt <coywolf@gmail.com>
Subject: Re: Fork capture
Date: Mon, 19 Sep 2005 14:55:44 +0800
Message-ID: <2cd57c9005091823551e49bc23@mail.gmail.com>
References: <200509181748.40029.a1426z@gawab.com>
Reply-To: coywolf@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-smp-owner@vger.kernel.org>
In-Reply-To: <200509181748.40029.a1426z@gawab.com>
Content-Disposition: inline
Sender: linux-smp-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Al Boldi <a1426z@gawab.com>
Cc: linux-assembly@vger.kernel.org, linux-kernel@vger.kernel.org, linux-smp@vger.kernel.org

On 9/18/05, Al Boldi <a1426z@gawab.com> wrote:
> 
> Is there a way to capture a process-fork?
> 
> Something like:
> process/kModule A monitors procs for forking, captures it and manages further
> processing.

Look at the fork_connector patch.
-- 
Coywolf Qi Hunt
http://sosdg.org/~coywolf/
