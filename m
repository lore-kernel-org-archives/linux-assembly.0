From: Leonardo Di Lella <dilella@gmx.net>
Subject: Re: entering char from keyboard
Date: Mon, 29 Apr 2002 07:35:36 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020429053536.GC650@cube.free-bsd.org>
References: <web-7206429@m1.plasa.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <web-7206429@m1.plasa.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ssams <ssams@telkom.net>
Cc: linux-assembly@vger.kernel.org

Re!

* On 29 April, 2002 11:28:55 AM
* "ssams" (ssams@telkom.net) wrote:
> Assalamu 'alaikum..... everybody
Assalamu,

> I want to build code to enter some char from keyboard
> what syscall i need...?
#define __NR_read      3,

for reading, and maybe also __NR_write for writing it at stdout ...

look also at
$ man 2 read

Your file d. should be stdin
myst@xor:/dev$ ls -al stdin
lrwxrwxrwx    1 root     root            4 24. Nov 17:38 stdin -> fd/0

bye

--
Leonardo Di Lella

[0x01] http://www.comfire.de
[0x02] http://www.netline-is.de
