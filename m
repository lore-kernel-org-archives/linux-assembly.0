From: Scott Sibley <sisibley@gmail.com>
Subject: Re: Troubles with JIT compiler
Date: Fri, 22 Jan 2010 04:45:40 -0600
Message-ID: <cb4d391b1001220245n61ff839elc19851404017f4a3@mail.gmail.com>
References: <cb4d391b1001212012l654d2a93qe8d05187f8f5ecf0@mail.gmail.com>
	 <1264137975.1983.30.camel@bob-desktop>
	 <cb4d391b1001212204u73bbda5cub4e36e88836a2972@mail.gmail.com>
	 <1264143669.1983.38.camel@bob-desktop>
	 <cb4d391b1001212316p736a62cfrce0f5ad43896f671@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=ASJRcxHfKpSfYV3sTDPlT9n/mqDsapdI2jhV5smM4no=;
        b=fl7DQskl0cl1Ei16olQZ9jYWq+B9aU4UJOFJGpfaWY9tqfC49AgOsAoafWk52k8824
         PogRwKs0iwvy3sJ/C+mImmsTM9av2KlsXn56EdQ2ws4t++JfgzjOpHLtT4KB3hyZT6HH
         zmyPSVSb72Sl9aVM9XYRoHKcKEGaKsA0BX+Hk=
In-Reply-To: <cb4d391b1001212316p736a62cfrce0f5ad43896f671@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Robert Plantz <plantz@sonoma.edu>
Cc: linux-assembly@vger.kernel.org

On Fri, Jan 22, 2010 at 1:16 AM, Scott Sibley <sisibley@gmail.com> wrot=
e:
> On Fri, Jan 22, 2010 at 1:01 AM, Robert Plantz <plantz@sonoma.edu> wr=
ote:
>> Very big oops here! See below.
>>
>>
>>> >>
>>> >> Well, it appears to be crashing at the first instruction. Here a=
re the
>>> >> values of ebp and esp.
>>> >>
>>> >> (gdb) x/x $ebp
>>> >> 0xbffff168: =A0 =A00xbffff188
>>> >> (gdb) x/x $esp
>>> >> 0xbffff14c: =A0 =A00x0804e481
>>> >>
>>
>> I misread your gdb display. I'm used to using the i r command to loo=
k in
>> the registers.
>>
>> You used the x/x command, which shows the contents of the register, =
then
>> what it is pointing to.
>>
>> So the values in ebp and esp DO look reasonable. That's the range I
>> expect in 32-bit program, and they are reasonably close to each othe=
r.
>>
>> I apologize for my error.
>>
>> >From what you have posted, I don't see any problems with the first =
few
>> instructions. So I have no idea why the program is crashing there.
>>
>> Sorry...
>>
>> --Bob
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-asse=
mbly" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
> Ah I see. Just for giggles here's the output of 'i r'
>
> (gdb) i r
> eax =A0 =A0 =A0 =A0 =A0 =A00x8067888 =A0 =A0 =A0 =A0134641800
> ecx =A0 =A0 =A0 =A0 =A0 =A00xbffff07c =A0 =A0 =A0 -1073745796
> edx =A0 =A0 =A0 =A0 =A0 =A00x8067990 =A0 =A0 =A0 =A0134642064
> ebx =A0 =A0 =A0 =A0 =A0 =A00x970ff4 9900020
> esp =A0 =A0 =A0 =A0 =A0 =A00xbffff14c =A0 =A0 =A0 0xbffff14c
> ebp =A0 =A0 =A0 =A0 =A0 =A00xbffff168 =A0 =A0 =A0 0xbffff168
> esi =A0 =A0 =A0 =A0 =A0 =A00x0 =A0 =A0 =A00
> edi =A0 =A0 =A0 =A0 =A0 =A00x0 =A0 =A0 =A00
> eip =A0 =A0 =A0 =A0 =A0 =A00x8067990 =A0 =A0 =A0 =A00x8067990
> eflags =A0 =A0 =A0 =A0 0x206 =A0 =A0[ PF IF ]
> cs =A0 =A0 =A0 =A0 =A0 =A0 0x73 =A0 =A0 115
> ss =A0 =A0 =A0 =A0 =A0 =A0 0x7b =A0 =A0 123
> ds =A0 =A0 =A0 =A0 =A0 =A0 0x7b =A0 =A0 123
> es =A0 =A0 =A0 =A0 =A0 =A0 0x7b =A0 =A0 123
> fs =A0 =A0 =A0 =A0 =A0 =A0 0x0 =A0 =A0 =A00
> gs =A0 =A0 =A0 =A0 =A0 =A0 0x33 =A0 =A0 51
>

After someone's tip, I found a solution to this. Passing the linker
'-z execstack' made it run, no problem. It's funny that Linux didn't
complain about it, but rather just seg-faulted.
--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
