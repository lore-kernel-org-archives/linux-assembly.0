From: michael young <mhyoung@valdosta.edu>
Subject: Re: DOS assembly questions?
Date: Tue, 21 Oct 2003 14:05:22 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F957562.7060302@valdosta.edu>
References: <3F9473D9.8010304@valdosta.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3F9473D9.8010304@valdosta.edu>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Hello,
     Thanks to everyone for responding.
I'm sorry for not giving enough info.
What I want to do is starting at 10 (or some number).
1. print the number.
2. dec the number.
3. loop back to step 1.
4. when number reaches 0 print "All done" (or something).
5 end program

my code for this is:

BITS 16 
ORG 0x0100
 
 
SEGMENT .text
 
START:
  mov cx, 10
  call myloop
 
myloop:
  mov dx, cx
  mov ah, 9
  int 21H
  dec cx
  jnz myloop
  mov dx, donemsg
  mov ah, 9
  int 21H
  mov ah, 4CH
  int 21H
 
SEGMENT .data
 
donemsg db "All done!", 13, 10, "$"


########### end of program ################

the output should be:
10
9
8
7
6
5
4
3
2
1
All done!


Yall say I can't print the numbers that way.
And sure enough that does not work.
How would yall suggest I go about this?
Also, I does loop the correct number of times but,
 it prints "All done!" after every iteration.
Can you tell me why that is?
Mr. Burt, don't worry about offending me.
Tell me what I need to hear.
A sharp knife cuts the quickest and hurts the least.
Mr. Hyde, wonderful site. What does IIRC mean?
Again, thank you to all of you for your responses and links.

Michael

BTW: i'm using nasm16 and I'm reading "Assembly Language Step-by-Step 
2ed." by Jeff Duntemann.
            I'm in DOS now but hope to move to LINUX assembly some day.


