From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: TT6: High-quality custom logos and business identities
Date: Sat, 02 Jul 2005 01:28:27 -0400
Message-ID: <42C625FB.20303@comcast.net>
References: <200506292204.j5TM4mLj024638@zeus2.kernel.org> <opss5nv9y85khrlj@sucks.airplane.fire> <42C34737.5070208@colannino.org> <20050701223155.GB3256@absinth.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20050701223155.GB3256@absinth.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux assembly <linux-assembly@vger.kernel.org>

Steffen Solyga wrote:
> Citing James Colannino (Wednesday, 2005/06/29 18:13)...
>>Richard Cooper wrote:
>>>Does anyone still read this list?
>>
>>I'm on the list :)
> 
> So we're at least four :-p

I'm awake! ... but I don't usually read the ones about high quality 
business logos :)

Anyone noticed anything strange about the newer 2.6 kernels? Gcc, even 
Gas users wouldn't notice it, but some of the very "simple" programs we 
can make with Nasm or Fasm (including the "elfexe" example with Fasm) - 
segfault on new kernels! In the loader, they never even get to run! The 
trick seems to be that you *must* have a writeable section last...

Best,
Frank

