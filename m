From: "Robert G. Plantz" <plantz@SONOMA.EDU>
Subject: Re: Thanks and a question again about execve ()
Date: Tue, 06 May 2003 10:44:13 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <59EAF17E-7FEA-11D7-BCF6-0030657C1952@sonoma.edu>
References: <20030506165031.65362.qmail@web11402.mail.yahoo.com>
Mime-Version: 1.0 (Apple Message framework v552)
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <20030506165031.65362.qmail@web11402.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; delsp="yes"; charset="us-ascii"; format="flowed"
To: Slack Traq <slacktraq@yahoo.com>, linux-assembly@vger.kernel.org

Try something like:

         .data
str1:   .asciz  "foo"   # program name
str2:   .asciz  "bar"   # first argument to program
str3:   .asciz  "baz"   # second argument to program
argv:   .long   str1, str2, str3, 0


and in your code:
         pushl   $0      # envp array address
         pushl   $argv   # argv array address
         pushl   $str1   # address of program name
         call    execve
         addl    $12, %esp


On Tuesday, May 6, 2003, at 09:50 AM, Slack Traq wrote:

> Hello everybody. Thanks to Gigi Sullivan and Brian
> Raiter by their response but i would like to have an
> example of execve() function implemented in GAS,
> because i don't use nasm (I like AT&T syntax).
> I would appreciate help.
> Regards,
------------------------------------------------------------------------ 
---------------
practice (v): To do or perform repeatedly in order to acquire skill.
------------------------------------------------------------------------ 
---------------
Robert G. Plantz, PhD		| http://www.cs.sonoma.edu/~bob
Sonoma State University		| ph: (707) 664-2806
CS Department				| fax: (707) 664-3012
1801 E. Cotati Avenue		| email: plantz@sonoma.edu
Rohnert Park, CA 94928

