From: Gigi Sullivan <sullivan@sikurezza.org>
Subject: Re: Thanks and a question again about execve ()
Date: Tue, 6 May 2003 22:46:51 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030506204651.GC961@kappei.pacana.org>
References: <20030506165031.65362.qmail@web11402.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030506165031.65362.qmail@web11402.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Slack Traq <slacktraq@yahoo.com>
Cc: linux-assembly@vger.kernel.org

Aiee :)

   Hello!
   
On Tue, May 06, 2003 at 09:50:31AM -0700, Slack Traq wrote:
> because i don't use nasm (I like AT&T syntax).
> I would appreciate help.
> Regards,
> 
> 
> 
>                                         Slack

   AT&T syntax follows - same consideration as my previous post ...
   (it's a simple translation from the nasm example I posted before)

   Ah, remember the famous Perl's motto: "There's more than one way
   to do it", IMHO :)

   # execve(2) syscall asm example
   # AT&T syntax

   .data

   string:
      .asciz "/bin/sh"         

   array:
      .long   string, 0       # the array which holds the bin/sh address
                              # and the nil entry as last.

   .text

   .globl _start              # keep ld happy
   _start:

      movl $string, %ebx
      movl $array, %ecx       # or if you prefer leal (array), %ecx
      movl $0x0, %edx         # or if you prefer leal (array+4), %edx
      movl $0xb, %eax
      int $0x80

   Please remember that if something goes wrong with the syscall
   invocation above, you'll get a segfault since the code flow will
   continue after the int $0x80 statement.

   Put an exit after that: this is to get an exit(0)

      movl %edx, %ebx
      movl $0x1, %eax
      int $0x80

   Uhm I noted I didn't explained at all what the code above means
   exactly, sorry. If there's something "hard" to understand, please
   let me know.

   All the things I said are IMHO :)

bye,
GG sullivan

-- 
Lorenzo Cavallaro `Gigi Sullivan' <sullivan@sikurezza.org>

Until I loved, life had no beauty;
I did not know I lived until I had loved. (Theodor Korner)
