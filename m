From: Corey Holcomb-Hockin <crsntlvs@ipeg.com>
Subject: gcc gas errors and vim
Date: Sat, 09 Nov 2002 17:10:15 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3DCDB1F7.8070007@ipeg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

When I get a error assembling with gcc vim gets pointed to a temporary 
file with a random name that doesn't exist anymore instead of the actual 
source file.  I wondered if there is a workaround or if I should give a 
bug report to gcc.

I'm using
gcc 2.95.4
gas 2.12.1
gmake 3.79.1
vim 6.1 with patches up to 183

this is some example output when I make in vim.

gcc    -c -o main.o main.S
/tmp/ccXhsmV7.s: Assembler messages:
/tmp/ccXhsmV7.s:22: Error: suffix or operands invalid for `mul'
gmake: *** [main.o] Error 1


