From: Fekete Gabor <feketga@delfin.unideb.hu>
Subject: Re: DOS assembly questions?
Date: Tue, 21 Oct 2003 08:05:43 +0200 (DFT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.A41.4.20.0310210801560.60518-100000@delfin.unideb.hu>
References: <3F9473D9.8010304@valdosta.edu>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3F9473D9.8010304@valdosta.edu>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 
Cc: linux-assembly@vger.kernel.org



On Mon, 20 Oct 2003, michael young wrote:

> Hi,
>    First, is it OK to ask questions about assembly programming in DOS on 
> this list?
> If so, here is my problem.
> I am a real newb at assembly and am still learning the very basics.
> I have this bit of code. The way I understand it, this should print out 
> "10".
> It does not. It prints some strange ASCII chars.
> 
> mov cx, 10
> mov dx, cx
> mov ah, 9
> int 21

ds:dx should be a pointer to a string "10$" for this to work.
is this what you're doing? because your code does not show.
you can find DOS calls here:
www.htl-steyr.ac.at/~morg/pcinfo/hardware/interrupts/inte1at0.htm




