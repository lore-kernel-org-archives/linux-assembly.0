From: Luciano Miguel Ferreira Rocha <luciano@lsd.di.uminho.pt>
Subject: Re: Keyboard and Mouse library
Date: Tue, 15 Jul 2003 20:54:22 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030715195422.GA17942@lsd.di.uminho.pt>
References: <E19cPhx-0000W5-00@mail.tv-sign.ru> <200307160303.16120.jko@save-net.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200307160303.16120.jko@save-net.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org


Yes. Don't use Linux.

Linux is an OS kernel. It's very purpose is to remove the requirement for
people to directly program the keyboard controler and/or serial/psaux port and
the attached mouse. All devices are presented as files.

The hardware abstraction in Linux allows programs to be used remotely and
still assume a keyboard and a mouse.

Anyway, you can access serial mice as a normal serial device via /dev/ttySx,
and keycodes by setting the terminal to raw.

PS/2 mice go to /dev/psaux and USB to /dev/input/mouse*

Also, gpm can be used to convert from one protocol to another (bus mouse ->
serial, etc.).

Regarding keyboard, you can read characters by reading from stdin (file
descriptor 0), and control it with ioctl calls.

Relevant man pages: console_codes console_ioctl mouse ttyS ...

I recomend you get a C programming book and another for Unix.

You'll see C has its benefits over assembly.

Regards,
Luciano Rocha

On Wed, Jul 16, 2003 at 03:03:15AM -0700, jeff wrote:
> Hello,
> I'm trying to create a linux library and running into
> trouble with the mouse.  The intent was to use kernel
> calls only and run from the user level.  Is this
> possible?
> 
> I've looked at Gpm which works with terminals
> but find the "c" code difficult.  Assembler for me
> is much easier to understand.
> 
> Also, it would be nice to get the raw keyboard scan
> codes.  I've found programs that claim to do this
> but they don't work on my 9.1 Mandrake version
> of Linux?
> 
> Any suggestions or ideas?
> 
> Jeff Owens
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
