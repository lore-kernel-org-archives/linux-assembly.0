From: jeff <jko@bctonline.com>
Subject: Re: Keyboard and Mouse library
Date: Thu, 17 Jul 2003 05:29:34 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200307170523.54402.jko@bctonline.com>
References: <E19cPhx-0000W5-00@mail.tv-sign.ru> <200307160303.16120.jko@save-net.com> <oprsdu2dzklmcbdf@smtp-server.woh.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <oprsdu2dzklmcbdf@smtp-server.woh.rr.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

On Tuesday 15 July 2003 08:09 pm, linuxassembly@evobsyniva.com wrote:

> sys_ioctl STDIN, KDSKBMODE, K_RAW
>
> Afterwards you'll be in raw mode.  Unfortunatly, whatever is in the kernel
> that the stty command controls is still mucking things up, and continutes
> to translate byte 13 into a byte 10, and byte 127 into a byte 8, and keeps
> all input from you until a byte 13 comes along which may be causing you to
> think it isn't working since you can't read anything from stdin.i

It is possible to turn the buffering of characters off in termios and this
works for normal reads.  My problem is an error code when trying
to set raw mode.  Here is the code

 mov  eax,54      ;ioctl
 mov ebx,0         ;stdin
 mov ecx,0x4b45  ;KDSKBMODE
 mov edx,0        ;raw mode
 int   0x80

returns code -22 which i assume is "invalid arguement"

In some sample code they opened stdin and used the
returned handle for stdin.  This did not work either.

 Cheers, jeff

