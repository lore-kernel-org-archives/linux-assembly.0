From: pei lin <telent998@gmail.com>
Subject: Re: why linux ELF base address is 0x8048000?
Date: Fri, 6 Feb 2009 13:38:54 +0800
Message-ID: <d6b7c4190902052138u604bcdc7sd57916b8a3a7eff4@mail.gmail.com>
References: <d6b7c4190902030125w235bca7tdd86b8c94b727e06@mail.gmail.com>
	 <73512bc10902032321n863a27by7ac63193dfc4488a@mail.gmail.com>
	 <d6b7c4190902041758udbf450bg2972b9d7d89b4979@mail.gmail.com>
	 <18826.22050.739005.994893@eidolon.muppetlabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=zbcFl2TCFBbW4cx53HyrVPXMwaoOaGscLLg1siSBDZo=;
        b=W9SUP5RWbJxe6z9yVvBxIrEoLHwVs8r53EpH2lyl/wJzIf0AAEvn/vpTC2eQ9il7b1
         NV1szRjJ3VWyp3kaO88JO16KePSH32MSJynIb3XqG5bQCCj7iqy9VB2h/ey8ITOI9tW6
         K6mg69fdxoMz9Ix+h04bxQM30bi9raBZp7ZDI=
In-Reply-To: <18826.22050.739005.994893@eidolon.muppetlabs.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Brian Raiter <breadbox@muppetlabs.com>
Cc: Chris Evans <teknopup@gmail.com>, linux-assembly@vger.kernel.org

yeah,that explains some reason. But between 0x08000000 and 0x08048000
should be some other reason for X86 architecture . <<The linker and
loader>> said that "permitting most programs to use a single
second-level page table."

But i can not understand it very well.

Lin

2009/2/5 Brian Raiter <breadbox@muppetlabs.com>:
>>   why linux ELF base address is 0x8048000? we can use ld to change
>> the base address or linker script.BUT why default is 0x8048000?
>> There must be some reasons or history i don't know.
>
> As far as I can tell, the reason is that this was the address used by
> SVR4, which was the first release of Unix to use ELF executables.
>
> The reason that SVR4 chose that particular address is that the stack
> top was located at 0x08000000 (growing downward, of course), and then
> the area between 0x08000000 and 0x08048000 was reserved for libc and
> possibly other system service code.
>
> b
>
