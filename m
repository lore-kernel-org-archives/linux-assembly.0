From: "Richard Cooper" <syloriza@xersedefixion.com>
Subject: Re: Segfault on ioperm
Date: Thu, 20 Jan 2005 09:58:25 -0500
Message-ID: <opskwo7nfo5khrlj@sucks.airplane.fire>
References: <4b0d6e0d0501200552126d8cbb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4b0d6e0d0501200552126d8cbb@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: linux-assembly@vger.kernel.org


> Hi,
>
> I had been here before, I can't figure out why the code isnt working.

>     mov eax,101
>     mov ebx,port
>     mov ecx,3
>     mov edx,port
>     int 80h

You really should check the return value here.  I imagine the call is failing.  In particular, you need to have root access, and I believe that edx should actually be 1.

If you're just hoping to control a device you've connected to your parallel port, you might try designing it so that it can work just from the output byte bits, on pins 2 through 9, if that's possible with what you are doing.  You'll have to connect pin 11 to 23 and 12 to 24 so that the busy and out of paper signals go away, otherwise the lp driver will block your process on writes thinking the printer is busy or out of paper.  Then whatever byte you write to the lp driver will stay on those pins until you write another.
