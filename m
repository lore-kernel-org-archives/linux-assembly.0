From: Hernan <beri@ciudad.com.ar>
Subject: debugging in linux
Date: Sat, 14 Sep 2002 11:31:05 -0300
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <4.3.2.7.2.20020914112556.00bdb340@mail.ciudad.com.ar>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hello,

I'm trying to debug a program (without debug information) with gdb but I 
can't do some things:

1) How can I run step by step,
2) see the registers values (including eip),
3) make a dump of memory

I'm running code that starts in 0x80003c0 and when I try disas 0x80003c0 I 
get "No function contains specified address".

The executable is a test that I'm doing I change the elf entry point and 
put some code there.

Is there a softice like debugger for linux? where can I get it?
Thanks in advance!

Hernan

