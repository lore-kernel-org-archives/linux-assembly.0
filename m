From: "Jimmy Dubuisson" <Jimmy.Dubuisson@cern.ch>
Subject: Technical question
Date: Wed, 23 Apr 2003 19:04:32 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <4E555E7EDF5E334092B4B387B20F450D02C047@cernxchg10.cern.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
content-class: urn:content-classes:message
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi everybody,

I made a LKM running on a rehat 7.3 because I need to intercept a chdir
system call. The problem is that inside my chdir intercepting function I
would like to use the 'do_execve' function. For this, as you know, I
need to intialize the 'pt_regs' structure with the saved registry values
on the stack. But as you also know, the chdir system call only takes a
string as its argument. So my question is the following :

How can I get these registry values (in fact edx for the list of
environment variables) by using if possible the C language and the
functions available in the kernel ?

Thanks in advance for your response,

Cheers,

Jimmy.
