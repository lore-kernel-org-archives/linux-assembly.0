From: hpr <phpr@snafu.de>
Subject: Re: system_read() question
Date: Tue, 4 Feb 2003 08:48:17 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200302040855.h148tgqs003077@hirsch.in-berlin.de>
References: <200302031700.40580.davidkedrosky@rogers.com> <200302031546.18672.jborden@sorenson.com>
Reply-To: lx@snafu.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200302031546.18672.jborden@sorenson.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jason Borden <jborden@sorenson.com>, dAvId KeDrOsKy <davidkedrosky@rogers.com>, linux-assembly@vger.kernel.org

Jason Borden am Montag, 3. Februar 2003 22:46:
> Supposing that you're using buffered input (default), it will add a line
> feed character (0x0A) to the end of the string.

	certainly not!

>
> Jason
>
> On Monday 03 February 2003 03:00 pm, dAvId KeDrOsKy wrote:
> > Say I do something like this:
> >
> >         mov     eax, 3          ;setup for system read()
> >         mov     ebx, 0          ;receive input from stdin (keyboard)
> > 	mov     ecx, foo_input     ;input will act as a storage place for data
> >         int     0x80			;syscall interrupt
> >
> > Does anything get added to the storage array (foo_input) after my input.
> > Like the null or CR character?
> >
> > Thanks,
> >
> > dave
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
  pse, reply to << lxhp -at- lxhp -dot- in-berlin -dot- de >>
