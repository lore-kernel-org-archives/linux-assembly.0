From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: looping_code
Date: Sat, 31 Aug 2002 17:51:59 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D70E61F.39C1CA6B@wp.pl>
References: <Pine.SGI.4.40.0208310210540.117091029-100000@shell01.TheWorld.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Scott Lanning wrote:
> 
> On Mon, 26 Aug 2002, ssams wrote:
> > .data
> > msg: .byte 65,10
> >
> > .text
> >    .globl mulai
> > mulai:
> >     mov $10,%edx
> >
> > ulang:
> >   mov $4,%eax
> >   mov $1,%ebx
> >   mov $msg,%ecx
> 
> This moves the value at 'msg'
> rather than a pointer to 'msg'.
> Try this:
> 
>     leal msg, %ecx

"mov $msg,%ecx" and "lea msg,%ecx" does the same thing in this example -
moves ptr to 'msg' to the ecx register. The only difference is that the
first one is coded one byte shorter.

Regards,

-- 
Maciej Hrebien

