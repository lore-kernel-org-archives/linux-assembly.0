From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Disassembly  of  00000
Date: Sat, 2 Feb 2013 10:37:32 -0800
Message-ID: <20749.23788.343335.87280@eidolon.muppetlabs.com>
References: <20130202045339.GD2391@debian.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20130202045339.GD2391@debian.localdomain>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

>    I have a question about disassemblly utility .
>    If I fill an elf's text section with some random data,then 
>    how does the disas command work for these data?
>    Is there occasion that several sequence of bytes can not be translated
>    into legal instructions?

Yes, definitely. In those cases a typical disassembler will just mark
the first byte as being literally emitted and try to resume
disassembly at the next byte. For example, using ndisasm v2.07:

$ echo -e '\017zz' | ndisasm -
00000000  0F                db 0x0f
00000001  7A7A              jpe 0x7d
00000003  0A                db 0x0a

b
