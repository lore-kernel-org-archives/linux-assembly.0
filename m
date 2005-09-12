From: James Colannino <james@colannino.org>
Subject: Re: Question about GCC and stack
Date: Mon, 12 Sep 2005 16:15:52 -0700
Message-ID: <43260C28.6020406@colannino.org>
References: <587AEB894BD33797BF0431A1@[10.0.0.1]> <17189.59931.532740.834365@eidolon.muppetlabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <17189.59931.532740.834365@eidolon.muppetlabs.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Brian Raiter wrote:

>>The subl instruction is pointless, I dont know why it's inserted. It
>>could be just generic stub code that gcc always inserts for
>>allocating stack variables, but as in this case you dont use any, it
>>allocates $0 bytes...I'm sure someone will correct me if there's a
>>good reason for it :)
>>    
>>
>
>I expect that the instructions obtained by the original poster were
>created by gcc without optimization. Run gcc with -O2 or so would
>probably yield a simpler set of instructions.
>  
>

It was without -O2, but when I used -O2, the code was pretty much the 
same.  The only difference was that instead of moving the value 0 into 
eax, xor eax, eax was used to mask out all the bits (equalling 0, and 
I'm assuming that's probably slightly more efficient than moving a value 
into a register.)  Also, instead of the leave instruction, the ebp and 
esp were manipulated manually, I guess because maybe the leave 
instruction, like the enter instruction, is slower?

James

-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/

"You can only find truth with logic if you have already found truth without it." --G. K. Chesterton

