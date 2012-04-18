From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: Declare strings on stack, gas
Date: Wed, 18 Apr 2012 12:34:39 -0700
Message-ID: <4F8F174F.3080205@sonoma.edu>
References: <4F8ED685.2030408@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4F8ED685.2030408@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Hilst <danielhilst@gmail.com>
Cc: linux-assembly@vger.kernel.org

On 4/18/2012 7:58 AM, Daniel Hilst wrote:
> Is possible to declare strings on stack? I'm using mov + ebp offsets 
> to do something like that.. Is there an easier way to do it?
>
> Here is an sample off how I'm doing it: http://sprunge.us/UUZI
>
> The hex numbers are a "Hello World" string..
> I have tried .assci without success :(
>
> Thanks in advance!
>
>
Basically, you're asking if the compiler/assembler can initialize the 
stack to some known value. Since memory on the stack is dynamically 
allocated by the instructions:

doit:
       push    %ebp              ; Save caller's base pointer
       mov    %esp, %ebp         ; Establish our base pointer

       sub    $12, %esp          ; Allocate memory on the stack



the answer is 'no.' After you allocate stack memory (which now has 
garbage values), you need to copy known values there. Write your code in 
C and use the '-S' gcc option to see how the compiler does this. The 
'-S' option will generate the assembly language file foo.s from the C 
source file foo.c.

--Bob



