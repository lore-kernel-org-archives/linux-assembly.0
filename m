From: michael young <mhyoung@valdosta.edu>
Subject: Re: DOS assembly questions?
Date: Thu, 23 Oct 2003 13:00:32 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F980930.6080207@valdosta.edu>
References: <3F9473D9.8010304@valdosta.edu> <3F957562.7060302@valdosta.edu> <3F961EB4.BE9DB472@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3F961EB4.BE9DB472@yahoo.co.uk>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-assembly@vger.kernel.org


Hi willy,
thank you for your response.
a question below.


willy meier wrote:

>michael young wrote:
>
>apparently, a common 'problem':
>if ah:=9 and int 21 is supposed to send text, 
>the binary counter data can't appear visibly.
>  
>
>	[...]
>  
>
>>START:
>>    
>>
>   mov cx, 10	=>	mov cx,"9"
>  
>
>>  call myloop
>>
>>myloop:
>>  mov dx, cx
>>  mov ah, 9
>>  int 21H
>>  dec cx
>>    
>>
>			cmp cx,"0"
>   jnz myloop	=>	jc myloop
>
Here, wouldn't the 'dec' instruction set the 'ZF' if cx hit 0?
where am I going wrong on this?

>  
>
>>  mov dx, donemsg
>>    
>>
>	[...]
>
>best,
>	hp
>  
>
michael


