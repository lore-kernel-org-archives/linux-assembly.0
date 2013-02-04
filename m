From: Hendrik Visage <hvjunk@gmail.com>
Subject: re: Disassembly of 00000
Date: Tue, 5 Feb 2013 00:54:09 +0200
Message-ID: <CADtGFvnjChHxk2mKKAT8Sj0j=+MTH7oHMHbhD-OE=4ZTCLSuZw@mail.gmail.com>
References: <20130202045339.GD2391@debian.localdomain>
	<20749.23788.343335.87280@eidolon.muppetlabs.com>
	<20130202185440.GA2519@debian.localdomain>
	<CAN0_x-Kw9TxbD4EHmD1Ns5BJtBXToW_qsXSZWRzEtKxObXMhSQ@mail.gmail.com>
	<20130204062426.GD2612@debian.localdomain>
	<CAN0_x-Jdvwoqzx4_XNqdZPk1EndOhgd_eU=6NQ9Mp1b=Vs471A@mail.gmail.com>
	<CADtGFvnaEgacU-FvtZZnOxkX4tbFxj6tYhqb-1ok6jwrMm=39Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:content-type;
        bh=5FrfBcwSMKFLJMNln+7f4Ao1F5IFW053Gr8NtGvBtBE=;
        b=UvfbTy+ZKekxxNEs8VNdZCnxPwymfFQvMtjs9VBHRIMsf54EQathBe4v3Jl4mRTlmd
         QZwV0jytIPoieWZl4G8agTUVwK5LP4OJxPYLHWvMiXUQHApNUP7LFvMvnzI0jGDBHT4s
         R6BveZrl5fJd+pNpj7ucN0Dr1gXwNwcjWsmJwdc6+YiFrbW2G6v6gbx0uH2t2DLGWSgd
         c+oSmWpC9QdA3B/Bq3VSCtNbQJFQSPsPtQcfYcNwqE+AQeChAmfeCNfZdFJliBwqHU6o
         C5Vw88nQ4HLNg8t8V4bXUfnDRHMUEqvhGqOOlPehRC2Y3m0xJLHC275OpxPhhgH/jZJr
         y6LQ==
In-Reply-To: <CADtGFvnaEgacU-FvtZZnOxkX4tbFxj6tYhqb-1ok6jwrMm=39Q@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

On Mon, Feb 4, 2013 at 9:25 PM, Sofiane Akermoun <akersof@gmail.com> wrote:
>
> almost every bytes could be a legal instruction. A disassembler need
> to know where to start to disassemble the code.
> When you pass a binary to a disassembler, it knows that it has to
> start at the begining of the code. (a disassembler find the code
> section by checking some informtion in the header of the binary).
> The condition is to start to disassemble at the begining of the code
> else you can not find the offset and length for each instruction.


And this would also be true if the CPU itself was given those code to
execute with the PC (program Counter) pointed at that address :)

This is one of the "issues" I have with the ia32/x86_64 with their
variable length instructions and CISC model. Compare this with the
SPARC RISC  where the 32bit (up to v8) instructions are all aligned on
32bit word boundaries (ie. the PC increments in 4s, else you have an
alignment error/exception raised), and each instruction is  32bit
words, no exception :)


>
> <snip-variable-length-explanation>


>
> >   What is the condition that decide one byte is or not a legal instruction's start ?


Whether that sequence of bytes are a supported instruction on the
given CPU it is meant to execute on, as a SSE instruction might not be
valid on a old AMD with only 3Dnow available.

So in all cases, you'll need to also know the CPU as well as the
specific mode, ie. real,  extended, long etc. that it was targeted for
as a instruction in long mode for example won't be valid in real mode.

>
> >   Are there some occasions that disassembler need scan more than one byte to detect
> >
> >   its logic ?


 This have been answered, in the previous example. The other answer
here is RTFM the CPU manuals you are disassembling for ;)
