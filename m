From: "Robert G. Plantz" <plantz@SONOMA.EDU>
Subject: Re: I need little help..
Date: Thu, 25 Mar 2004 16:54:01 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <125C6C7C-7EC0-11D8-996E-0030657C1952@sonoma.edu>
References: <S263818AbUCZAAL/20040326000042Z+961@vger.kernel.org>
 <16483.30725.499924.145613@eidolon.muppetlabs.com>
Mime-Version: 1.0 (Apple Message framework v613)
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <16483.30725.499924.145613@eidolon.muppetlabs.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Assembly Linux <linux-assembly@vger.kernel.org>

Uh, I think the poster asked for "in gas style."

Assuming that number and buffer are in the .data segment:

         .data
number: .int    123
buffer: .space  50

and the existence of itoa as described by Brian Raiter, I got:
         movl    number, %eax
         movl    $buffer, %edi
         call    itoa

         movl    %eax, %edx
         movl    $buffer, %ecx
         movl    $1, %ebx
         movl    $4, %eax
         int     $0x80
to do the job.

Bob

On Mar 25, 2004, at 4:23 PM, Brian Raiter wrote:

>> Hi again.. I wanted to ask you how to write (in gas style) program
>> which gets the user id (using syscall 24) and then printing it to
>> the screen (NOT using the printf function , but using syscall 4)...
>
> If you refuse to use printf, then you'll need to translate the number
> into the ASCII decimal representation yourself. (I assume that if you
> can't use printf(), then sprintf() is also off-limits.)
>
> Once you've done that, you can just output the string directly.
>
> 	; itoa:
> 	; When called, the number to transform is in eax, and a
> 	; pointer to the buffer to receive the string is in edi.
> 	; Upon return, itoa leaves the length of the string in eax.
>
> 	mov	eax, number
> 	mov	edi, buffer
> 	call	itoa
>
> 	; now display the string using the write syscall.
>
> 	mov	edx, eax
> 	mov	ecx, buffer
> 	mov	ebx, FILENO_STDOUT
> 	mov	eax, 4
> 	int	0x80
>
> If you don't want to use sprintf(), then you should really try to
> write itoa yourself. It's a classic job-interview question, and one
> that every hacker ought to try to write themselves.
>
> b
> -
> To unsubscribe from this list: send the line "unsubscribe  
> linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
------------------------------------------------------------------------ 
---------------
practice (v): To do or perform repeatedly in order to acquire skill.
------------------------------------------------------------------------ 
---------------
Robert G. Plantz, PhD		| http://www.cs.sonoma.edu/~bob
Sonoma State University		| ph: (707) 664-2806
CS Department			| fax: (707) 664-3012
1801 E. Cotati Avenue		| email: plantz@sonoma.edu
Rohnert Park, CA 94928

