From: Lawrence <law@cbf.chinese2000.net>
Subject: A question on cat.asm from asmutils-0.17
Date: Tue, 18 Nov 2003 11:56:29 +0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FB9986D.60709@cbf.chinese2000.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi All,

I'm trying to get acquintant with Linux assembly language by studying
the asm code found in asmutils.

While studying cat.asm, I discover that every time a file is opened
using sys_open, there is no correspondent sys_close to it. (The codes
were marked).

I would like to ask if this is an legitimate way to open a file without
closing it under Linux, or just a convenient way to let the
shell/kernel(I'm not sure...) to close the file for us when cat is
finished.  For my experience on MS-DOS assembly, I must close an
opened-file, or otherwise I'll encounter an out of file handle error.

Thanks and Regards,
Lawrence

