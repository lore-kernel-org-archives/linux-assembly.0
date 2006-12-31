From: "Hendrik Visage" <hvjunk@gmail.com>
Subject: Re: suffix or operands invalid for
Date: Sun, 31 Dec 2006 20:06:20 +0200
Message-ID: <d93f04c70612311006v39057c8x200d73078a3a9f7e@mail.gmail.com>
References: <d5418ffc0612211839n531644f2x11f8afc4f293f1dd@mail.gmail.com>
	 <458BD4BB.1050502@verizon.net>
	 <d5418ffc0612220618ra72b5dfpcca0312c356b45ce@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <d5418ffc0612220618ra72b5dfpcca0312c356b45ce@mail.gmail.com>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kenton Brede <kbrede@gmail.com>
Cc: linux-assembly@vger.kernel.org

On 12/22/06, Kenton Brede <kbrede@gmail.com> wrote:
> Thanks to both of you for your replies.  You've helped me identify the
> problem.  I'm trying to assemble the code on an x86_64 system.  I
> tried the code using two identical versions of as, except one was 64
> bit and the other 32.  The assembly code assembled fine on the 32 bit.
>
> So I don't know if the code simply doesn't work with the 64 bit CPU or
> the language of the program doesn't work with the 64 bit assembler.

The longmode/64bit mode of the AMD64s doesn't do pushing of
32bits only 8 and 64bits AFAIR. I'll have to investigate myself why/what
the technical reasoning behind that is/was but it's currently for me
JustOneOfThoseThingsInLife(TM) ;^)

-- 
Hendrik Visage
