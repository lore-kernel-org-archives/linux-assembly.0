From: jeff <jko@bsn1.net>
Subject: Re: chdir on linux does not work
Date: Wed, 24 May 2006 14:06:14 +0000
Message-ID: <200605241406.14417.jko@bsn1.net>
References: <20060524024929.99396.qmail@web50504.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20060524024929.99396.qmail@web50504.mail.yahoo.com>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Noprianto <opennopri@yahoo.com>
Cc: linux-assembly@vger.kernel.org

On Wednesday 24 May 2006 02:49 am, Noprianto wrote:
> Dear All,
>
> Anyone can tell me why this chdir code does not work on
> linux ?

If you  run this program in a terminal  it will do the chdir,
then restore the original directory when the program
exits.  Possibly this is what you are seeing?

>
> -> from what i read, chdir is system call number 12
>
>
> section .text
>         global _start
>
> _start:
>         mov eax, 12
>         mov ebx, dir
>         int 80h
>
>
>         mov eax, 1
>         mov ebx, 0
>         int 80h
>
>
>
> section .data
> dir:    db      '/bin'
>
>
>
> Thanks,
> Pri
>
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around
> http://mail.yahoo.com
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
