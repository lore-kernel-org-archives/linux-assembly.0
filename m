From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: writing a jump table
Date: Tue, 15 Mar 2011 17:25:03 -0700
Message-ID: <19840.863.574550.774103@eidolon.muppetlabs.com>
References: <4D7FFFDD.5020103@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4D7FFFDD.5020103@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> I am trying to write a jump table, but unfortunately with limited
> success. When I compile the code and disassemble it, the offset of
> "table" is 0, which I guess means that something didn't work out.

Actually, table appears immediately following your indirect jump
instruction, so I would assume that the offset would be zero. Did you
actually try this code to verify that it doesn't do what you expect?

b
