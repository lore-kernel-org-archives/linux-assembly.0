From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: FW: Machine Code
Date: Mon, 12 Dec 2005 12:17:08 -0800
Message-ID: <17309.56004.201681.840245@eidolon.muppetlabs.com>
References: <0D544207876CDA428F17DD7EA448C192088C38@bailey.DOMAIN.KSNINC.PVT>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <0D544207876CDA428F17DD7EA448C192088C38@bailey.DOMAIN.KSNINC.PVT>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> Is it possible to write machine code instruction directly to the
> computers memory without using an assembler? Is there an open source
> "binary file" editor that someone can recommend that will allow me
> to do this?

Are you trying to write instructions to memory or to a file? Assuming
a file, various binary file editors do exist, yes. The traditional
name for them is "hex editor", so you'd probably have better luck
searching for that. emacs has a hexl-mode as well.

You can also use Nasm as a sort of power hex editor, by specifying the
bin output format. This will give you total control over the bytes of
the output file while still allowing you to make use of the
assembler's higher-level features.

Note, though, that Linux doesn't have a ".bin" file format like MS-DOS
that consists entirely of machine code. ELF executable files require a
fair bit of overhead.

> I'm just wondering if it is possible to write a machine code file
> directly without the need for an assembler.

Nothing about Unix executable file formats is proprietary knowledge.
You could build your own copy of the Linux kernel manually, using a
hex editor instead of an assembler. It would probably take you months
of full-time work, but it's certainly possible to do.

b
