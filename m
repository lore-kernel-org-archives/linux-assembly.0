From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: 'as' mnemonics
Date: Mon, 30 Oct 2006 15:29:46 -0800
Message-ID: <1162250986.4749.20.camel@ubuntu>
References: <001101c6fc63$350dda60$2c86e150@gary>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <001101c6fc63$350dda60$2c86e150@gary>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: john d gray <johndgray2003@tiscali.co.uk>
Cc: linux-assembly@vger.kernel.org

First, go to Intel's website and download their manuals. The main one
you want is "Intel Architecture Software Developer's Manual, Volume 2:
Instruction Set Reference."

Then you can use Linux's "info as" to learn the at&t differences. Go to
Machine Dependencies->i386-Dependent. This will probably provide all the
information (plus a lot more) that you need.

Bob Plantz

On Mon, 2006-10-30 at 20:36 +0000, john d gray wrote:
> To: linux-assembly@vger.kernel.org
> From: john david gray <johndgray2003@tiscali.co.uk>
> 
> Hello ,
>             I am working on a Pascal compiler. I have already changed the
> source code from Pascal to C { and this now works both in amigados, and
> in linux } where it produces 68000 assembler code { a68k } .
> { a68k uses at&t 's  left to right assembler : mov.l $567,reg }
> 
>             I am currently working on a version to produce {linux} x86
> output.
>  I have written a small library of routines { fgets fputs etc.} in
> {linux} x86 'as' code , and have the first 80% of the compiler complete.
> 
>              Now need some more information please as I need to convert
> { for example } 68000's seq sne exg etc to x86 'as' code.
>              Can you recommend somewhere I can download info on
>  gcc's 'as' mnemonics please ?
> 
> 
> Thanks
> John Gray (8^)>


