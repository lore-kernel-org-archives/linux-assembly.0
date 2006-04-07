From: Thiago Silva <thiago.silva@kdemail.net>
Subject: nasm / code distance
Date: Fri, 07 Apr 2006 18:47:32 +0000
Message-ID: <200604071847.32559.thiago.silva@kdemail.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hello,
I'm having some troubles with an asm application.

The first problem is about the "short jump".
I get those messages "error: short jump is out of range" when using nasm on my 
sources. Researching, I found that people answer this by saying "use -O1".
Now, is this the appropriated way to deal with this problem?

Second, I've been getting some strange (?) segfaults...
Using valgrind, I found that there were 3 invalid reads on memory.
Those reads uses data in the .data section. Now, moving the problematic 
function to the beginning of the file, close to the entry point and other 
sections, valgrind didn't complain and I got no segfaults.

I'm obviously missing something, so...can anyone help?

Thanks in advance,
-- 
+Thiago Silva
