From: hpr <phpr@snafu.de>
Subject: Re: Local Symbol Names
Date: Wed, 25 Jun 2003 19:06:06 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200306251906.06250.phpr@snafu.de>
References: <20030625160958.46480.qmail@web11410.mail.yahoo.com>
Reply-To: phpr@snafu.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20030625160958.46480.qmail@web11410.mail.yahoo.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Slack Traq <slacktraq@yahoo.com>, linux-assembly@vger.kernel.org

Slack Traq am Mittwoch, 25. Juni 2003 17:09:
> --- S kris <kris_bs@hotmail.com> wrote:
> > Hi,
> >
> > In some of the assembly files, it's noticed that
> > Local Symbol Names have
> > been used that in the following way,
> >
> >      ................
> >      call 0f
> > 0: popl %eax
> >     ................
> > The call is referring to immediately next statement.
> > Please help me in
> > finding out the significance of the above lines in
> > the assembly code.
> >
> > Thanks
> >
> > Kris
>
> Kris: the 'f' after the 'O' in the call statement is
> really unnecessary because the label begins in the
> next statement. Maybe is a call to a "far" function or
> label, but is quite obvious that 'O' is not such

nonsense! (assumed the code is from binutils' AS)

numeric labels can be redefined.
they are directionally referred, "f"orward  or "b"ackword

the example fetches the address at label '0' to eax, which can be used to 
supporting position independent code.

best,
	hp


> label.
> I hope this will help you.
> Regards,
>                                           Slack
>
> __________________________________
> Do you Yahoo!?
> The New Yahoo! Search - Faster. Easier. Bingo.
> http://search.yahoo.com
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
  pse, reply to << lxhp -at- lxhp -dot- in-berlin -dot- de >>

