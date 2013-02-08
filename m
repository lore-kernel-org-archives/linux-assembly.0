From: Robert Plantz <plantz@sonoma.edu>
Subject: RE: mov instruction
Date: Fri, 8 Feb 2013 20:30:42 +0000
Message-ID: <6E3CF6FDA48EC747AAAE0EAEDF16EFF802C63F18@coronet.solar.sonoma.edu>
References: <20130207035714.GC2669@debian.localdomain>
 <CADtGFv=CY+wFMRgzsrp3wcspMEhUYnCKSpQz6vfHJYhTUbVXBQ@mail.gmail.com>,<20130207043257.GD2669@debian.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20130207043257.GD2669@debian.localdomain>
Content-Language: en-US
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
To: horseriver <horserivers@gmail.com>, Hendrik Visage <hvjunk@gmail.com>
Cc: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>



________________________________________
From: linux-assembly-owner@vger.kernel.org [linux-assembly-owner@vger.kernel.org] on behalf of horseriver [horserivers@gmail.com]
Sent: Wednesday, February 06, 2013 8:32 PM
To: Hendrik Visage
Cc: linux-assembly@vger.kernel.org
Subject: Re: mov instruction

On Thu, Feb 07, 2013 at 03:57:37PM +0200, Hendrik Visage wrote:
> On Thu, Feb 7, 2013 at 5:57 AM, horseriver <horserivers@gmail.com> wrote:
> > hi:)
> >
> >   Is here a suitable place to post topics about hardware technology?
> >
> >   I am curious about how mov work.
> >   Why it can not move data from a mem adress to another adress  in one instruction.
> >   in this form : mov (eax), (ebx)
>
> That is what the (rep) movs(b/w) etc. operation(s) are designed for
> these "string copy" operations. the old 8086 had those running between
> es:di and ds:si as the registers for this.
  Yeah! I remember that.
  But why this can not work : mov (eax), (ebx)  ?  just curious .

Because the x86 architecture will not allow you to move (or do arithmetic) from memory to memory. You can only move to/from a register from/to memory. For example,

mov (eax), ecx
mov ecx, (ebx)

(assuming AT&T syntax)

--Bob