From: "Stephen Pelc" <stephen@mpeforth.com>
Subject: Re: More about stacks
Date: Thu, 15 Sep 2005 15:19:28 +0100
Message-ID: <43299100.16210.5C22D29@localhost>
References: <432892CD.3090907@colannino.org>
Reply-To: Stephen Pelc <stephen@mpeforth.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <432892CD.3090907@colannino.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> The question I wanted to ask the list was that I know when you
> want to expand the stack to make room for more data (particularly
> when you're setting up local variables in C) you simply do a sub
> on %esp, but my question is, how do you know when you do this
> that you aren't violating data from some other process, or maybe
> even data belonging to other sections of your code, .data for
> example.

In the main you don't know. A solution we have used before is to 
define your own stack, defining read-only guard-bands on either 
side of it. If the guard bands are written to, an exception is 
triggered. One of our clients had this problem when using too 
many layers of callback functions and consumed over 1Mb of stack 
space!

Stephen


--
Stephen Pelc, stephen@mpeforth.com
MicroProcessor Engineering Ltd - More Real, Less Time
133 Hill Lane, Southampton SO15 5AF, England
tel: +44 23 80 631441, fax: +44 23 80 339691
web: http://www.mpeltd.demon.co.uk - free VFX Forth downloads
