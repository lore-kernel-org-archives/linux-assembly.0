From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: newbie
Date: Fri, 23 Dec 2005 04:56:48 -0500
Message-ID: <43ABC9E0.3010409@comcast.net>
References: <20051223165014.3a1db406.amerei@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20051223165014.3a1db406.amerei@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Niel A <amerei@gmail.com>
Cc: linux-assembly@vger.kernel.org

Niel A wrote:
> hello all!
> 
> i'm taking linux assembly as a hobby for christmas

... and for New Year you're doing micro-code? :)

> and i found your great site. the tutorials have been much helpful.
> 
> anyway, i meant to ask something.. 
> 
> section .data
> 	string: db "hi!",10
> 
> and i wanna capitalize the small letter 'h'.
> 
> at first i used
> 	mov di, string ; but di is 16 bits and ld complains

Right. As Fred explains, an address is 32 bits (or 64).

> so i eventually started using the 32 bit ones to do the capitalisation operation. but for some reason, i lose all other letters, including the linefeed.

Sounds like maybe you went too far. The address is 32 bits (or 64), but 
the characters of the string are only a byte (8 bits). If you tried to 
"uppercase" a whole 32 bits, you'd lose the whole thing, including the 
linefeed.

> please point me to the right direction.

Easy way:

sub byte [string], 32

maybe you'd write it as:

sub byte [string], 'a' - 'A'

to make it more "self-documenting". But a more flexible way, using some 
registers...

mov edi, string
mov al, [edi]
cmp al, 'a'  ; don't "uppercase" it unless
jb skip      ; it's lower case!
cmp al, 'z'
ja skip
sub al, 'a' - 'A'
mov [edi], al  ; store it back in "string"
skip:

...perhaps "inc edi", and loop back do do the next letter, or whatever...

inc edi
mov byte [edi], 'a'  ; change it to "Ha!"

Have fun.

> merry christmas,

Same to you and yours... and the rest of the list.

Best,
Frank

