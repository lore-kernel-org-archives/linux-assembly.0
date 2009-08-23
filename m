From: Claudio Fontana <claudio.fontana@gmail.com>
Subject: Re: Appendix: multithreating HOWTO ? :)
Date: Sun, 23 Aug 2009 17:23:00 +0200
Message-ID: <2c04dc350908230823uf1eb9a0t34bbcf611fa2e5b1@mail.gmail.com>
References: <556680.44596.qm@web50309.mail.re2.yahoo.com> <4A9145B0.50507@gmail.com> 
	<4A915A8E.4000207@zytor.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=Ur6bNsNzjRT8dQQz9Q/Cw6wtcI4e21DQ6NZalrMJ+Qs=;
        b=HgoMeU+CcMm0SjLxNOlCgwrfCLE5NNCNrq3Z/87GLMJ5j6NZRX2TliZUqioChAENZF
         +E/TNC2c8TtfzRRDxTtruWegyAAiTeEOmuTqXcdC6W6eX3YAtt5DudBEJJtlZw5QLU1c
         Iw1Fj0hCKIjzIH3/bE/SaNi8Uf1q/PkCK4RNQ=
In-Reply-To: <4A915A8E.4000207@zytor.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Frank Kotler <fbkotler@zytor.com>
Cc: =?ISO-8859-1?B?o3VrYXN6?= <blurrpp@yahoo.com>, linux-assembly@vger.kernel.org

On Sun, Aug 23, 2009 at 5:04 PM, Frank Kotler<fbkotler@zytor.com> wrote=
:
> Claudio Fontana wrote:
>>
>> =C5=81ukasz wrote:
>>>
>>> in appendix i want to just precize problem. Broblem is how to write=
,
>>> create etc, shared memory for parent and child proceses, where they=
 could
>>> for example exchange wariables
>>
>> You are using fork. Fork is used to create new processes.
>> You probably want clone instead, to create new threads and specify
>> which resources to share between the two threads.
>>
>> man 2 clone
>>
>> sys_clone is 120 (0x78).
>
> Is that a 64-bit sys_call number? I thought they'd changed that on us=
=2E
> AFAIK, __NR_clone is 56 these days... and "syscall" replaces int 0x80=
=2E A
> real "curve ball" to asm programmers! Well, they *told* us not to do =
it that
> way. :)
>
> Best,
> Frank

I am still on good old 32bit. On 64 bit system call numbers are indeed
completely different.
--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
