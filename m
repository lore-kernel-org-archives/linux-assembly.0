From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: prime numbers
Date: Wed, 13 Jul 2005 20:14:45 -0400
Message-ID: <42D5AE75.4030100@comcast.net>
References: <42D59858.8060404@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <42D59858.8060404@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Paul Irofti <bulibuta@gmail.com>
Cc: linux-assembly@vger.kernel.org

Paul Irofti wrote:

...
> sieve.o(.text+0x1):sieve.s:20: relocation truncated to fit: R_386_8 .data

...
>     movb $test, %dl

Pretty sure you want "movb test, %dl" - "$test" indicates that you're 
trying to move the *address* of your "test" variable (not the contents) 
into %dl... and it won't fit! (...etc.)

Best,
Frank

