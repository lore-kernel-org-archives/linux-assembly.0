From: peter willy krause <wklux@yahoo.co.uk>
Subject: Re: newbie :adding larger value
Date: Thu, 27 Nov 2003 12:41:56 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200311271241.56060.wklux@yahoo.co.uk>
References: <20031127124723.6b3aeb07.vadiraj@mail.cyberneme.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20031127124723.6b3aeb07.vadiraj@mail.cyberneme.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vadiraj C S <vadiraj@mail.cyberneme.com>, linux-assembly@vger.kernel.org, linux-assembly@mlists.in-berlin.de

On Thursday 27 November 2003 07:17, Vadiraj C S wrote:
>   Hello Everyone..
>
>    I'm a newbie. Has any one worked on adding a large value in
> assembly. I mean a value which is larger than 32 bit. How is this
> mathematics taken care...

example from 'lib4th', adding two counted (by l.s. cell value) unlimited 
size integers (re http://www.lxhp.in-berlin.de/lhpf8.html ).

hp

--------------
counted integer representation:
	l.s.cell [ count ][ cell-1 ] ... [ celll-n ]
	  EDI--^  EAX [ .. memory             ]
	  tos --^    n     (n) cells           ^-- m.s. cell

'cell' is a 32-bit item in memory.
2-s complement representation for -ve values.

memory arrangement as w. the (lib4th) Forth data stack, pointed to by reg 
EDI, 'push' towards _higher_ addresses; 'top' item also in EAX.
'tos' for 'top of stack', strikt 'little endian' byte order storage.

addition: (nasm syntax):

nadd:
	call nnorm        ; assure equal cells' count
                               ; by signed extending the 'shorter' item
        mov ecx,eax     ; counter, n cells (count of 32bit items)
        neg eax            ; disp to 2nd oprd
        push ecx           ; save count
        push esi            ;      & reg
        lea esi,[edi+eax*4] ; m.s. cell 1st oprnd
        lea edi,[esi+eax*4-4] :    ... 2nd
        push esi            ; save ptr to result 'tos'
        or eax,eax         ; clr initial carry
.l:
        mov eax,[edi]	; 2nd
        adc eax,[esi]	; 1st
        mov [edi],eax	; sum
        lea edi,[edi+4]	; 'lea' and 'dec' 
        lea esi,[esi+4]     ;     preserve the carry flag
        dec ecx		; count cells size of int's
        jg .l
        pop edi            ; new 'tos' ptr
        pop esi            ; saved reg
        pop eax           ; count item of sum integer
        lea edi,[edi+4]   ; drop count item of 1st operand
        ret

above code requires items of equal size. the original 'nnorm' routine  is 
too complicated for an introductory example - it runs some other tests 
and modifies the int's for the shortest pair without loss of praecision.

-----------------
mail to 'hp': - lx  at lxhp : in-berlin : de -
-----------------

