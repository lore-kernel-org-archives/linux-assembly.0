From: Scott Lanning <slanning@theworld.com>
Subject: Re: looping_code
Date: Sat, 31 Aug 2002 13:36:50 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.SGI.4.40.0208311331380.81531310-100000@shell01.TheWorld.com>
References: <189BA622-BCF3-11D6-B94A-003065A88832@sonoma.edu>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <189BA622-BCF3-11D6-B94A-003065A88832@sonoma.edu>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Plantz <plantz@sonoma.edu>
Cc: linux-assembly@vger.kernel.org

On Sat, 31 Aug 2002, Robert Plantz wrote:
> On Friday, August 30, 2002, at 11:17  PM, Scott Lanning wrote:
> > On Mon, 26 Aug 2002, ssams wrote:
> >>   mov $msg,%ecx
> >
> > This moves the value at 'msg'
> > rather than a pointer to 'msg'.
>
> Sorry, but the gas assembler *will* treat the address
> as an immediate. Proof:

Right, sorry. ssams, ignore that part.
Fix the %ecx loop count.

