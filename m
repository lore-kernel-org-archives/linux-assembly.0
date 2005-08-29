From: Tim Hoolihan <thoolihan@yahoo.com>
Subject: Re: Using C Libraries From Assembly
Date: Mon, 29 Aug 2005 15:32:14 -0400
Message-ID: <431362BE.2080902@yahoo.com>
References: <0D544207876CDA428F17DD7EA448C192088AC0@bailey.DOMAIN.KSNINC.PVT>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <0D544207876CDA428F17DD7EA448C192088AC0@bailey.DOMAIN.KSNINC.PVT>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Landon Blake <lblake@ksninc.com>
Cc: linux-assembly@vger.kernel.org

Try googling on "printf assembly".  I found a few good examples there.  
I'm not sure what assembler or syntax style you're using, so it's 
probably best to dig through the search results yourself. 

-Tim

Landon Blake wrote:

>Linux Assembly Programmers,
>
>I had posted an earlier message about adding graphics to an assembly
>language program. After some research the past couple of days it seems
>that most available, open source graphics libraries provide a C API. I
>would like to add graphics capabilities to the simple programming
>language I want to write in assembly.
>
>So, my next question is this:
>
>Can you call C functions from a program written in assembly language?
>I've googled this subject, but was only able to find one paragraph that
>didn't seem to help much. Most information seems to deal with going the
>other direction, that is, calling assembly from C functions. However,
>I'm guessing that it is possible, since both languages end up as machine
>code at some point. Are there any resources that explain how to do this?
>
>Thanks for all the help.
>
>Landon
>-
>To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>

