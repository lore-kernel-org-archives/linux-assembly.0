From: zebarbuc@free.fr
Subject: Re: 32-bit assembler::how to initialize segment registers
Date: Tue, 19 Oct 2004 07:40:58 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <1098164458.4174a8ea294cc@imp6-q.free.fr>
References: <56005.10.0.0.20.1098162741.squirrel@mail.cusat.ac.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <56005.10.0.0.20.1098162741.squirrel@mail.cusat.ac.in>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: san@cusat.ac.in
Cc: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

I don't understand your question...
You want to create your own assembler (like 'as86' prog), but you don't know how
to make it? That's it?
If yes, you'd better buy a related book, i'm afraid that we cannot answer all
your futur requests.
If not, please, explain a little bit your problem...

Fred


Selon san@cusat.ac.in:

> ---------------------------- Original Message ----------------------------
> Subject: 32-bit assembler::how to initialize segment registers
> From:    "shivam sharma" <shiurya@yahoo.co.in>
> Date:    Tue, October 19, 2004 12:07 am
> To:      San@cusat.ac.in
> --------------------------------------------------------------------------
> Hi
>
> am making 32-bit
> assembler as project in c under linux platform.
>              my problem is how my assembler should
> initialize the segment registers.suppose,if user
> program format is..........
>
>       .stack[64h]
>
>       .data
>      .........
>      .........
>      .........
>       .code
>      .........
>       .........
>      ..........
>                    then,on seeing the stack or data or
> code how the assembler program should initialize the
> segment registers.
>
> thanks in advance
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


