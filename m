From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: looping_code
Date: Sun, 01 Sep 2002 11:21:36 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D71DC20.A89B7F13@wp.pl>
References: <7D0EEAE2-BD04-11D6-B059-003065A88832@sonoma.edu>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Robert Plantz wrote:
> 
> > "mov $msg,%ecx" and "lea msg,%ecx" does the same thing in this example -
> > moves ptr to 'msg' to the ecx register. The only difference is that the
> > first one is coded one byte shorter.
> >
> 
> which can be seen if you do:
> mov $msg,%ecx
> leal msg,%edx
> 
> and look in the debugger ---
> (gdb) i r
> eax            0x4      4
> ecx            0x80494c8        134517960
> edx            0x80494c8        134517960
> ebx            0x1      1
> 
> Furthermore, if you look at the listing --
>    12 000f B9000000      mov $msg,%ecx
>    12      00
>    13 0014 8D150000      leal msg,%edx
>    13      0000

Yes, that's right. Sorry for the mess - (don't know why) i received Your
"proof reply" just after i send my. In final we got two messages saying
the same :)

Regards,

-- 
Maciej Hrebien

