From: kt <kt1023@comcast.net>
Subject: Where to find register content after exception ?
Date: Sat, 10 Jul 2004 14:45:15 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <40F0393B.104@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org


Hi,

I would like to get hold of the machine state after my user space 
exception handler has been invoked by the kernel.
I wonder whether this information is passed by the  third argument if 
this type of handler :

void (*sa_sigaction)(int, siginfo_t *, void *);

has been installed by sigaction (man sigaction doesn't tell me this). 
The other possibility could be that the kernel deposits this information 
somewhere on the user stack before invoking the handler. I wonder 
whether this is indeed the case and whether someone has already come up 
with a nice solution to access this data if it is available in this 
form. Since this is possibly system dependent, let me mention that I'm 
using linux-ppc32 version 2.6.6 running on a PowerMacG5.


Regards,

K. Timmler
