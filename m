From: Bai Shuwei <baishuwei@gmail.com>
Subject: Re: how to get the system hardware information
Date: Tue, 9 Mar 2010 12:18:43 +0800
Message-ID: <f3566d61003082018n7126ebd5g28d35d27d1ed84fc@mail.gmail.com>
References: <f3566d61003081845i52e6f3bej93401eccfb08e733@mail.gmail.com>
	 <1f808b4a1003081946o555bb99dp5a7ff057113e3098@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=6nL0KV/kMLjS/3iyTXEBhOFJziVe3wVuzY3mp5EXBz8=;
        b=gDDyIKraUl4Xx5wGRa/mdqMHQKw3gy1NjW5QyHAjtZkv2zdMpli/IKJhkKFV6l3v2G
         1vJlw8oWLnZ6t83ndNRzsPCYNMItEfw6qqnifvi090AI2iw06gqgdBlq7lXneMhRM22w
         XrFPtZweHJMuFTV7V5gXiHCeuyGnY9vGdAhsk=
In-Reply-To: <1f808b4a1003081946o555bb99dp5a7ff057113e3098@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Peter Chacko <peterchacko35@gmail.com>
Cc: linux-assembly@vger.kernel.org

THanks Peter, it's work by the CPUID instruction.

How i get the mainboard id information?

Best Regards

On 9 March 2010 11:46, Peter Chacko <peterchacko35@gmail.com> wrote:
> cpuid instruction returns that info...take a look at its synopsis and
> which registers it returns what...
>
> On Tue, Mar 9, 2010 at 8:15 AM, Bai Shuwei <baishuwei@gmail.com> wrot=
e:
>> Hi, ALl:
>> =A0 For every hardware, there will one identification, such the
>> processor id, mainboard id, etc.
>> =A0 How i get the system hardware identification information =A0on X=
86
>> platform by assembly language.
>>
>> Thanks all!
>>
>> Bai Shuwei
>>
>> --
>> Love other people, as same as love yourself!
>> Don't think all the time, do it by your hands!
>>
>> E-Mail: baishuwei@gmail.com
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-asse=
mbly" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>



--=20
Love other people, as same as love yourself!
Don't think all the time, do it by your hands!

E-Mail: baishuwei@gmail.com
--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
