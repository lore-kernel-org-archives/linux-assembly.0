From: linuxassembly@evobsyniva.com
Subject: Re: Keyboard and Mouse library
Date: Wed, 16 Jul 2003 04:07:55 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <oprsd8vhuulmcbdf@smtp-server.woh.rr.com>
References: <E19cPhx-0000W5-00@mail.tv-sign.ru> <200307160303.16120.jko@save-net.com> <oprsdu2dzklmcbdf@smtp-server.woh.rr.com> <200307160746.30936.lx@lxhp.in-berlin.de>
Reply-To: linuxassembly@evobsyniva.com
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200307160746.30936.lx@lxhp.in-berlin.de>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: hp <lx@lxhp.in-berlin.de>
Cc: linux-assembly@vger.kernel.org

On Wed, 16 Jul 2003 07:46:30 +0100, hp <lx@lxhp.in-berlin.de> wrote:

> linuxassembly@evobsyniva.com am Mittwoch, 16. Juli 2003 04:09:
>> On Wed, 16 Jul 2003 03:03:15 -0700, jeff <jko@save-net.com> wrote:
>>
>> There are some mysterious ioctls that control this as well, but they 
>> don't
>> seem to be documented anywhere at all.  However, you can simply call the
>
> man 4 console_ioctl (or console_ioctls, old vers.)

The only thing I see that might apply is KDGKBENT and KDSKBSENT.  They 
might be related, but I can't tell, and suspect they are not.  There's no 
mention of anything that might remove the line buffering, or the byte 3 
leading to a sigkill thing.  As I mentioned, setting the keyboard in raw 
mode doesn't remove these things, it just mucks them up.  Instead of 
control-C sending a sigkill, it becomes the number 2 key, who's scan code 
is 3.

Doing an strace on stty reveals that it calls two mystery ioctls 0x5401 and 
0x5403, and looking around the kernel source I figured out they are TCGETS 
and TCSETSW, however I've been unsuccessful in tracking down any more 
information than that.  The two ioctls lead to drivers/char/tty_ioctl.c, 
which calls a function set_termios, which calls change_termios, which calls 
???.set_termios, and that's about where my ability to read C code comes to 
an end.


