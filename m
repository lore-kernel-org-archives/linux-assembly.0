From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: confused asm newbie
Date: Mon, 17 Nov 2003 14:36:44 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FB8CEEC.7030609@eprocess.fr>
References: <20031117131810.80951.qmail@web41305.mail.yahoo.com>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20031117131810.80951.qmail@web41305.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: b klein <b_klein1@yahoo.com>
Cc: linux-assembly@vger.kernel.org

I don't really see what you want...
If it is for:
- asking some question about assembly
- assembly with linux
- or even low level linux
it is the good place, but please, ask more precise question.

If you want just to discuss about: "what is assembly, what for, and what 
god has to do with this", i'm afraid you'll don't have much answers... ;)

And please, remember that:
There are 10 types of people: those who understand binary language, and 
the others.
;-)

Fred

b klein wrote:

>--- Frederic Marmond <fmarmond@eprocess.fr> wrote:
>  
>
>>b klein wrote:
>>
>>    
>>
>>>im trying to learn asm and use nasm, ald and a
>>>      
>>>
>>little
>>    
>>
>>>gdb for it. im not a newbie to programming or
>>>assembly. ive learned it some time ago and come
>>>      
>>>
>>back
>>    
>>
>>>to it now. so my question is what is the important
>>>bits that are worth learning? Im not interested in
>>>learning a tool, i want to learn the .. well
>>>'language'
>>>but if it isnt a language, what should it be?
>>>addressing modes, big-little endian, memory models,
>>>8-16-32-64 (12?) bits processors, ports, interupts
>>>      
>>>
>>or
>>    
>>
>>>something else?
>>>
>>> 
>>>
>>>      
>>>
>>Hum...
>>1: find something to do!
>>Take something you would like to do (an assembly
>>routine that write a 
>>text to the screen very quickly, a boot loader (not
>>so hard to do!), a 
>>ACPI state reader, or what else you want)
>>
>>2: get a compilator (cc is one)
>>
>>3: try to do it.
>>
>>I Think it is the only good way to learn assembly.
>>By this method, 
>>you'll see how to use a tool (the compilator, but it
>>will not be the 
>>main goal, you can choose the one you want), learn
>>how to get doc (about 
>>the OS you are on, about BIOS if you have no OS,
>>about the chips if you 
>>don't want to use BIOS, ...) and how all that work.
>>Once you have enough knowledge about one particular
>>architecture, you 
>>can safety try an other!
>>
>>Fred
>>
>>    
>>
>thanks for your reply.
>Im doing something like that:
>started with trying to do a FFT butterfly using the
>fpu unit. i use the fpu because i want to learn how to
>use it,the school's asm did not include that bit.
>so far i got to:
>flotingpoint variables A,B
>A=A+B
>B=A-B
>now its just some cos and sin with the fpu.
>thats cool.
>
>The problem is how its connected to the essence of
>assembly and what this essence is, because i did the
>same with c++ (dont know how it goes with the
>registers though).
>using asm i learnd about the scratch regs,fpu and some
>memory mgmnt. and i think that is the important bit
>concerning asm. i allso learned a bit about nasm
>commands and how to use ald (gdb is a headache). But
>is is as important as the fpu and regs? 
>assembly is good for some things, OS, hardware
>programming, dsp, etc. i think it isnt practical to
>write a databese in assembly only(possible yes). so
>whats worth concetrating on ?
>thanks
>benny   
>
>
>
>
>__________________________________
>Do you Yahoo!?
>Protect your identity with Yahoo! Mail AddressGuard
>http://antispam.yahoo.com/whatsnewfree
>-
>To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>


