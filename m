From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: system_read() question
Date: Tue, 4 Feb 2003 13:37:09 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <15936.12933.87578.194451@eidolon.muppetlabs.com>
References: <200302031700.40580.davidkedrosky@rogers.com>
	<200302031546.18672.jborden@sorenson.com>
	<200302040855.h148tgqs003077@hirsch.in-berlin.de>
	<200302041009.03943.jborden@sorenson.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200302041009.03943.jborden@sorenson.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> On Tuesday 04 February 2003 01:48 am, hpr wrote:
>> Jason Borden am Montag, 3. Februar 2003 22:46:
>>> Supposing that you're using buffered input (default), it will add
>>> a line feed character (0x0A) to the end of the string.
>>
>> 	certainly not!
>>
>>> Jason
> 
> I can't tell if you're agreeing with me or not, but here's proof of
> concept in nasm format:

Yes, and when I try out your program:

$ echo -n foo | ./a.out
66 6F 6F

... we see that there is no line feed added.

The reality is not that line feeds are *added*. The reality is that
line feeds are not *removed*. In exactly the same way that spaces,
periods, and instances of the letter Q are not removed.

b
