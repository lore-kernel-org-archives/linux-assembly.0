From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Question about GCC and stack
Date: Mon, 12 Sep 2005 13:50:35 -0700
Message-ID: <17189.59931.532740.834365@eidolon.muppetlabs.com>
References: <587AEB894BD33797BF0431A1@[10.0.0.1]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <587AEB894BD33797BF0431A1@[10.0.0.1]>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> The subl instruction is pointless, I dont know why it's inserted. It
> could be just generic stub code that gcc always inserts for
> allocating stack variables, but as in this case you dont use any, it
> allocates $0 bytes...I'm sure someone will correct me if there's a
> good reason for it :)

I expect that the instructions obtained by the original poster were
created by gcc without optimization. Run gcc with -O2 or so would
probably yield a simpler set of instructions.

b
