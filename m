From: Philip Jacob Smith <pj@evobsyniva.com>
Subject: Re: confused asm newbie
Date: Mon, 17 Nov 2003 21:51:11 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <oprytbjla4b2epmx@localhost>
References: <20031117114725.79704.qmail@web41313.mail.yahoo.com>
Reply-To: pj@evobsyniva.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20031117114725.79704.qmail@web41313.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

>> I know what you mean about those assembly language
>> books.  They try to teach assembly like it's a
>> language, when it's not (despite the "assembly
>> language" name), and so they actually end up
>> teaching how to use one particular assembler (which
>> is really what you would want to call a language)
>> with one particular operating system, and usually
>> just do a lot of "here's how you do it" stuff and
>> not enough "here's how this works" type stuff.

To expand on this, I think there are four areas to assembly language:  the instruction set itself, the operating system, the hardware, and the assembler.

Every book I've read had an instruction set reference which gave brief descriptions of the instructions.  However, I think these should include a bit more than they usually do.  Like the description for the add instruction should explain how it manages to work correctly on both signed and unsigned numbers.  The jump instructions should explain that jb/ja are for use with unsigned numbers and jg/jl are for signed numbers.  Yet every time I see such a listing, it just says "jumps on the condition that the such and such flags are set."  I don't even know what flags they are, because that isn't really important.  What's important is what the instruction is useful for, and the jg instruction is useful for jumping on the condition that the previous add, sub, or cmp instruction resulted in a number between 1 and 127 (for bytes, that is, and I can't say that I know that is correct, but rather that's just what I always use it for, rather than check for overflow errors I always just m!
 
 ake 
sure they won't occour in the first place).  Telling me what flags it sets doesn't really tell me anything.

Every book I've read deals with just one operating system.  I don't think this is bad, I couldn't honestly expect anything else.  What bothers me is that they both claim to be about general assembly langauge (I never saw a book titled "DOS Assembly Language", always just "Assembly Language") and yet concentrate heavily on how to get things done under their one specific operating system.  95% of what someone reads in a DOS assembly langauge book is going to be useless for someone in Linux, and so I think it's rather deceptive to claim that the book is about assembly langauge when mostly it isn't.  My other complaint here is that pretty much every book is like this.  They'll spend 90% of the book explaining how to use every DOS interrupt imaginable, yet they can't squeeze in important things like how to use the SCASB/CMPSB instructions, which leads to people brewing up their own wickedly horrible functions that try to do the same things.  Some books don't even bother with simp!
 
 le ones 
like LODSB/STOSB.

Most books I've read don't deal with hardware much at all.  It's interrupt this and interrupt that.  Now hardware programming is difficult, but it's exactly that reason that it needs to be in a book.  The books I have seen it in did quite poorly.  I read one book that had a section on VGA and even an example on using 640x480 16-color mode, and although the example worked, the textual explanation was so lacking I had no idea how they did it.  I could have just copied their code and had something that worked, but that's not why I bought the book.  I bought the book so I could learn to do this stuff myself, and just using someone else's code isn't learning.  While I'm on this topic, I'll recommend "The Indispensable PC Hardware Book."  This is the only programming book I've ever bought that I've kept.  All others have either been given away, or if they were really bad, went into the trash.

Every book I've read treats the assembler as if it is assembly language.  In my opinion it's just the opcodes that are assembly language, all of the directives and the general syntax of the assember are something else.  Books tend not to make any distinction between the two.  The result is that people read a book on MASM, then switch to NASM, and wonder why NASM doesn't have "assume", "word ptr", or why code like "mov eax, data[14]" causes errors, and in particular wonder why "mov eax, data" doesn't do what they expect.  I've seen people say that the opcodes are "machine langauge" and that the mnemonics are "assembly langauge" but that's just silly.  The opcodes are the langauge, it's just that all those numbers are hard to remember so we gave them little names, known as mnemonics.  Most assemblers use the same mnemonics, and differ slightly on their syntax for operands.  A good assembly book would explain this, and would draw a good line between instructions and directives !
 
 so that 
people understand what gets turned into code and what's there just to help the assembler out.  Most importantly, it should be understood that the assembler is a tool, not a programming language.  The assembler translates our mnemonics for us, and also allows us to use labels instead of hard coded addresses which would be hard to work with.

In general, I got into assembly language because I wanted to deal with all the little details and the hard stuff, and assembly books all try to generalize as much as possible and make things as easy as possible, the end result being that I was always disappointed.  It's as if they didn't actually want to teach me anything, but rather get me to the point where I could write _something_ that worked, at which point they could declare their job complete.  That's not what I like to spend my money on.

  
