From: linuxassembly@evobsyniva.com
Subject: Re: Keyboard and Mouse library
Date: Tue, 15 Jul 2003 23:09:39 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <oprsdu2dzklmcbdf@smtp-server.woh.rr.com>
References: <E19cPhx-0000W5-00@mail.tv-sign.ru> <200307160303.16120.jko@save-net.com>
Reply-To: linuxassembly@evobsyniva.com
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200307160303.16120.jko@save-net.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: jeff <jko@save-net.com>
Cc: linux-assembly@vger.kernel.org

On Wed, 16 Jul 2003 03:03:15 -0700, jeff <jko@save-net.com> wrote:

> Also, it would be nice to get the raw keyboard scan
> codes.  I've found programs that claim to do this
> but they don't work on my 9.1 Mandrake version
> of Linux?

sys_ioctl STDIN, KDSKBMODE, K_RAW

Afterwards you'll be in raw mode.  Unfortunatly, whatever is in the kernel 
that the stty command controls is still mucking things up, and continutes 
to translate byte 13 into a byte 10, and byte 127 into a byte 8, and keeps 
all input from you until a byte 13 comes along which may be causing you to 
think it isn't working since you can't read anything from stdin.

There are some mysterious ioctls that control this as well, but they don't 
seem to be documented anywhere at all.  However, you can simply call the 
stty program to do this for you, which sounds bad at first, but if you do 
it this way you're guaranteed it'll work right, and if the secret ioctls 
are changed, you don't have to care as long as the stty program is updated 
with them.  This is the way it is done with my program Softer, and you 
can't even tell it's doing it.

First run the command:  stty -g

It'll spit out a long string of stuff.  This stuff is the current stty 
settings.  Save them somewhere.

Then do: stty raw -echo

Now the kernel will stop it's character translation, allowing you to read 
data as soon as it's available rather than waiting on a byte 13, and it 
won't echo everything to the screen either, which makes no sense in raw 
mode.  In fact, the whole deal makes no sense with the keyboard in raw 
mode, so I don't see why it isn't all disabled automatically.  Anyway, this 
is what you have to do, unfortunatly.

Upon exit, do this:  stty [that_string_of_crap_from_earlier]

Then the settings will be back to what they used to be.  Just call the 
keyboard ioctl to switch it back out of raw mode, and you're done.

Now when in raw mode, there's the little matter of not being able to hit 
Atl-Fn to switch consoles anymore.  Your program should fix this by 
watching for such key combinations and switching the console for the user.  
You don't need to switch out of raw mode or re-run stty when this is done, 
the kernel keeps keyboard states seperate for each console.  Also, Control- 
C won't end your program anymore, so make sure there's always some way to 
end your program.

You might want to have a look at my program Softer which is at

http://www.evobsyniva.com/softer/

It does raw keyboard and video access.  It runs other programs under it, 
and gives them scancodes, in addition to figuring out what the user is 
typing (so that you can ignore the scancodes if you don't want them).  
Also, it's scancodes aren't the keyboard scan codes, but some of it's very 
own, so that each key has it's own code and there are no prefix codes to 
worry about.  I don't know your reasons for writing this library, but if 
it's just to get around linux's lousy terminal interface, you might be 
happy just using Softer.  That's why I wrote it.  It doesn't do mouse, 
however, which isn't to say that if you figure out a way to get mouse 
input, and tell me about it, that I won't add it in.  I just don't care 
enough about mouse support to figure it out on my own.

At the moment it requires users to execute softer to run softer programs, 
but sooner or later I'm going to make it so that programs can detect if 
softer is already running, and if not, start it thenselves, making it 
possible for users to run softer programs without having to start softer 
first.

