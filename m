From: sandeep <sandeep@codito.com>
Subject: Re: GAS/GCC Assembler Code Modification
Date: Sat, 15 May 2004 15:45:05 +0530
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <40A5EDA9.8080805@codito.com>
References: <20040515112807.579e4d89@deepblack>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20040515112807.579e4d89@deepblack>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Martin <asmfreshmeat@gmx.de>
Cc: linux-assembly@vger.kernel.org

Martin wrote:
> popl %esi 
> the gas changes that to
> pop %esi 
> Ok I guess this is ok, because the ESI Register is 'only' 32 Bit. So movw (= mov) would be ok. 
> 
> Next example:
> 
> If I try to assemble
> movl $0xb,%eax 
> the gas changes that to
> mov $0xb,%eax
There is no optimisation happening here. it's only that gas is using only mov as 
mnemonic, irrespective of whether you write movw or movl. I suggest you have a 
look at the generated instruction bytecodes.

while on linux, the default it assumes is 32 bit mode. so, though your movw also 
it will show as mov, but the generated instruction bytecode will also be 
prefixed with a mode byte, compared to had same movw been used in 16 bit mode.

> How can I tell gas that I dont want him to optimize the code?
Do you mean anything other than above as 'optimize the code' ?

I don't know if I cleared some things for you or increased the mess.

--
sandeep
--------------------------------------------------------------------------
I predict that today will be remembered until tomorrow!
--------------------------------------------------------------------------

