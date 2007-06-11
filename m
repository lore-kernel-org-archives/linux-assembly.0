From: Frank Kotler <fbkotler@verizon.net>
Subject: Re: Segment override and lldt instruction
Date: Sun, 10 Jun 2007 21:14:00 -0400
Message-ID: <466CA1D8.9090600@verizon.net>
References: <BAY133-F2621988146A83572C34FFBF51A0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <BAY133-F2621988146A83572C34FFBF51A0@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: A D <a_d_249@hotmail.com>
Cc: hvjunk@gmail.com, linux-assembly@vger.kernel.org

A D wrote:
>>> Frank Kotler wrote:
>>> In "Linux assembly", there is no reason you'd *want* to use a segment
>>> override, or alter a segment register.
>>
>>
>> Hendrik Visage wrote:
>> Not while your program and/or data space  fits in 4GB of memory space ;)
> 
> 
> So please correct my understanding if i'm wrong: it is not possible
> or necessary to override segment register in protected mode but one can do
> the same thing in real mode. right?

Right. (In Windows, you might want to do [fs:somevalue] - Windows uses 
fs for "thread local storage"(???) - a descriptor that does *not* have a 
base of 0, and limit is... 64k-1(???)... I think)

> So if answer is yes, and if more 
> than 4GB
> of memory space is needed for a program how will segmentation register go
> beyond 4gig without override?

Dunno. I'll leave that one to Hendrik. :)

Best,
Frank

