From: Lukas <blurrpp@yahoo.com>
Subject: Re: sources of linux 'system call'
Date: Thu, 13 Sep 2007 10:52:48 -0700 (PDT)
Message-ID: <248508.35182.qm@web50302.mail.re2.yahoo.com>
References: <46E2D07C.5010006@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <46E2D07C.5010006@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Thank You for answer ... i'll read this sources ...
but actualy i want to know what instructions processor
recive after int. My goal is to understand better GDT,
IDT, LDT in Linux, i want to know what's going on when
i call for example 125 system call (sys_mprotect)
whitch allow me change acces rights to given memory
area. Theory i know ( almost everything is writen in
Intel guides ) but i need practice. By the way if
smoebody knoe how to change acces rigts to memory
without system calls, please help :)

regards
Lukas
--- Joshua Roys <TheReader06@comcast.net> wrote:

> Lukas wrote:
> > Hi.
> > I'm looking for sources of system calls. 
> > I mean ...  what program is exeecute after I call
> 'int
> > $0x80' :), for example
> > 
> > 	movq $125,%rax  # call sys_mprotect
> > 	movq $smc_address,%rbx
> > 	movq $0x1000,%rcx
> > 	movq $7,%rdx
> > 	int $0x80
> > 
> >         ?????????????????
> >         ?????????????????
> > 
> > i want to ask if enybody knows where can i find it
> > (they should be somewhere in kernale source, but i
> > couldn't find it)
> > 
> > Regards
> > Lukas
> > 
> 
> Hi,
> 
> Do something like:
> 
> ~/sources/linux-2.6.22.y> find . -type f -exec grep
> -H sys_open \{} \;
> 
> for the open system call code..  they're all over
> the place, the system
> calls.
> 
> sys_open, for example, is in fs/open.c
> 
> Good luck,
> 
> Joshua Roys
> 
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 



       
____________________________________________________________________________________
Building a website is a piece of cake. Yahoo! Small Business gives you all the tools to get online.
http://smallbusiness.yahoo.com/webhosting 
