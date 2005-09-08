From: jeff <jko@bsn1.net>
Subject: Re: Child Detection
Date: Thu, 8 Sep 2005 10:08:24 -0700
Message-ID: <200509081008.24853.jko@bsn1.net>
References: <op.swrh5angl4sb1n@sucks.airplane.fire>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <op.swrh5angl4sb1n@sucks.airplane.fire>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

On 09/07/2005 07:21 pm, Richard Cooper wrote:
> Is there some way in Linux to detect if your process has any children?
> -
I have not found a good way to do this, but the following features cam
be used to do it:

1. sending kill to any process with ecx=0 will  return its status, this
    contains the parent process.

 2. It is possible to walk through all the process by using the /proc
     file system. 

AsmLib has functions to walk the /proc file system and return status
of a process.  I think most programs keep track of their processes and
do not need to do a search.

My kernel documentation says the PID's are assigned by increment the
parent id?  If this is true it is possible to do a quick search for children
by encrementing the parent id and checking status?

 all the best, jeff


