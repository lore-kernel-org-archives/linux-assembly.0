From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: 32-bit assembler::how to initialize segment registers
Date: Tue, 19 Oct 2004 08:07:46 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <16757.11714.516046.996092@eidolon.muppetlabs.com>
References: <56005.10.0.0.20.1098162741.squirrel@mail.cusat.ac.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <56005.10.0.0.20.1098162741.squirrel@mail.cusat.ac.in>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> am making 32-bit
> assembler as project in c under linux platform.
>              my problem is how my assembler should
> initialize the segment registers.

Assuming the output of your assembler is a Linux object file, then the
segment registers are not your responsibility. Linux sets up the
segment registers before the user's code is called. If the programmer
wants to do something bizarre and/or clever with segments, then it's
their responsiblity.

b

