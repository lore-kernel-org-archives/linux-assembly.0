From: "S kris" <kris_bs@hotmail.com>
Subject: Local Symbol Names
Date: Wed, 25 Jun 2003 13:53:40 +0530
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Law14-F6AauNjVuMhvq0002ae10@hotmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org
Cc: kernelnewbies@nl.linux.org

Hi,

In some of the assembly files, it's noticed that Local Symbol Names have 
been used that in the following way,

     ................
     call 0f
0: popl %eax
    ................
The call is referring to immediately next statement. Please help me in 
finding out the significance of the above lines in the assembly code.

Thanks

Kris

_________________________________________________________________
Bollywood's back! Will June keep up the tempo? 
http://server1.msn.co.in/features/junemovies03/index.asp

