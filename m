From: Paul Irofti <bulibuta@gmail.com>
Subject: Re: 'defines.h' file not found
Date: Wed, 22 Jun 2005 01:54:22 +0000
Message-ID: <42B8C4CE.5070903@gmail.com>
References: <42B8AB1B.5030408@gmail.com> <42B8AC47.8010804@gmail.com> <d03fdece5c2376836cd3ab3fed1b85ac@sonoma.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <d03fdece5c2376836cd3ab3fed1b85ac@sonoma.edu>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Robert G.Plantz" <plantz@sonoma.edu>
Cc: linux-assembly@vger.kernel.org

Robert G.Plantz wrote:

> On Jun 21, 2005, at 5:09 PM, Paul Irofti wrote:
>
>> Paul Irofti wrote:
>
>
> The AT&T equivalent of this file:
>
>>> ;output control
>>> %define NL 10
>>> %define STDIN 0
>>> %define STDOUT 1
>>> ...
>>> ;syscalls
>>> %define SYS_EXIT 1
>>> %define SYS_READ 3
>>> %define SYS_WRITE 4
>>> %define SYS_IOCTL 54
>>>
> is:
>
> # output control
> NL = 10
> STDIN = 0
> STDOUT = 1
> ...
> # syscalls
> SYS_EXIT = 1
> SYS_READ = 3
> SYS_WRITE = 4
> SYS_IOCTL = 54
>
>
i knew that, it only came in handly in a copy-paste kindda way. thanks.

>>> and a sample code that can be found at www.linuxassembly.org is:
>>>
>>> .include "defines.h"
>>> .data
>>> hello:
>>>     .string "hello world\n"
>>>
>
> Also, you'll have a problem here unless you use the
>        .text
> directive so the following code goes into the text segment.
>
>>> .globl    main
>>> main:
>>>     movl    $SYS_write,%eax
>>>     movl    $STDOUT,%ebx
>>>     movl    $hello,%ecx
>>>     movl    $12,%edx
>>>     int    $0x80
>>
>
> Your shell will be happier if you return zero:
>        movl   $0, $eax
>
>>>     ret
>>>
>>>
>>> that's about it, i need this for an easier code writting. i can use 
>>> interrupts and numbers but a 'defines.h' would be nicer.
>>> thanks.
>>>
>
> I use the assembler to assemble this
>      as --gstabs helloWorld.s -o helloWorld.o
>
> and then gcc to link/load it
>      gcc helloworld.o -o helloworld
>

thanks for the info, it seems simpler this way for i used a gcc-ld-wc 
session for making the executable.

> If you just use ld, you need to explicitly specify the system 
> libraries. But gcc recognizes that helloworld.o is an object file and 
> goes directly to the ld phase and automatically links all the 
> necessary libraries.
>
> You can do something like
>    gcc helloworld.o -o helloworld -Wl,-M
> to see the libraries.
>
> --Bob
>
> -----------------------------------------------------
> Mac on Intel:
> Gotta stick to your principles -- until they get in your way.
>
>     Bob Plantz
>     plantz@mac.com
>
>
the sample helloWorld code was meant to see one of the code snipets 
where i found the defines.h included.

it's not a bigdeal, i wanted the general defines.h file because i think 
it contains alot of goodies that i'd like to take a look at, and use in 
future apps.

thanks again Bob!
