From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: ELF binarry
Date: Wed, 15 Oct 2003 08:39:34 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F8CEBA6.3020706@eprocess.fr>
References: <20031014152812.24625.qmail@linuxmail.org>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20031014152812.24625.qmail@linuxmail.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ssams sudin <sams@linuxmail.org>
Cc: linux-assembly@vger.kernel.org

ssams sudin wrote:

>with GDB or another debugger, can we look at highest memory address of ELF binarry.
>if yes what is the command ?
>where can i found some reference about it?
>
>forgive me if this subject out of topic or just repeating last post
>regard
>ssams
>  
>

You may find usefull to see all infos about your elf with the 'readelf' 
tool.
$ readelf -a /bin/dd
will display a lot of interesting thing about where is what (but it is 
oriented to shared libraries though...)

It is usefull to see the basic organisation of a program, before 
starting debug it.

Fred

