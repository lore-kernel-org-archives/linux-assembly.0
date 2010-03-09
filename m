From: Peter Chacko <peterchacko35@gmail.com>
Subject: Re: how to get the system hardware information
Date: Tue, 9 Mar 2010 09:16:19 +0530
Message-ID: <1f808b4a1003081946o555bb99dp5a7ff057113e3098@mail.gmail.com>
References: <f3566d61003081845i52e6f3bej93401eccfb08e733@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=m7eyz0e0jaWqIRDKKcTlYyoXMqkCHEAYctwW/NHXQlQ=;
        b=r44gQ0MNzPg04BQ65MOvGyEpK/AOOk6dgStBdZsfJQuW+CZFdSVjV5izd39mP+PMrL
         jbqOMJxm9AGdCnWcLD6aWl0WUlfXkARfd+SSg9Wsfnc+grrdR9bXDnZn4x9A6aoMjl1u
         FyfmVyWzKOwplzSzaDrfDFKiy+gfN3wfaWB4k=
In-Reply-To: <f3566d61003081845i52e6f3bej93401eccfb08e733@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bai Shuwei <baishuwei@gmail.com>
Cc: linux-assembly@vger.kernel.org

cpuid instruction returns that info...take a look at its synopsis and
which registers it returns what...

On Tue, Mar 9, 2010 at 8:15 AM, Bai Shuwei <baishuwei@gmail.com> wrote:
> Hi, ALl:
> =A0 For every hardware, there will one identification, such the
> processor id, mainboard id, etc.
> =A0 How i get the system hardware identification information =A0on X8=
6
> platform by assembly language.
>
> Thanks all!
>
> Bai Shuwei
>
> --
> Love other people, as same as love yourself!
> Don't think all the time, do it by your hands!
>
> E-Mail: baishuwei@gmail.com
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assem=
bly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
