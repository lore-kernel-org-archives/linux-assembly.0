From: Muthu <dearestchum@yahoo.co.in>
Subject: Re: 32-bit assembler::how to initialize segment registers
Date: Tue, 19 Oct 2004 07:47:27 -0700 (PDT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20041019144727.52029.qmail@web8406.mail.in.yahoo.com>
References: <1098164458.4174a8ea294cc@imp6-q.free.fr>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <1098164458.4174a8ea294cc@imp6-q.free.fr>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: zebarbuc@free.fr, linux-assembly@vger.kernel.org

Hi !
I guess you have to refer to intel architecture
manual.
Generally you arent supposed to load the segment
registers directly. That is taken care of by the
loader program. eg: ld.so in GNU/Linux.
This [loading segment registers] is a problem only
if you are making straight binary code, that runs
[eg: Bootloader, Embedded code]. 
For this case do something like
  /* in INTEL syntax */
  mov ax,0xfff
  mov ds,ax
  mov fs,ax
  
Cheers
Muthu


		
_______________________________
Do you Yahoo!?
Declare Yourself - Register online to vote today!
http://vote.yahoo.com
