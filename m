From: Jan Wagemakers <janw@easynet.be>
Subject: Re: About a-linux (asmutils mini-distribution)
Date: Fri, 11 Nov 2005 11:23:13 +0100
Message-ID: <20051111102313.GB9512@qwerty.be>
References: <20051028100421.GA30103@qwerty.be>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20051028100421.GA30103@qwerty.be>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Jan Wagemakers <janw@easynet.be> schreef:

[http://asm.sourceforge.net/asmutils.html]
> However, I have some questions ;-)

Konstantin Boldyshev has send me an email with some answers. I'll
summerize it here, maybe someone find it interessting.

> - When I read the ChangeLog
>   <http://asm.sourceforge.net/asmutils/ChangeLog>, I see that there are
>   some new versions of some programs (20-Jan-2004). Which are not
>   released yet. Can I download them somewhere?

<http://cvs.sourceforge.net/viewcvs.py/asm/>

> - Is there somewhere a little tool available written is asm which I can
>   use to set the default gateway (route add default gateway)? At the
>   moment I use busybox for that <http://www.busybox.net/>.

Konstantin has explained to me that ifconfig.asm is the source for both
ifconfig and route. And indeed, that did the job! Nice!


-- 
Met vriendelijke groetjes         - Jan Wagemakers -

... Boy, everyone is stupid except me.              --Homer Simpson
