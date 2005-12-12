From: Claudio Fontana <sick_soul@yahoo.it>
Subject: Re: FW: Machine Code
Date: Mon, 12 Dec 2005 12:36:07 -0800 (PST)
Message-ID: <20051212203607.6679.qmail@web26009.mail.ukl.yahoo.com>
References: <0D544207876CDA428F17DD7EA448C192088C38@bailey.DOMAIN.KSNINC.PVT>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <0D544207876CDA428F17DD7EA448C192088C38@bailey.DOMAIN.KSNINC.PVT>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Landon Blake <lblake@ksninc.com>
Cc: linux-assembly@vger.kernel.org


--- Landon Blake <lblake@ksninc.com> ha scritto: 
> Is it possible to write machine code instruction
> directly to the computers memory
> without using an assembler? Is
> there an open source "binary file" editor

memory or file?

> that someone can recommend that will allow me to do
> this?
> 
> Do chip manafacturers typically provide an assembler
> that compiles assembly language instructions into
the machine code
> for there processor, or does a programmer have to
rely on
> third parties for the
> assemblers?

There are assemblers provided by various parties,
manufacturer included, for popular architectures and
operating systems.
 
> I'm just wondering if it is possible to write a
> machine code file
> directly without the need for an assembler.

sure.
For small trivial tasks (change one opcode, change
static data) I use xxd and xxd -r (the reverse
operation of xxd, a data dumper similar to od).

man xxd

> Landon

CLaudio



		
___________________________________ 
Yahoo! Messenger: chiamate gratuite in tutto il mondo 
http://it.messenger.yahoo.com
