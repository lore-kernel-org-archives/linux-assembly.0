From: Frank Kotler <fbkotler@verizon.net>
Subject: Re: Current break round up
Date: Wed, 01 Oct 2008 09:43:47 -0400
Message-ID: <48E37E93.3080101@verizon.net>
References: <1222802784.8421.10.camel@kirilla-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <1222802784.8421.10.camel@kirilla-desktop>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kircsi Tibor <tkircsi@gmail.com>
Cc: linux-assembly@vger.kernel.org

Kircsi Tibor wrote:
> Hi,
> 
> Sorry for my english. I started learn assembly again after 15 years.
> Now, I'm learning about memory management and sys_brk system call. I've
> created a really simple program, which try to extend the heap size. I've
> read, when sys_brk is called with the new break address(last usable
> address of the heap or data segment), it will be rounded up to the next
> nearest page, but it didn't. Am I misundestand somthing?

I've noticed this. Seems to be related to kernel version (2.4.33.3 
here). May be a "bug"? I think you can access memory up to the top of 
the page (what you/we would "expect" brk to return). I don't know what 
to make of it.

Best,
Frank

