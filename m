From: "A D" <a_d_249@hotmail.com>
Subject: Re: Segment override and lldt instruction
Date: Sun, 10 Jun 2007 20:33:03 -0400
Message-ID: <BAY133-F2621988146A83572C34FFBF51A0@phx.gbl>
References: <d93f04c70706041652k3be549bs8140489a8abbe0b6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <d93f04c70706041652k3be549bs8140489a8abbe0b6@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hvjunk@gmail.com, fbkotler@verizon.net
Cc: linux-assembly@vger.kernel.org

>>Frank Kotler wrote:
>>In "Linux assembly", there is no reason you'd *want* to use a segment
>>override, or alter a segment register.
>
>Hendrik Visage wrote:
>Not while your program and/or data space  fits in 4GB of memory space ;)

So please correct my understanding if i'm wrong: it is not possible
or necessary to override segment register in protected mode but one can do
the same thing in real mode. right? So if answer is yes, and if more than 
4GB
of memory space is needed for a program how will segmentation register go
beyond 4gig without override?

_________________________________________________________________
Windows Live Hotmail. Even hotter than before. Get a better look now. 
www.newhotmail.ca?icid=WLHMENCA148

