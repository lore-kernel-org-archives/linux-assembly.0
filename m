From: Jason Borden <jborden@sorenson.com>
Subject: Loading shared libraries in assembly
Date: Fri, 19 Jul 2002 10:55:05 -0600
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200207191055.05262.jborden@sorenson.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

I'm working on an assembly project using nasm, and I am interested in 
implementing a "plugin" type of architecture, where a plugin can be written 
as a shared library (.so) and loaded dynamically by the program to provide 
additional functionality. Currently the project is written using pure kernel 
system calls, making no reference to libc, and I'd like to keep it that way. 
My question is: is there a way to load shared libraries and their functions 
into an assembly program using kernel system calls without having to go 
through libdl and friends?

Thanks,
Jason
