From: Jason Borden <jborden@sorenson.com>
Subject: Re: system_read() question
Date: Mon, 3 Feb 2003 15:46:18 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200302031546.18672.jborden@sorenson.com>
References: <200302031700.40580.davidkedrosky@rogers.com>
Reply-To: Jason Borden <jborden@sorenson.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200302031700.40580.davidkedrosky@rogers.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dAvId KeDrOsKy <davidkedrosky@rogers.com>, linux-assembly@vger.kernel.org

Supposing that you're using buffered input (default), it will add a line feed 
character (0x0A) to the end of the string.

Jason

On Monday 03 February 2003 03:00 pm, dAvId KeDrOsKy wrote:
> Say I do something like this:
>
>         mov     eax, 3          ;setup for system read()
>         mov     ebx, 0          ;receive input from stdin (keyboard)
> 	mov     ecx, foo_input     ;input will act as a storage place for data
>         int     0x80			;syscall interrupt
>
> Does anything get added to the storage array (foo_input) after my input.
> Like the null or CR character?
>
> Thanks,
>
> dave
