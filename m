From: linuxassembly@evobsyniva.com
Subject: Re: How to set up struct pt_regs in assembly?
Date: Fri, 22 Aug 2003 00:20:32 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <opruag0iqelmcbdf@smtp-server.woh.rr.com>
References: <Pine.LNX.4.44.0308212010480.6588-100000@reddevil.virtualblueness.net>
Reply-To: linuxassembly@evobsyniva.com
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0308212010480.6588-100000@reddevil.virtualblueness.net>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: dante@virtualblueness.net
Cc: linux-assembly@vger.kernel.org

> section .data
> shell   db "/bin/sh",0
> nothing db 0
>
> section .text
> _start: execve shell, nothing, nothing

Remember that the argv and envp parameters are pointers to arrays of 
pointers, not pointers to strings.  If you want empty arrays, your 
'nothing' variable needs to be 'dd 0', not 'db 0'.

For a longer example, if you wanted some environment variables and a proper 
argv, the code would look like this:

mov eax, 11  ; ( I'm assuming that's the correct call number )
mov ebx, pathname
mov ecx, argv
mov edx, envp
int 0x80

...and then later...

pathname db "/bin/cat", 0
argv dd arg0, arg1, 0
envp dd var1, var2, 0

arg0 db "cat", 0
arg1 db "/dev/urandom", 0

var1 db "THIS=that", 0
var2 db "THESE=those", 0


