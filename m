From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: Problems with OpenGL asm program.
Date: Fri, 12 Aug 2005 15:31:12 -0400
Message-ID: <42FCF900.7000609@comcast.net>
References: <9b9a53ad050812100027b53687@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <9b9a53ad050812100027b53687@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lauri Pihlajakangas <lpihlajak@gmail.com>
Cc: linux-assembly@vger.kernel.org

Lauri Pihlajakangas wrote:

...
>     fild dword [esp+20] ;width
>     fild dword [esp+24] ;height
>     sub esp,8
>     fdiv st1, st0
>     fstp qword [esp] ; BUG?

Looks like the "result" is in st1, and you store st0? Perhaps try "fdivp"?

...
>     sub esp,32
>     fldz
>     fst qword [esp]
>     fst qword [esp]
>     fst qword [esp]
>     fstp qword [esp]
>         call glClearColor
>     add esp, 32

Here, you seem to be storing the result in the same place 4 times. 
Probably want "fst qword [esp]"/"fst qword [esp + 8]"/"fst qword [esp + 
16]", etc. ???

...
>     fild dword [esp+20] ;width
>     fild dword [esp+24] ;height
>     sub esp,8
>     fdiv st1, st0
>     fstp qword [esp] ; BUG?

As above...

I don't have a clue about GL, but those look "suspicious" to me... Hope 
it helps.

Best,
Frank

