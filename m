From: "Joshua Hudson" <joshudson@hotmail.com>
Subject: Re: how to reboot ?
Date: Tue, 12 Nov 2002 09:32:46 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <F8404gQFmWvD5urwDvX0000af94@hotmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: fmarmond@eprocess.fr
Cc: linux-assembly@vger.kernel.org

>From: Frederic Marmond <fmarmond@eprocess.fr>
>Hi all,
>
>I'm working in early stage in the Linux loading.
>I'm in the linuxrc of a initrd, and I would like
>to reboot the machine.
>Of course, as init is not started (it starts at the
>exit of linuxrc), things like shutdown, reboot,
>telinit 6 will not work.
Try reboot command from asmutils.
If you run it as reboot -f, the system reboots.
Don't forget to run sync first if you have mounted
any filesystems.


_________________________________________________________________
Add photos to your messages with MSN 8. Get 2 months FREE*. 
http://join.msn.com/?page=features/featuredemail

