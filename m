From: Gigi Sullivan <sullivan@sikurezza.org>
Subject: Re: Example of execve
Date: Wed, 30 Apr 2003 00:57:23 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030429225723.GK959@kappei.pacana.org>
References: <20030429193112.27027.qmail@web11406.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030429193112.27027.qmail@web11406.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Slack Traq <slacktraq@yahoo.com>
Cc: linux-assembly@vger.kernel.org

Aiee :)

   Hello!

On Tue, Apr 29, 2003 at 12:31:12PM -0700, Slack Traq wrote:
> Can anyone give me an example of how can i implement
> the execve syscall under asm, because I don't know how
> to pass arrays as parameters.
> Thank you in advance,
> 
>                                        Slack Ware

   Here below you can find a simple example (nasm syntax)
   about executing an execve syscall. For the sake of simplicity
   there are no sanity checks, however.

      ; execve(2) syscall asm example
      ; nasm syntax 

      SECTION .text

      _start:

         mov ebx, array
         lea ecx, [array+8]
         lea edx, [array+12]
         mov eax, 0xb
         int 0x80

      SECTION .data

      array db '/bin/sh', 0
            dd array
            dd 0

   This way we're not calling any glibc function but we're issuing 
   the 0x80 interrupt software. The ELF obtained it's fully relocatable
   since we're running a syscall ...

   Hope this helps a bit and that is what you're looking for.

bye,
GG sullivan

-- 
Lorenzo Cavallaro `Gigi Sullivan' <sullivan@sikurezza.org>

Until I loved, life had no beauty;
I did not know I lived until I had loved. (Theodor Korner)
