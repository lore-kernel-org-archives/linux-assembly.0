From: sandeep <sandeep@codito.com>
Subject: Re: Access to Program Counter in C
Date: Fri, 19 Nov 2004 12:02:01 +0530
Message-ID: <419D9361.6070903@codito.com>
References: <20041116163821.61564.qmail@web51902.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041116163821.61564.qmail@web51902.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: A M <alim1993@yahoo.com>
Cc: linux-c-programming@vger.kernel.org, linux-assembly@vger.kernel.org


A M wrote:
 > Does anybody know how to access the address of the
 > current executing instruction in C while the program
 > is executing?
doing exactly as your words say, won't be possible (as
far as my limited experience with ix86 architecture goes),
but something nearabout can be achieved with little inline
assembly fragment.
you might find it useful/helpful to have a look at some of the early days virus 
codes. search on internet for sources for them.

 > Also, is there a method to load a program image from
 > memory not a file (an exec that works with a memory
 > address)? Mainly I am looking for a method that brings
 > a program image into memory modify parts of it and
 > start the in-memory modified version.
should be possible to have your version of exec (modified exec). file-image is 
also a sequence of bytes like any sequence of bytes in memory. normal exec would 
expect a particular layout/structural-organisation of the content in this 
sequence. what kind of layout/content you plan to have in your memory image 
would also decide how much different your version of exec would be.

 > Can anybody think of a method to replace a thread
 > image without replacing the whole process image?
will something on the lines of MS-DOS overlays work for you?

-- 
regards
sandeep
--------------------------------------------------------------------------
It is said that the lonely eagle flies to the mountain peaks while the
lowly ant crawls the ground, but cannot the soul of the ant soar as
high as the eagle?
--------------------------------------------------------------------------

