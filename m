From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: confused asm newbie
Date: Mon, 17 Nov 2003 13:29:31 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FB8BF2B.3070000@eprocess.fr>
References: <20031117114725.79704.qmail@web41313.mail.yahoo.com>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20031117114725.79704.qmail@web41313.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: b klein <b_klein1@yahoo.com>
Cc: linux-assembly@vger.kernel.org

b klein wrote:

>im trying to learn asm and use nasm, ald and a little
>gdb for it. im not a newbie to programming or
>assembly. ive learned it some time ago and come back
>to it now. so my question is what is the important
>bits that are worth learning? Im not interested in
>learning a tool, i want to learn the .. well
>'language'
>but if it isnt a language, what should it be?
>addressing modes, big-little endian, memory models,
>8-16-32-64 (12?) bits processors, ports, interupts or
>something else?
> 
>  
>
Hum...
1: find something to do!
Take something you would like to do (an assembly routine that write a 
text to the screen very quickly, a boot loader (not so hard to do!), a 
ACPI state reader, or what else you want)

2: get a compilator (cc is one)

3: try to do it.

I Think it is the only good way to learn assembly. By this method, 
you'll see how to use a tool (the compilator, but it will not be the 
main goal, you can choose the one you want), learn how to get doc (about 
the OS you are on, about BIOS if you have no OS, about the chips if you 
don't want to use BIOS, ...) and how all that work.
Once you have enough knowledge about one particular architecture, you 
can safety try an other!

Fred


