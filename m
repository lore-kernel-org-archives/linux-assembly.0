From: Slack Traq <slacktraq@yahoo.com>
Subject: Re: Local Symbol Names
Date: Wed, 25 Jun 2003 09:09:58 -0700 (PDT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030625160958.46480.qmail@web11410.mail.yahoo.com>
References: <Law14-F6AauNjVuMhvq0002ae10@hotmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Law14-F6AauNjVuMhvq0002ae10@hotmail.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org


--- S kris <kris_bs@hotmail.com> wrote:
> Hi,
> 
> In some of the assembly files, it's noticed that
> Local Symbol Names have 
> been used that in the following way,
> 
>      ................
>      call 0f
> 0: popl %eax
>     ................
> The call is referring to immediately next statement.
> Please help me in 
> finding out the significance of the above lines in
> the assembly code.
> 
> Thanks
> 
> Kris

Kris: the 'f' after the 'O' in the call statement is
really unnecessary because the label begins in the
next statement. Maybe is a call to a "far" function or
label, but is quite obvious that 'O' is not such
label.
I hope this will help you.
Regards,
                                          Slack

__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com
