From: Rudolf Marek <MAREKR2@cs.felk.cvut.cz>
Subject: Re: Keyboard Input
Date: Wed, 8 May 2002 15:46:02 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <abba6o$dal$2@main.gmane.org>
References: <200205081329.GAA32743@gold.he.net>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200205081329.GAA32743@gold.he.net>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J.S.Souza" <jssouza@pacbell.net>
Cc: linux-assembly@vger.kernel.org


hello,


I wrote it here last week I think but I cant find it so once again.

On Wed, 8 May 2002, J.S.Souza wrote:

> Date: Wed, 8 May 2002 06:30:00 -0700
> From: J.S.Souza <jssouza@pacbell.net>
> To: linux-assembly@vger.kernel.org
> Subject: Keyboard Input
> 
> I'm new to linux assembly although I have taken Assembly Programming in 
> College (unfortunately DOS based).  How is it possible to read input from the 
> keyboard until the user hits the 'enter' key?  Does using the read() syscall 
> work?  

yes via read syscall, file desc (handle) will be STDIN


Also, how about reading only ONE character from user and returning 
> control back to the program?  Although I know C fairly well, I would rather 
> use Assembly _only_  (if this is possible).

It depends on terminal settings, you have to set it via ioctl syscall
I think it is ICANON atribute.

see example in asmutils package (sh.asm - tty_init to be more specific)


Regards
		Rudolf

To konstantin: 

I should put Q&A about this in FAQ and about vm86 too.


