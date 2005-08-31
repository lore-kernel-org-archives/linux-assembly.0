From: Stephen Ray <steve@mrmighty.net>
Subject: Re: video sync: result of 2.6 kernel experimenting
Date: Wed, 31 Aug 2005 00:58:29 -0300
Message-ID: <43152AE5.7070606@mrmighty.net>
References: <op.sv6lpibqnro9m0@sucks.airplane.fire> <op.swagf1lrnro9m0@sucks.airplane.fire> <4313CA51.5000902@mrmighty.net> <op.swbps0s2nro9m0@sucks.airplane.fire> <43149921.5030709@mrmighty.net> <op.swb8aympnro9m0@sucks.airplane.fire> <op.swckofgm5khrlj@sucks.airplane.fire>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <op.swckofgm5khrlj@sucks.airplane.fire>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard Cooper <syloriza@xersedefixion.com>
Cc: linux-assembly@vger.kernel.org

Richard Cooper wrote:

>
>
> Anyway, I typed 'set' to see what HZ was set to, it was set to 100, 
> but I figured the environment variable might be wrong.  Playing around 
> in /proc/ I found that there was an interrupt going off 1000 times a 
> second, so I figured it was probably HZ=1000.
>
My understanding is that HZ is set to 100 in userspace, to avoid 
breaking some userspace programs.  It's not the same HZ value that is 
used in the kernel source in 2.6.

