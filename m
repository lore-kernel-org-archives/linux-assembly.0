From: "Jason Roberts" <v3ct0r99@hotmail.com>
Subject: self modifying code
Date: Mon, 03 Nov 2003 17:14:57 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Law9-F108sMoWOiTPyF00012d50@hotmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hi all--
I'd like to be able to implement this cool trick called smc.
It's used mostly by crackers and virus coders, but has also
been used in JIT compilers.

I know the *basic* steps:
1) mov reg1, code-to-write
2)  mov [addr-to-write-to], reg1

how can I do this in nasm?
Thanks
pb

_________________________________________________________________
See when your friends are online with MSN Messenger 6.0. Download it now 
FREE! http://msnmessenger-download.com

