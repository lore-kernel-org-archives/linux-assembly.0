From: ahmet fazil say <ahmetfazil@gmail.com>
Subject: how can i compile C code for m68000 with gcc
Date: Thu, 24 Mar 2005 21:09:17 +0200
Message-ID: <cb3a16fe05032411094a21d73e@mail.gmail.com>
Reply-To: ahmet fazil say <ahmetfazil@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi,
I am trying to compile C code for m680x0, but i can't.
i am using my P4 1.6ghz processor, gcc version 3.3.5 and using Debian Linux 3.

I tried
         %gcc -b68000  .....
but it gave error
         gcc-3.3: couldn't run `m68000-gcc-3.3.5': No such file or directory

than i tried
         %gcc -o filex  filex.c   -m68000
again it gave error
         cc1: error: invalid option `68000'

what must i do.
