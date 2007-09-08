From: Joshua Roys <TheReader06@comcast.net>
Subject: Re: sources of linux 'system call'
Date: Sat, 08 Sep 2007 12:40:28 -0400
Message-ID: <46E2D07C.5010006@comcast.net>
References: <478396.28358.qm@web50305.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <478396.28358.qm@web50305.mail.re2.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Lukas wrote:
> Hi.
> I'm looking for sources of system calls. 
> I mean ...  what program is exeecute after I call 'int
> $0x80' :), for example
> 
> 	movq $125,%rax  # call sys_mprotect
> 	movq $smc_address,%rbx
> 	movq $0x1000,%rcx
> 	movq $7,%rdx
> 	int $0x80
> 
>         ?????????????????
>         ?????????????????
> 
> i want to ask if enybody knows where can i find it
> (they should be somewhere in kernale source, but i
> couldn't find it)
> 
> Regards
> Lukas
> 

Hi,

Do something like:

~/sources/linux-2.6.22.y> find . -type f -exec grep -H sys_open \{} \;

for the open system call code..  they're all over the place, the system
calls.

sys_open, for example, is in fs/open.c

Good luck,

Joshua Roys

