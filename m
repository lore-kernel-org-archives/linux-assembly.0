From: linuxassembly@evobsyniva.com
Subject: Orphaned Processes and TCSETSW
Date: Sun, 12 Oct 2003 19:22:36 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <oprwydvy0ylmcbdf@smtp-server.woh.rr.com>
Reply-To: linuxassembly@evobsyniva.com
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org


I've made a new program for Softer, and when it starts up, if it's not run under Softer it will start Softer itself, so that people can just type 'gpsmap' instead of 'softer gpsmap'.  It works well, until it exits.  Upon exit, Softer gives this error message:

Error calling TCSETSW to restore settings.

EAX Error Code: EIO -- I/O error
EAX: FFFFFFFB  EBX: 00000000  ECX: 00005403  EDX: 08054A96
ESI: 0806938E  EDI: 40002000  EBP: 00000000  ESP: BFFFFB24
EIP: 08048781  EFLAGS: 00000000 00000000 00000010 00000110
                                           ..OD   SZ A P C

And the console is left in raw mode.  (not keyboard raw, rather 'stty raw -echo' raw)  The line it's having trouble with is this:

sys sys_ioctl, 0, TCSETSW, old_termios; systrap "calling TCSETSW to restore settings."

...or in other words...

mov eax, sys_ioctl    ; sys_ioctl == 54
mov ebx, 0
mov ecx, TCSETSW      ; TCSETSW == 0x5403
mov edx, old_termios
int 0x80

Searching google all I could come up with was this:

     If  TOSTOP is set and a member of a background process group
     attempts   to   ioctl  its  controlling  terminal,  and that
     ioctl will modify terminal parameters (for example,  TCSETA,
     TCSETAW,  TCSETAF, or  TIOCSPGRP), its process group will be
     sent a   SIGTTOU  signal,  which  will  normally  cause  the
     members  of  that  process  group to stop.  If, however, the
     process is ignoring  or  holding  SIGTTOU,  the  ioctl  will
     succeed.  If the process is not ignoring or holding  SIGTTOU
     and is a member of an orphaned process group, the write will
     fail with  errno set to  EIO, and no signal will be sent.

However, TOSTOP isn't set, so it shouldn't happen.  Regardless, I tried adding signals 20, 21, and 22 to Softer's mile long ignore list, and although that stopped the EIO error, the console settings wern't being restored.  So I added a handler for those signals that just returns, but then the EIO error still occours, so apparently the kernel is rather set on not allowing Softer to change the terminal parameters.

If Softer exits first, there is no problem.  (e.g., if I press control-alt-backspace to make softer exit, or if I make the gpsmap program, upon exit, close it's stdin and stdout (which are just pipes to Softer), then sleep 0.2 seconds to give Softer a second to see the pipes are closed and exit, it works just fine.)  So I'm pretty sure it's something to do with this 'background process group' thing, since the process chain looks like this:

	shell -> gpsmap -> softer

And if gpsmap exits first, there's a link missing in the chain.  If I execute it with 'softer gpsmap' then it's like this:

	shell -> softer -> gpsmap

And there's never any problem regardless of which exits first.

If I can't find a solution to the problem, I'll probably just make it call wait on Softer to make sure Softer exits first, but I'd rather fix the problem than just work around it.

Any suggestions?  Anyone know more than I do about this controlling terminal orphaned background process group stuff?


