From: Noprianto <opennopri@yahoo.com>
Subject: Re: chdir on linux does not work
Date: Wed, 24 May 2006 20:20:53 -0700 (PDT)
Message-ID: <20060525032053.10655.qmail@web50514.mail.yahoo.com>
References: <200605241406.14417.jko@bsn1.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200605241406.14417.jko@bsn1.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jeff <jko@bsn1.net>
Cc: linux-assembly@vger.kernel.org

Hi Jeff,

> If you  run this program in a terminal  it will do
> the chdir,
> then restore the original directory when the program
> exits.  Possibly this is what you are seeing?
> 
Yes, thats what i am seeing. 



> >
> > -> from what i read, chdir is system call number
> 12
> >
> >
> > section .text
> >         global _start
> >
> > _start:
> >         mov eax, 12
> >         mov ebx, dir
> >         int 80h
> >
> >
> >         mov eax, 1
> >         mov ebx, 0
> >         int 80h
> >
> >
> >
> > section .data
> > dir:    db      '/bin'
> >
> >
> >


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
