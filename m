From: Jason Borden <jborden@sorenson.com>
Subject: Re: system_read() question
Date: Tue, 4 Feb 2003 14:51:46 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200302041451.46318.jborden@sorenson.com>
References: <200302031700.40580.davidkedrosky@rogers.com> <200302041009.03943.jborden@sorenson.com> <15936.12933.87578.194451@eidolon.muppetlabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <15936.12933.87578.194451@eidolon.muppetlabs.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Brian Raiter <breadbox@muppetlabs.com>, linux-assembly@vger.kernel.org

On Tuesday 04 February 2003 02:37 pm, Brian Raiter wrote:
> > I can't tell if you're agreeing with me or not, but here's proof of
> > concept in nasm format:
>
> Yes, and when I try out your program:
>
> $ echo -n foo | ./a.out
> 66 6F 6F
>
> ... we see that there is no line feed added.
>
> The reality is not that line feeds are *added*. The reality is that
> line feeds are not *removed*. In exactly the same way that spaces,
> periods, and instances of the letter Q are not removed.
>
> b

OK, forgive me for even trying to help your sorry butt
