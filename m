From: "Richard Cooper" <generic@xersedefixion.com>
Subject: Re: read key from keyboard
Date: Tue, 21 Dec 2004 02:29:28 -0500
Message-ID: <opsjckfebuuqea3r@sucks.airplane.fire>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: linux-assembly@vger.kernel.org

I just found this in the archive.  No one else answered it, so I guess I  
will.  It's quite the pain to figure out really.  I remember spending  
hours if not days trying to learn enough C that I could figure it out from  
the kernel source.  I really hate C.


> How can I read a key from the keyboard when the key is available?

You have to call TCSETSW, which sadly is like the most undocumented IOCTL  
ever...

This code is copy & pasted out of my program Softer.  The assembly syntax  
is different, but I'm sure you can figure it out.  It also makes the I/O  
completely raw, meaning you'll receive 127 instead of 8 for backspace, and  
you'll receive 13 instead of 10 for enter.  This is more than you want if  
you're just looking to read the characters as they are typed, but I don't  
remember how I ever figured out the correct values to get it to do what I  
wanted.  However, if you also want scancodes, then this is exactly what  
you want.

First you need to save the current settings which are creating the line  
buffering and other nonsense so that you can put them back when your  
program is done.

sys sys_ioctl, 0, TCGETS, old_termios

This requires a little structure to save into...

   old_termios
     .c_iflag resd 1
     .c_oflag resd 1
     .c_cflag resd 1
     .c_lflag resd 1
     .c_cc resb 19

Then you call another function to set the new mode...

   sys sys_ioctl, 0, TCSETSW, new_termios

And of course this requires another structure...

   new_termios
     .c_iflag dd 0
     .c_oflag dd ONLCR | OPOST
     .c_cflag dd B38400 | CS8 | CREAD | HUPCL
     .c_lflag dd 0
     .c_cc db $0, $3, $1c, $7f, $15, $4, $0, $1
           db $0, $11, $13, $1a, $0, $12, $f, $17
           db $16, $0, $0

And finally when your program is finished you need to put things back like  
they were...

   sys sys_ioctl, 0, TCSETSW, old_termios

And those nice constants are:

sys_ioctl = 54
TCGETS = 0x5401
TCSETSW = 0x5403
ONLCR | OPOST = 5
B38400 | CS8 | CREAD | HUPCL = 0x4BF

It looks like I got all of that from from the kernel source code file  
include/asm/termbits.h


> I wish also to know the keyboard scan code...

For scan codes you need the following, but you also need the above.   
Otherwise when scan code 13 comes along, linux will turn it into a 10, and  
it'll also not give you any scan codes until scancode 13 comes along.

First you have to save the old mode...

   sys sys_ioctl, 0, KDGKBMODE, oldmode

This just requires a place to store it.

   oldmode resd 1

Then you set the new mode...

   sys sys_ioctl, 0, KDSKBMODE, K_RAW

And when you're done you set it back...

   sys sys_ioctl, 0, KDSKBMODE, [oldmode]; systrap "calling KDSKBMODE."

And the constants are:

KDGKBMODE = 0x4B44
KDSKBMODE = 0x4B45
K_RAW = 0


I'll warn you that this is all a real pain in the backside.  If you  
program crashes before setting this stuff back like it was, then there's  
usually not much that can be done besides hitting the reset button.   
Scancode mode disable's linux's switching of consoles on Alt-Fn, and you  
can't type anything into your shell since it doesn't understand scancodes.

If you're just looking for better keyboard access, you might think about  
using my program Softer.  It already does all of this stuff and more  
simply so that programs can be written to run under it and not have to do  
it themselves.  It's basically an emulator for a non-existant terminal I  
made up that does everything the way that I want.  Interfacing with it is  
done simply by using your stdin and stdout, and when the user types you  
get the codes immediatly, both the ASCII character that was typed and a  
scan code so that you know which key was pressed, plus the scan codes are  
way easier to interpret than standard keyboard scan codes.  It's the  
easiest keyboard access one could ask for.

The website is
http://www.xersedefixion.com/softer/
and there is more information on it's keyboard I/O at
http://www.xersedefixion.com/softer/orange.html

It's especially nice for assembly language because all of the keyboard  
codes are the same fixed length, so there's none of that "if it began with  
an escape character then keep reading until you see one of these, then  
take the digits and convert them from text into a number, then if it's  
this" nonsense, and the display codes are all binary, so if you want to  
move to column 57 on the screen, you don't have to first convert the  
number 57 into a text string.  It also supports 320x240x256 and 640x480x16  
graphics modes to a limited extent, again, used by simply writing to  
stdout.
