From: dave young <young@farstone.com>
Subject: Re: Regarding Linker (ld) option
Date: Thu, 15 May 2003 15:49:42 +0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <b9vg7u$r0b$1@main.gmane.org>
References: <20030415135050.27156.qmail@web41101.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20030415135050.27156.qmail@web41101.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; 
To: linux-assembly@vger.kernel.org

Anticipating a Reply ??:
> Hi all ,
> 
>   Can anybody please let me know what is 
> the purpose of the "-u" or "-undefined"
> option for "ld" linker . 
> 
>    After reading the man page , I could 
> not understand how to use it .
> 
>    A small sample code demonstrating its
> use would be appreciated .
> 
>    Thanks in advance .
> 
> Regards !
> 
> ________________________________________________________________________
> Missed your favourite TV serial last night? Try the new, Yahoo! TV.
>        visit http://in.tv.yahoo.com
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
I guess it is used to force the symbol to be "EXTERN"


