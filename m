From: Pea Jay <peajay@evobsyniva.com>
Subject: Re: math on variables
Date: Sun, 15 Dec 2002 16:20:37 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20021215162037.5a942d0e.peajay@evobsyniva.com>
References: <20021215122906.GB8507@sauerburger.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20021215122906.GB8507@sauerburger.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephan Sauerburger <stephan@sauerburger.org>
Cc: linux-assembly@vger.kernel.org


>      mov	[totalcoins],0	;This gives an error. I just want to
>      				;initialize them to 0 at beginning.

NASM needs to know what size this variable is.

mov dword [totalcoins], 0
mov [totalcoins], dword 0

Since you're doing two variables, you might want to use a register to
generate shorter code.

xor eax, eax
mov [totalcoins], eax
mov [totalvalue], eax

If you only run this function once, you can initalize them by putting
them in the .data section. 

>      add    [totalcoins],[nickels]	;error: invalid combination of
>      	    				;opcode and operands. Tried

You can only have one square-bracket thing per instruction, this is a
limitation of the way the instructions are encoded.  So you have to use
two instructions.

You may want to forget zeroing totalcoins above, and just do this at the
end:

mov eax, [quarters]
add eax, [dimes]
add eax, [nickels]
add eax, [pennies]
mov [totalcoins], eax

(and check for overflows on the adds if that is a posibility)

>      ;add value in centes to "totalvalue"
>      ;(nickels are worth 5 cents, so multiply by 5 first.)
>      mov    eax,[nickels]
>      mul    eax,5	 		;error: invalid combination of
>      mov  [nickels],eax			;opcode and operands.

Two things here.  First is that the operands eax and edx are implied. 
The second is that the 5 must be either a register or a memory variable.
So you should do one of these two:

mov eax, [nickels]
mov edx, 5
mul edx
mov [nickels], eax

...or, what I usually do with mul and div...

mov eax, [nickels]
mul [five]   ; and somewhere have:  five dd 5
mov [nickels], eax

...or, you could do this...

mov eax, 5
mul dword [nickels]
mov [nickels], eax

In all cases, eax and the specified memory or register are multiplied,
and the result is stored in edx:eax.  This is because a dword can hold
up to 4294967295, and that value multiplied by itself is
18446744065119617025 which requires a quadword to store.  Since you're
not using quadwords, you need to check either edx and make sure it is
zero, or before the multiplication make sure nickels is less than
858993459.  If nickels won't be that large, then you can forget about
it.

> I find it odd, but I have found no information on such operations on
> variables anywhere on the web or my books. Perhaps I'm just dense.

I wouldn't be surprised if the information wasn't there.  The hardest
thing about assembly language is finding information.  Once you get past
that point it's pretty easy.

If you like, you can email me your questions in the future.  I think
this list is meant for linux specific questions.

- peajay
