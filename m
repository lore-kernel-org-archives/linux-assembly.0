From: Geiregat Jonas <kemu@sdf-eu.org>
Subject: question about variables
Date: Thu, 15 May 2003 16:50:12 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3EC3C544.8050307@sdf-eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Hey, I have 2question about linux assembly
I have written a basic programme
It's really simple I use the open, read and write syscall
To open a file (/etc/passwd) read it and print it out to the screen.
Now when reading the file I read it into a buffer declared like this 
(using nasm)
section .bss
    buffer  resd 1

so I reserve one double word of space. so that is 4bytes. /etc/passwd is 
much bigger then that but still I see the whole file printed I find this 
strange (I'm also not sure about the 1 behind resd I think it's stands 
for reserve 1 doubleword of space)

My other question is how can I accept,  command line arguments in asm 
using nasm
Regards Jonas

