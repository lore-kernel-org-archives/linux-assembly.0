From: Bai Shuwei <baishuwei@gmail.com>
Subject: Re: meaning of .section ".bstext", "ax"
Date: Wed, 14 Apr 2010 19:56:26 +0800
Message-ID: <n2hf3566d61004140456mccc61215ya530228a0f8e1c22@mail.gmail.com>
References: <h2h887f81cc1004140406m77e45985u21ab9940ea87d33c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=PdSgjZHwEEec+w/ODHMFpELH2eHIItkdJjiUjEmo0lM=;
        b=EtM0q2GNfJO5ZCc7FxM0nkxKHBhEeLyOPCnWt4nkmJ01p6KuFu7sdV5C1fo6YhWzdB
         UpoqA6Xp3HGAOWiNtu+s3tCDqBimqk5Y/0nsOaSz1IE/G4abtPH3r+vTcOpv/KJOsYWX
         DpENhDQA8PpcuWK9QqlflBDULTxijCMZfD7lw=
In-Reply-To: <h2h887f81cc1004140406m77e45985u21ab9940ea87d33c@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: anil kumar <m.anilkumar80@gmail.com>
Cc: linux-assembly@vger.kernel.org

On 14 April 2010 19:06, anil kumar <m.anilkumar80@gmail.com> wrote:
> Hello,
> I am trying to understand assembly code written in arch/x86/boot/head=
er.S code.
> I am not able to grab meaning of following line:
> =A0.section ".bstext", "ax"
=2Esection name [flags]

=2Ebstext is the section name
a
  section is allocatable
x
  section is executable
>
> Can you tell meaning of this line ?
>
> Thanks,
> Anil
>
> PS: It would be great help if someone can point any link which explai=
n
> code mentioned in this file.
> I am not able to locate any good link using google search engine.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assem=
bly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
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
