From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Question regarding EIP instruction pointer
Date: Fri, 30 Mar 2007 09:55:52 -0800
Message-ID: <17933.20264.343127.500858@eidolon.muppetlabs.com>
References: <BAY133-F35089BE38C90DC5E52C15CF5630@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <BAY133-F35089BE38C90DC5E52C15CF5630@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> I know that EIP register is the instruction pointer. But how does it
> know how many bytes it needs to increment to the next instruction?

It doesn't "know", per se. The processor simply decodes the current
instruction. As the instruction is unpacked, it fetches bytes from
memory as they are called for. When it's done, the EIP register will
be pointing at the next instruction.

Of course, the above description is only notional. With the highly
parallel processing that goes on in the Pentium family of processors,
there is special circuitry whose job it is to pull instructions out of
memory ahead of time and prepare them for decoding. This circuitry
knows just enough about each instruction to work out how long it is.

b
