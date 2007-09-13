From: Lukas <blurrpp@yahoo.com>
Subject: Re: getting at raw command line
Date: Thu, 13 Sep 2007 10:32:41 -0700 (PDT)
Message-ID: <582003.52789.qm@web50304.mail.re2.yahoo.com>
References: <381529.26934.qm@web50302.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <381529.26934.qm@web50302.mail.re2.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

and again wrong ... (to fast:) ) ... %bl=42,%bh=0 :D
Lukas
--- Lukas <blurrpp@yahoo.com> wrote:

> of course in last line of "code" ;) should be
> %ebx=42
> 
> regards
> Lukas
> 
> --- Lukas <blurrpp@yahoo.com> wrote:
> 
> > As i said, when you start program 'p whatever '
> %esp
> > points place on stack where number of parameters
> was
> > put ex. 
> > $p 1 2 3 -> movl (%esp),%ecx => %ecx=3 )
> > 
> > next (%esp+4) adress of program name ex. 
> > 
> > $/home/usr/bin/p 1 2 3 -> (%esp+4) adres of string
> > "/home/usr/bin/p"
> > 
> > (%esp+8)(+16 if you have 64-bit arch) adress of
> text
> > string of first parameter, so if you write
> > 
> > $ p * -> movl (%esp+8),%ecx / movq (%rsp+16),%rcx
> >         movl (%ecx),%ebx / movq (%rcx),%rbx
> >        %ecx=42 ( '*' )
> > so now you can do with it whatever you want (
> write
> > using SYS_WRITE, printf etc )
> > Lukas
> > 
> > 
> > --- Jack Andrews <effbiae@gmail.com> wrote:
> > 
> > > the shell changes arguments like * to a number
> of
> > > arguments.  is there
> > > a way to get the *?  that is, if my program is
> p,
> > i
> > > want this
> > > behaviour:
> > > 
> > >  $ ls
> > >  file.1 file.2
> > >  $ ls *
> > >  file.1 file.2
> > >  $ p file.1
> > >  file.1
> > >  $ p *
> > >  *
> > > 
> > > i don't want
> > > 
> > >  $ p *
> > >  file.1 file.2
> > > -
> > > To unsubscribe from this list: send the line
> > > "unsubscribe linux-assembly" in
> > > the body of a message to
> majordomo@vger.kernel.org
> > > More majordomo info at 
> > > http://vger.kernel.org/majordomo-info.html
> > > 
> > 
> > 
> > 
> >        
> >
>
____________________________________________________________________________________
> > Pinpoint customers who are looking for what you
> > sell. 
> > http://searchmarketing.yahoo.com/
> > -
> > To unsubscribe from this list: send the line
> > "unsubscribe linux-assembly" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at 
> > http://vger.kernel.org/majordomo-info.html
> > 
> 
> 
> 
>        
>
____________________________________________________________________________________
> Need a vacation? Get great deals
> to amazing places on Yahoo! Travel.
> http://travel.yahoo.com/
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 



       
____________________________________________________________________________________
Need a vacation? Get great deals
to amazing places on Yahoo! Travel.
http://travel.yahoo.com/
