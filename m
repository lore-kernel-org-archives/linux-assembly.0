From: Ribamar Santarosa de Sousa <ribamar.sousa@ic.unicamp.br>
Subject: Re: ring0 access
Date: Fri, 10 Oct 2003 17:06:57 -0300
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20031010200657.GB2642@ic.unicamp.br>
References: <Law9-F94Tyj6iZkxUWZ0001a9fb@hotmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Law9-F94Tyj6iZkxUWZ0001a9fb@hotmail.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux assembly list <linux-assembly@vger.kernel.org>

On Thu, Oct 09, 2003 at 12:05:28PM +0000, Jason Roberts wrote:
> I have a desire: switch cpu context to real mode from pm
> I have written really cool music that works through BIOS--
> unfortunately, the only way I can get it to work is through
> a bootsector,i.e.hook code before OS boots--
> is there any way at all possible to use interrupts, set up my own
> handlers, or do any real direct hardware access through
> 32-bit mode,i.e. while in running KDE or Gnome???
> Appreciate any advice...what would really be nice is
> a cool set of functions like : enter_ring0() ... back_to_pm()
> Thankyou,
> Paul
> 
Paul,

    Have you got any answers to this question?... I am very curious too,
but i really believe that is not possible; pm would be few meaningless if
that was....

Ribamar.

