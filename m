From: michael young <mhyoung@valdosta.edu>
Subject: Re: DOS assembly questions?
Date: Tue, 28 Oct 2003 17:11:58 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F9EE9AE.6090308@valdosta.edu>
References: <OFC97235CC.44120BC0-ON48256DC9.00123CF7-48256DC9.001D21FD@LocalDomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <OFC97235CC.44120BC0-ON48256DC9.00123CF7-48256DC9.001D21FD@LocalDomain>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: FernanBolando@astec-power.com
Cc: linux-assembly@vger.kernel.org, linux-assembly-owner@vger.kernel.org

Thank you.
I think I'm finally getting it.
I really appreciate everyone's help.

Michael

FernanBolando@astec-power.com wrote:

>
>
>Hi
>
>excuse me for the formatting of this mail I have to using windows when at
>the office.
>
>As stated before ds:dx should point to the message you are trying to
>display
>You should realize that the string "10" is composed of two ASCII characters
>which is 0x31 and 0x30.
>
>This code
>
>mov dx, 10
>mov ah,9
>int 21h
>
>will display all characters at address ds:10 until it reaches '$'.
>when you decrement dx to 9 for the next loop it will display all the
>characters at
>address ds:09 until it reaches '$'. What you need is to convert the
>contents of cx to a string '10'.
>in the form
>
>string db '10',10,13
>
>you can use something like this
>
>lea dx, string
>mov ah,9
>int 21h
>mov ah,4ch
>int 21h
>
>string      db 00
>dummy  db 10,13,'$'
>
>and simply put the ASCII into the memory address of string.
>
>Another problem that you will discover is that "0" uses only one byte,
>while "10"  uses two bytes, which can
>complicate  your number_to_string function, but can still be done with
>patience. If you only want to convert 0 - 9 to
>string you can simply add 0x30 to them and get an ASCII representation.
>
>since you are all doing this under DOS you can check this by running the
>debug program.
>
>I hope this helps,
>
>,Fernan
>
>
>
>
>
>                                                                           
>             michael young                                                 
>             <mhyoung@valdosta                                             
>             .edu>                                                      To 
>             Sent by:                  linux-assembly@vger.kernel.org      
>             linux-assembly-ow                                          cc 
>             ner@vger.kernel.o                                             
>             rg                                                    Subject 
>                                       Re: DOS assembly questions?         
>                                                                           
>             10/22/03 02:05 AM                                             
>                                                                           
>                                                                           
>                                                                           
>                                                                           
>
>
>
>
>Hello,
>     Thanks to everyone for responding.
>I'm sorry for not giving enough info.
>What I want to do is starting at 10 (or some number).
>1. print the number.
>2. dec the number.
>3. loop back to step 1.
>4. when number reaches 0 print "All done" (or something).
>5 end program
>
>my code for this is:
>
>BITS 16
>ORG 0x0100
>
>
>SEGMENT .text
>
>START:
>  mov cx, 10
>  call myloop
>
>myloop:
>  mov dx, cx
>  mov ah, 9
>  int 21H
>  dec cx
>  jnz myloop
>  mov dx, donemsg
>  mov ah, 9
>  int 21H
>  mov ah, 4CH
>  int 21H
>
>SEGMENT .data
>
>donemsg db "All done!", 13, 10, "$"
>
>
>########### end of program ################
>
>the output should be:
>10
>9
>8
>7
>6
>5
>4
>3
>2
>1
>All done!
>
>
>Yall say I can't print the numbers that way.
>And sure enough that does not work.
>How would yall suggest I go about this?
>Also, I does loop the correct number of times but,
> it prints "All done!" after every iteration.
>Can you tell me why that is?
>Mr. Burt, don't worry about offending me.
>Tell me what I need to hear.
>A sharp knife cuts the quickest and hurts the least.
>Mr. Hyde, wonderful site. What does IIRC mean?
>Again, thank you to all of you for your responses and links.
>
>Michael
>
>BTW: i'm using nasm16 and I'm reading "Assembly Language Step-by-Step
>2ed." by Jeff Duntemann.
>            I'm in DOS now but hope to move to LINUX assembly some day.
>
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-assembly"
>in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
>  
>

