From: siddharth vora <sjv@usc.edu>
Subject: Re: Access to Program Counter in C
Date: Thu, 18 Nov 2004 23:31:25 -0800
Message-ID: <90db62064205.419d30cd@usc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-language: en
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sandeep <sandeep@codito.com>
Cc: A M <alim1993@yahoo.com>, linux-c-programming@vger.kernel.org, linux-assembly@vger.kernel.org


Try :

 Call ($+5)
  pop ebp

 you will get the current instruction which u r executing in ebp !!  This is how viruses works, they decrypt it in the memory and starts executing from the memory afterwardz..

  Here CALL instruction is 4 bytes instruction so call $+5 will call the 5th byte which is the next instruction. And based upon the "call" behavior, it pushes the next instruction on the stack first and then JUMP to the instruction. So, in this case, on the stack you will have the exact instruction which you are executing !

Enjoy,
Siddharth.

----- Original Message -----
From: sandeep <sandeep@codito.com>
Date: Thursday, November 18, 2004 10:32 pm
Subject: Re: Access to Program Counter in C

> 
> A M wrote:
> > Does anybody know how to access the address of the
> > current executing instruction in C while the program
> > is executing?
> doing exactly as your words say, won't be possible (as
> far as my limited experience with ix86 architecture goes),
> but something nearabout can be achieved with little inline
> assembly fragment.
> you might find it useful/helpful to have a look at some of the 
> early days virus 
> codes. search on internet for sources for them.
> 
> > Also, is there a method to load a program image from
> > memory not a file (an exec that works with a memory
> > address)? Mainly I am looking for a method that brings
> > a program image into memory modify parts of it and
> > start the in-memory modified version.
> should be possible to have your version of exec (modified exec). 
> file-image is 
> also a sequence of bytes like any sequence of bytes in memory. 
> normal exec would 
> expect a particular layout/structural-organisation of the content 
> in this 
> sequence. what kind of layout/content you plan to have in your 
> memory image 
> would also decide how much different your version of exec would be.
> 
> > Can anybody think of a method to replace a thread
> > image without replacing the whole process image?
> will something on the lines of MS-DOS overlays work for you?
> 
> -- 
> regards
> sandeep
> --------------------------------------------------------------------
> ------
> It is said that the lonely eagle flies to the mountain peaks while the
> lowly ant crawls the ground, but cannot the soul of the ant soar as
> high as the eagle?
> --------------------------------------------------------------------
> ------
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-
> programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

