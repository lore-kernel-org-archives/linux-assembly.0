From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: how to reboot ?
Date: Tue, 12 Nov 2002 17:00:27 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3DD1259B.8030801@eprocess.fr>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Hi all,

I'm working in early stage in the Linux loading.
I'm in the linuxrc of a initrd, and I would like to reboot the machine.
Of course, as init is not started (it starts at the exit of linuxrc), 
things like shutdown, reboot, telinit 6 will not work.
So, question:
Does anybody know how I may do to reboot?

I remember that there are ways to do this in x86 (i'm working on a geode 
SetTopBox, basicaly compatible with a pentium), but I don't remember 
exactly how.
Any help would be appreciate!

Thanks in advance.

Fred

