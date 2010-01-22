From: Scott Sibley <sisibley@gmail.com>
Subject: Re: Troubles with JIT compiler
Date: Fri, 22 Jan 2010 01:16:43 -0600
Message-ID: <cb4d391b1001212316p736a62cfrce0f5ad43896f671@mail.gmail.com>
References: <cb4d391b1001212012l654d2a93qe8d05187f8f5ecf0@mail.gmail.com>
	 <1264137975.1983.30.camel@bob-desktop>
	 <cb4d391b1001212204u73bbda5cub4e36e88836a2972@mail.gmail.com>
	 <1264143669.1983.38.camel@bob-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Cz1CpFcNG89wH/x5/mVxR1JhYAjCz9I8O7iD5qqBPr4=;
        b=rjvSpj8JgPc75uDbDuNpmz1LkYU2l3FVrpvDpOUVzWBbN/8KqPDWrzFdSGiBPenA4K
         R37s4mSYs/Ahy/1DmiYyX2ZWqmufVwh7RAklqfGnp0GVkAj15NcN3Fe9reYeHWa6Fosm
         HI1+hKTov064DEFV0vZR+fWGRMoLJi0sbQZk8=
In-Reply-To: <1264143669.1983.38.camel@bob-desktop>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Robert Plantz <plantz@sonoma.edu>
Cc: linux-assembly@vger.kernel.org

On Fri, Jan 22, 2010 at 1:01 AM, Robert Plantz <plantz@sonoma.edu> wrot=
e:
> Very big oops here! See below.
>
>
>> >>
>> >> Well, it appears to be crashing at the first instruction. Here ar=
e the
>> >> values of ebp and esp.
>> >>
>> >> (gdb) x/x $ebp
>> >> 0xbffff168: =A0 =A00xbffff188
>> >> (gdb) x/x $esp
>> >> 0xbffff14c: =A0 =A00x0804e481
>> >>
>
> I misread your gdb display. I'm used to using the i r command to look=
 in
> the registers.
>
> You used the x/x command, which shows the contents of the register, t=
hen
> what it is pointing to.
>
> So the values in ebp and esp DO look reasonable. That's the range I
> expect in 32-bit program, and they are reasonably close to each other=
=2E
>
> I apologize for my error.
>
> >From what you have posted, I don't see any problems with the first f=
ew
> instructions. So I have no idea why the program is crashing there.
>
> Sorry...
>
> --Bob
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assem=
bly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Ah I see. Just for giggles here's the output of 'i r'

(gdb) i r
eax            0x8067888	134641800
ecx            0xbffff07c	-1073745796
edx            0x8067990	134642064
ebx            0x970ff4	9900020
esp            0xbffff14c	0xbffff14c
ebp            0xbffff168	0xbffff168
esi            0x0	0
edi            0x0	0
eip            0x8067990	0x8067990
eflags         0x206	[ PF IF ]
cs             0x73	115
ss             0x7b	123
ds             0x7b	123
es             0x7b	123
fs             0x0	0
gs             0x33	51
--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
