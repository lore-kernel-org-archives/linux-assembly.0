From: sandeep <sandeep@codito.com>
Subject: Re: Access to Program Counter in C
Date: Fri, 19 Nov 2004 13:34:57 +0530
Message-ID: <419DA929.1050904@codito.com>
References: <90db62064205.419d30cd@usc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <90db62064205.419d30cd@usc.edu>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: siddharth vora <sjv@usc.edu>
Cc: A M <alim1993@yahoo.com>, linux-c-programming@vger.kernel.org, linux-assembly@vger.kernel.org

siddharth vora wrote:
> Here CALL instruction is 4 bytes instruction so call $+5 will call the
> 5th byte which is the next instruction. And based upon the "call"
> behavior, it pushes the next instruction on the stack first and then
> JUMP to the instruction. So, in this case, on the stack you will have
> the exact instruction which you are executing !
am i right in taking it as, you meant to say - execution of call instruction 
pushes the return address, which is the address of instruction following call 
instruction. in the example you mentioned it would be the address of instruction 
"pop ebp". since you are jumping to this instuction (via call), at the end of 
it's execution ebp will have the address of "pop ebp" instruction.

-- 
regards
sandeep
--------------------------------------------------------------------------
It is said that the lonely eagle flies to the mountain peaks while the
lowly ant crawls the ground, but cannot the soul of the ant soar as
high as the eagle?
--------------------------------------------------------------------------

