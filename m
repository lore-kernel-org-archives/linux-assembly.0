From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: newbie :adding larger value
Date: Thu, 27 Nov 2003 09:07:33 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FC5B0C5.9040009@eprocess.fr>
References: <20031127124723.6b3aeb07.vadiraj@mail.cyberneme.com>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20031127124723.6b3aeb07.vadiraj@mail.cyberneme.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vadiraj C S <vadiraj@mail.cyberneme.com>
Cc: linux-assembly@vger.kernel.org

hum, as a float ar as an integer?

i don't have much time to take care of all cases, here is the basic:

64bits integer not signed:
you must add the lower 32 bits, take care of the carry, add this to the 
upper 32 bits and add then the upper 32 bits. (but you may loose the 
upper carry...)
something like this:

;add 64 bits eax(upper 32bits)ebx(lower 32bits)
;to 64 bits ecx(upper) edx(lower)
add edx,ebx      ;add the lower 32 bits
jnc no_lowcarry      : if no carry, just add the upper 32bits
    inc ecx            ;if carry, increments the upper 32bits
no_lowcarry:
add ecx,eax   ;add the upper 32bits

jnc no_upcarry
    ;error: this would result to a 65 bits number (too big to stands in 
a 64 bits number)
    ;handle it here
no_upcarry:

Fred


Vadiraj C S wrote:

>  Hello Everyone..
>
>   I'm a newbie. Has any one worked on adding a large value in assembly. I mean
> a value which is larger than 32 bit. How is this mathematics taken care...
>
>
>
>
>
>  
>


