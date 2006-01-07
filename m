From: joy merwin monteiro <joy.merwin@gmail.com>
Subject: Re: hello again :D
Date: Sat, 7 Jan 2006 09:10:54 +0530
Message-ID: <4b0d6e0d0601061940v6184e250xdb2c209f308ad969@mail.gmail.com>
References: <20060107110622.65f5623a.amerei@gmail.com>
Reply-To: joy_mm@ieee.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20060107110622.65f5623a.amerei@gmail.com>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Niel A <amerei@gmail.com>
Cc: linux-assembly@vger.kernel.org

Hi,

Yes, you cannot write to code memory, it will be read only.
what you could do is write a dummy function, call it and overwrite
the return address on the stack, which is in data memory to return to
a different place
ie, after t1.
IIRC, that will be 4(2?) bytes below top of stack in the function,
after the frame pointer.

mov (sp - 1), bye;
ret ;

might work ?? opinions ???

regards,

Joy
>
> section .text
>         global _start
>
> _start:
>         xor ebx, ebx
>         mov byte [t1], 0x90
>
> t1:
>         inc ebx ; try to skip this so exit(0) instead of exit(1);
>
> bye:
>         xor eax, eax
>         inc eax
>         int 80h
>
> i figured that since an "inc" is 1 byte, mov byte [t1], 90h will do the trick. if the nop was succesful, the proggie would have returned a zero exit status instead of one.
> thanks for your help.
>
> tidings,
> - niel
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--
Only time will tell, but are we listening ? :)
