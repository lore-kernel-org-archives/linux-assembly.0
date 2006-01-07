From: joy merwin monteiro <joy.merwin@gmail.com>
Subject: Re: hello again :D
Date: Sat, 7 Jan 2006 10:56:12 +0530
Message-ID: <4b0d6e0d0601062126s3a189f72v8c27316e6be064b3@mail.gmail.com>
References: <20060107110622.65f5623a.amerei@gmail.com>
	 <4b0d6e0d0601061940v6184e250xdb2c209f308ad969@mail.gmail.com>
	 <43BF4AF4.2010104@comcast.net>
Reply-To: joy_mm@ieee.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <43BF4AF4.2010104@comcast.net>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frank Kotler <fbkotler@comcast.net>
Cc: linux-assembly@vger.kernel.org

> It'd work better with esp :)

mebbe :D written code for 8086, rusty .....

 If you had a stack frame (push ebp) the
> return address would be at [esp + 4], I think. Without  it, right at
> [esp]. Haven't tried this, but it sounds like it should work.
>
> I've also heard of copying code onto the stack, and modifying and
> running it there. Hadn't tried this, but I just gave it a shot, and it
> seems to work.

x86 has no concept of a code only data only  since they share the same physical
address space (AFAIR) Von Neumann , Harvard, all that. so works, me thinks....

>
> ; self modifying code - on stack
<snip>


------------------------
<\snip>
 /me worships :D

Joy

--
Only time will tell, but are we listening ? :)
