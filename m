From: Konstantin Boldyshev <konst@linuxassembly.org>
Subject: Re: Keyboard and Mouse library
Date: Fri, 18 Jul 2003 00:14:56 +0400 (MSD)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.43L.0307171142380.1494-100000@alpha.linuxassembly.org>
References: <200307170523.54402.jko@bctonline.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200307170523.54402.jko@bctonline.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

On Thu, 17 Jul 2003, jeff wrote:

> > sys_ioctl STDIN, KDSKBMODE, K_RAW
> >
> > Afterwards you'll be in raw mode.  Unfortunatly, whatever is in the
> kernel
> > that the stty command controls is still mucking things up, and
> continutes
> > to translate byte 13 into a byte 10, and byte 127 into a byte 8, and
> keeps
> > all input from you until a byte 13 comes along which may be causing
> you to
> > think it isn't working since you can't read anything from stdin.i
>
> It is possible to turn the buffering of characters off in termios and
> this
> works for normal reads.  My problem is an error code when trying
> to set raw mode.  Here is the code
>
>  mov  eax,54      ;ioctl
>  mov ebx,0         ;stdin
>  mov ecx,0x4b45  ;KDSKBMODE
>  mov edx,0        ;raw mode
>  int   0x80
>
> returns code -22 which i assume is "invalid arguement"
>
> In some sample code they opened stdin and used the
> returned handle for stdin.  This did not work either.

I think that this article by Karten answers most of "raw keyboard"
questions: http://linuxassembly.org/articles/rawkb.html.

-- 
Regards,
Konstantin


