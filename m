From: Konstantin Boldyshev <konst@linuxassembly.org>
Subject: Re: Newbie at asmutils
Date: Mon, 27 Feb 2006 19:05:47 +0300
Message-ID: <4403235B.7090308@linuxassembly.org>
References: <200602262006.14200.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200602262006.14200.hitoc_mail@yahoo.it>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

HIToC ?????:

>Hello list!
>I have downloaded 0.18, and I was very impressed about it...
>My simply question is: how to compile a piece of code written using
>the layout of asmutils with nasm?
>  
>
Nothing special - you only need include files (inc/)
and few defines for them (actually "OS=..." is enough).

However there's an easy way - just add this program to src/Makefile.

--
Regards,
Konstantin.


