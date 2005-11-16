From: "Robert Plantz" <plantz@sonoma.edu>
Subject: Re: packed bits question
Date: Tue, 15 Nov 2005 22:31:12 -0800
Message-ID: <op.s0blqawnzyondc@localhost.localdomain>
References: <38657.67.182.183.189.1132118461.squirrel@mail.luethy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <38657.67.182.183.189.1132118461.squirrel@mail.luethy.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: chris@luethy.net, linux-assembly@vger.kernel.org

This will probably involve using the shl and shr (shift left and shift  
right), and, or instructions. (Instruction names, not English words.)

I would draw a lot of diagrams showing how things are stored and what I  
need to do to store them that way or unravel them. After a while, you  
should see some patterns evolving. That should show you what algorithms  
you need.

My recommendation comes from writing many, many thousands of lines of  
assembly langauge for commercial applications over the past 30+ years, and  
over 20 years experience teaching the subject. Even with my experience, I  
would need to draw the diagrams before I could write any code.

Bob

On Tue, 15 Nov 2005 21:21:01 -0800, <chris@luethy.net> wrote:

> Hello all,
>         I have an assignment that requires me to write a simple database
> in assembly using Linux (GNU as, GNU ld, etc.).
>         I have to store IDs and their corresponding values, but the
> requirement (and this is why I need help) is that the IDs are 8
> bits each, followed immediately by 6 bits (six!) for the value,
> then, without padding two bits, the next data entry follows (8
> bits again for another ID, 6 bits for the next value, and so on).
>         I have initialized the DB in a C function (initialize implies the
> 8 bits for each ID is set to 0xFF (-1)) but now in an assembly
> routine I need to search for IDs that are -1. Obviously for the
> first ID it is simply the first byte, but how do I access the
> second, third, fourth, etc. IDs easily?
>         Basically, how can I easily work with something as bastardly as a
> 14-bit, no-packing data pairs?
>
> Thanks for all your help,
> Chris Thielen
