From: "Richard Cooper" <peajay@funrestraints.com>
Subject: Re: Reading at port 60h
Date: Sat, 03 Sep 2005 22:56:30 -0400
Message-ID: <op.swj44gl4nro9m0@sucks.airplane.fire>
References: <BAY14-F3D53EEACBCA04B2C40C02D0A20@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <BAY14-F3D53EEACBCA04B2C40C02D0A20@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: Martin Fflores <abebex17@hotmail.com>
Cc: linux-assembly@vger.kernel.org

> how i can have noticie that a key was pressed , but reading at port 60h,

You aren't doing that in Linux are you?  Linux reads the keyboard via an  
interrupt, if you're polling through port 0x60/0x64, you're not going to  
get anything because the kernel will get to it first.

You can have the kernel give you the scancodes from the keyboard on your  
stdin by using ioctls.  You can get more information about that by typing  
"man console_ioctl"

Basically, you call KDGKBMODE to get the current mode and save it, then  
call KDSKBMODE to set "RAW" mode, and when your program exits, you set   
the keyboard mode back like it was.  However, before that, you have to  
install signal handlers to catch if your program crashes or someone tries  
to kill it, because if your program doesn't set the keyboard mode back,  
the kernel isn't going to do it.  Also, before calling KDSKBMODE, you need  
to call TCSETSW to change the TTY settings, otherwise scancode 3 will be  
interpreted as contol-c, and scancode 13 will be translated to 10, and 127  
will be translated to 8, and probably some more.  You also have to use  
TCGETS to save those settings, so you can restore them too.  Then you have  
to watch for Alt-Fn and signal the kernel via VT_ACTIVATE to switch  
consoles, because it doesn't watch for Alt-Fn when they keyboard is in RAW  
mode.  On the plus side, you don't have to switch back to non-raw mode  
when you call VT_ACTIVATE, because the kernel keeps each console in it's  
own mode.

It's a mess of work, but it's doable, and will certainly work better than  
direct access.

> my problem is that i cant find a good documentation,

I've got a book, The Indispensable PC Hardware Book, which is a pretty  
good book.  It tells how to do direct hardware access with most things  
that it covers (but not much on VGA, unfortunately), and most of the  
examples are in assembly language.  The keyboard chapter is a pain to  
read, and I never did anything sucessfully with it, but then last time I  
tried was 10 years ago when I was 16, so maybe I just wasn't smart  
enough.  However, I didn't have any trouble with doing direct IDE access  
after reading the chapter about that, so I don't know, maybe there's just  
something wrong with that chapter.

Looking it over, it is quite confusing (e.g., the "output buffer" is the  
port that you read scancodes from, and the "input port" isn't a port at  
all), but it seems like the information is all there.

Looks like the keyboard I/O is definately confusing, though.  You've got  
the two ports you communicate to the controller with, then the controller  
has two ports that it communicates to the keyboard with, as well as  
setting things like the A20 gate, and then the keyboard is what does  
stuff.  Along the way there's an "output port" (of which the A20 gate is a  
part of) which the controller can both write to and read from, but to  
access it, you have to tell the controller to access it, because it's the  
controller's port, not yours.

> web link that will be great.

Normally the best documentation you can find on the web is the datasheet  
for the component itself:

http://www.jameco.com/webapp/wcs/stores/servlet/ProductDisplay?langId=-1&storeId=10001&catalogId=10001&productId=53014

However, the keyboard controller is just a generic programmable  
computer-in-a-chip.  So the datasheet doesn't help much.

Book link:
http://www.amazon.com/exec/obidos/tg/detail/-/0201596164/qid=1125801989/sr=8-1/ref=pd_bbs_1/102-3152860-8785751?v=glance&s=books&n=507846
