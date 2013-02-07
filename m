From: horseriver <horserivers@gmail.com>
Subject: Re: mov instruction
Date: Thu, 7 Feb 2013 12:32:57 +0800
Message-ID: <20130207043257.GD2669@debian.localdomain>
References: <20130207035714.GC2669@debian.localdomain>
 <CADtGFv=CY+wFMRgzsrp3wcspMEhUYnCKSpQz6vfHJYhTUbVXBQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=MNSbQzOsw2L6fSeurN2NG6am/OI9m0MiHpEL4mGMClI=;
        b=nD4/NaXt0Ic6vI2Z09x/ywKyYv50LSF8TqxcKZaLjSOreQ5SyiJpEv177LXCf+w58F
         2oNoOPycO/U1ZsUwprbYbB5LzhOtX1WHeR/6BSclqMWmo+79XrDxNUAhXk7H4bMLx/pw
         +EHSkqsbCP6RNxoi81f4POLDQmURqXGsy+yN1D/JGBvE9fTcBGWouONtrJoBMj4/S4K2
         1nMPNHdWBJBpGgwS/uR0+tvQmsZVkerUht5D2UaicbpQfgK4DyDY+RU7tVkEPGcitvRN
         iFtFLYc7v3jdJZTlIx0v2DwGM9pbLUFwTDkcdpub1efrhdITfgCflbQGOBdX7lU9tZuN
         yoiw==
Content-Disposition: inline
In-Reply-To: <CADtGFv=CY+wFMRgzsrp3wcspMEhUYnCKSpQz6vfHJYhTUbVXBQ@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hendrik Visage <hvjunk@gmail.com>
Cc: linux-assembly@vger.kernel.org

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

thanks!
