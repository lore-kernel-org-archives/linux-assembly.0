From: siddharth vora <sjv@usc.edu>
Subject: Re: Access to Program Counter in C
Date: Thu, 18 Nov 2004 23:58:40 -0800
Message-ID: <9230369867a2.419d3730@usc.edu>
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

Yep, 
 
 This z standard technique for the viruse encryption. 

Sid.
----- Original Message -----
From: sandeep <sandeep@codito.com>
Date: Friday, November 19, 2004 0:04 am
Subject: Re: Access to Program Counter in C

> siddharth vora wrote:
> > Here CALL instruction is 4 bytes instruction so call $+5 will 
> call the
> > 5th byte which is the next instruction. And based upon the "call"
> > behavior, it pushes the next instruction on the stack first and then
> > JUMP to the instruction. So, in this case, on the stack you will 
> have> the exact instruction which you are executing !
> am i right in taking it as, you meant to say - execution of call 
> instruction 
> pushes the return address, which is the address of instruction 
> following call 
> instruction. in the example you mentioned it would be the address 
> of instruction 
> "pop ebp". since you are jumping to this instuction (via call), at 
> the end of 
> it's execution ebp will have the address of "pop ebp" instruction.
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

