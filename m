From: Emanuele Altieri <ealtieri@hampshire.edu>
Subject: Re: bios interuppts
Date: Tue, 04 Mar 2003 13:04:41 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3E64EAB9.5070000@hampshire.edu>
References: <20030304120742.6160.qmail@webmail7.rediffmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20030304120742.6160.qmail@webmail7.rediffmail.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anant Aneja <anantaneja@rediffmail.com>
Cc: linux-assembly@vger.kernel.org

The simplest way to do it is to use terminal escape codes. That is, you 
put these codes in a string and print the string with a simple write() 
or printf() call. The terminal will recognize the codes in the string 
and execute some special intructions such as clear the screen.

For example:

   #include <stdio.h>

   #define ESC 0x1B   /* escape code */

   int main()
   {
           /* Escape codes */
           char clr[5] = {ESC, '[', '2', 'J', 0};       /* clear screen */
           char cur[6] = {ESC, '[', '0', '0', 'H', 0};  /* goto 0,0 */

           printf(clr);
           printf(cur);

           return(0);
   }

More escape codes can be found at:
http://ilkerf.tripod.com/cdoc/vt100ref.html

and many other similar links.

Hope this helps,

--Emanuele



Anant Aneja wrote:

> My problem is i was using turbo c++ compiler before and
> frequently
> used ROM-BIOS interupts for
> certain functions ( like handling the screen, calling the mouse
> etc all in dos based programs
> using 386 based registers like ah al etc).
>
> Now I've started using gcc and find that even a basic screen
> clearing function requires me to use the
> "ncurses" library. this i did but it handles the screen only
> using
> windows and does not treat the console as an
> unlimited buffer.
>
> I dont wanna use the library therefore. plus it was a lot easier
> calling interupts for most simple tasks.
> I've read somewhere that Linux does not allow BIOS interupts
> since
> it runs in 'protected' mode.
> therefore, I cant do simple stuff like clearing a screen myself.
>
> Is there some way to do the above task easily (with or without
> assembly ?)
>
> Please help.
> Anant
>
>
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

