From: michael young <mhyoung@valdosta.edu>
Subject: Re: DOS assembly questions?
Date: Tue, 28 Oct 2003 17:19:20 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F9EEB68.9040309@valdosta.edu>
References: <3F9473D9.8010304@valdosta.edu> <3F957562.7060302@valdosta.edu> <3F961EB4.BE9DB472@yahoo.co.uk> <3F980930.6080207@valdosta.edu> <3F995D8C.5BF018AE@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3F995D8C.5BF018AE@yahoo.co.uk>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: willy meier <wklux@yahoo.co.uk>
Cc: linux-assembly@vger.kernel.org, linux-assembly@mlists.in-berlin.de

Hi willy,
    I think, with help from you and everyone else
on this list, I'm understanding where I'm going
wrong. Many thanks for your help.

Michael



willy meier wrote:

>michael young wrote:
>  
>
>>Hi willy,
>>thank you for your response.
>>a question below.
>>
>>willy meier wrote:
>>
>>    
>>
>>>michael young wrote:
>>>
>>>apparently, a common 'problem':
>>>if ah:=9 and int 21 is supposed to send text,
>>>the binary counter data can't appear visibly.
>>>
>>>
>>>      [...]
>>>
>>>
>>>      
>>>
>>>>START:
>>>>
>>>>
>>>>        
>>>>
>>>  mov cx, 10  =>      mov cx,"9"
>>>
>>>
>>>      
>>>
>>>> call myloop
>>>>
>>>>myloop:
>>>> mov dx, cx
>>>> mov ah, 9
>>>> int 21H
>>>> dec cx
>>>>
>>>>
>>>>        
>>>>
>>>                      cmp cx,"0"
>>>  jnz myloop  =>      jc myloop	(<----- false, use 'jnc')
>>>
>>>      
>>>
>>Here, wouldn't the 'dec' instruction set the 'ZF' if cx hit 0?
>>    
>>
>
>right but, binary value 0 would (if the rsp. terminal permits) just be
>the control code of <nul>. apparently (I know nothing about pc-dos
>specifica), the int-routine requires a character code in <dx> thus you
>either count and compare by chars codes or, add the byte value
>48(decimal) to the counter value to sending the rsp char.
>much simplified, useable only for single digits (characters).
>
>  
>
>>where am I going wrong on this?
>>    
>>
>
>correction: the added opr should read 'jnc myloop'.
>loop terminates after cx was counted down to code("0")-1
>(assuming that int 21 won't modify cx value)
>
>did you forget the <ret> code after <call myloop>?
>if no other code follows after <call myloop> you could either, use <jmp>
>or, delete the call instr, otherwise, in your example, 'myloop' would be
>run once more, before termination.
>
>  
>
>>>      
>>>
>>>> mov dx, donemsg
>>>>
>>>>
>>>>        
>>>>
>>>      [...]
>>>      
>>>
>
>best,
>       hp
>
>  
>

