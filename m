From: willy meier <wklux@yahoo.co.uk>
Subject: Re: DOS assembly questions?
Date: Wed, 22 Oct 2003 07:07:48 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F961EB4.BE9DB472@yahoo.co.uk>
References: <3F9473D9.8010304@valdosta.edu> <3F957562.7060302@valdosta.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael young <mhyoung@valdosta.edu>, linux-assembly@mlists.in-berlin.de
Cc: linux-assembly@vger.kernel.org

michael young wrote:

apparently, a common 'problem':
if ah:=9 and int 21 is supposed to send text, 
the binary counter data can't appear visibly.
> 
	[...]
> START:
   mov cx, 10	=>	mov cx,"9"
>   call myloop
> 
> myloop:
>   mov dx, cx
>   mov ah, 9
>   int 21H
>   dec cx
			cmp cx,"0"
   jnz myloop	=>	jc myloop
>   mov dx, donemsg
	[...]

best,
	hp

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
  >> xxxx -at- lxhp -dot- in-berlin -dot- de <<
