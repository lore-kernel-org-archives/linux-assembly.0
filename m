From: liu song <today8@gmail.com>
Subject: Re: asm construct
Date: Wed, 6 Oct 2004 15:46:05 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <b4b8c64804100615464983cd54@mail.gmail.com>
References: <20041006104527.97542.qmail@web52903.mail.yahoo.com>
Reply-To: liu song <today8@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20041006104527.97542.qmail@web52903.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: assembly <linux-assembly@vger.kernel.org>

Linker is to link the libs and other objs together.

Generally, you can use gcc -S yourfile.c to see the detail of the asm construct.

song 

On Wed, 6 Oct 2004 11:45:27 +0100 (BST), Ankit Jain
<ankitjain1580@yahoo.com> wrote:
> hi
> 
> i want to know if this is correct? i am a bit confused
> about linker...i am talking this topic when we have a
> asm construct in our code.
> 
> The compiler basically reads the .c program and
> converts it into assembly code.Now during this it
> neglects this assembler construct and leaves it for
> assembler.Assembler is the person which basically
> looks for this part of the code and changes it into
> machine code.
> 
> thanks
> 
> ankit
> 
> ________________________________________________________________________
> Yahoo! Messenger - Communicate instantly..."Ping"
> your friends today! Download Messenger Now
> http://uk.messenger.yahoo.com/download/index.html
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
