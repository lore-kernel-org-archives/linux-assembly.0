From: drenal <drenal@fhi.pl>
Subject: atoll
Date: Wed, 18 Feb 2004 16:48:33 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200402181648.33694.drenal@fhi.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hello, I'm a newbie in kernel-level programming, I'm trying to create module 
that compares indone value('d_ino') from 'struct dirent64' with my own data 
put to module thru some modified syscall as char* string.

My question is: How can I convert char* string data to type '__off64_t' which 
is 8 bytes long on my system just like type 'long long'. I tried to use 'long 
long atoll(char*)' function from stdlib.h  but when I include this header in 
my kernel-based source code I have a lot of errors while compiling.

I just want to convert char* data to 'long long' type in kernel-based program. 
How can I do this?

