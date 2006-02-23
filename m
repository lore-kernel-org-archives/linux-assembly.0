From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: nasm -f bin / Elf format
Date: Wed, 22 Feb 2006 16:32:44 -0800
Message-ID: <17405.684.517571.20396@eidolon.muppetlabs.com>
References: <200602222126.57346.thiago.silva@kdemail.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200602222126.57346.thiago.silva@kdemail.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> Working gradualy, I tried to modify some data in a .data section,
> and got a segmentation fault.

You probably didn't set your the writable flag for the program section
that includes .data. If you created your program section header table
manually, make sure that p_flags (the second-to-last field) includes
the writable flag (4 = readable, 2 = writable, 1 = executable).

> Is that because there isn't a section header table with an entry
> indicating that the .data section is writable?

No, the section header table is not used when loading/executing ELF
binaries.

b
