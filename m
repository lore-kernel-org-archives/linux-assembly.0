From: "pei lin" <telent998@gmail.com>
Subject: Re: LinuxAsmTools Announcement
Date: Fri, 19 Dec 2008 13:10:07 +0800
Message-ID: <d6b7c4190812182110k4375714vaa01dc16cf2e5bf2@mail.gmail.com>
References: <200812131056.00246.linuxasm@gmail.com>
	 <d6b7c4190812181950o6bc5d5ebv3196ee2a0cf9b575@mail.gmail.com>
	 <18763.9416.687634.712515@eidolon.muppetlabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=mLQdDjaUJY7FKo6/JvTAcnE/+IJl6ypJZ8VbRt2sKNI=;
        b=PPrZHZyh4RS46EoLiOJuIZ+/8EHq2Ib5PfXIEXPUScD0F4IQ6by8fh7MupccENB2q9
         W6S7GLHigtzuMYalL+UbwriLqjOHIlChpN13wnPgYedwesuAPfYQgJ8bZzzZD3yU0B5T
         fKuiwQ4Ulk9KvxqKMxCmdPTflmgf3tq4dZgr0=
In-Reply-To: <18763.9416.687634.712515@eidolon.muppetlabs.com>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Brian Raiter <breadbox@muppetlabs.com>
Cc: linux-assembly@vger.kernel.org

OH~~~ great,thx for u help,that really a tip.

2008/12/19 Brian Raiter <breadbox@muppetlabs.com>:
>> when i disassemble *.o object file on x86 machine and find
>> instruction "call 0xFCFFFFFF",because not link,but why this address
>> 0xFCFFFFFF not 0xFFFFFFFF or others?
>
> First of all, the value is not 0xFCFFFFFF, it's 0xFFFFFFFC
> (little-endian), which is the 32-bit equivalent of -4.
>
> And the reason for the -4 is that it's an offset. When the linker
> fills in the real address, it will subtract the subroutine's absolute
> address from the address of the -4 value to get a relative address,
> which it will then add to the existing -4 to get the correct relative
> address for the call instruction. And, the reason that 4 needs to be
> subtracted is that when the call is executed, it will actually jump
> from the end of the call instruction, which is 4 bytes ahead of where
> the relative address is stored.
>
> b
>
>
