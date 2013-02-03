From: Sofiane Akermoun <akersof@gmail.com>
Subject: Re: Disassembly of 00000
Date: Sun, 3 Feb 2013 06:44:00 +0100
Message-ID: <CAN0_x-Ke1Vj2q2hTHAwM6rEMG2NpaaMAXNy42RdNm0RxmNv5YA@mail.gmail.com>
References: <20130202045339.GD2391@debian.localdomain>
	<20749.23788.343335.87280@eidolon.muppetlabs.com>
	<20130202185440.GA2519@debian.localdomain>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=Mi9ZiirCme3Jnf5esU/AeUxkrn2YRBpz2d/NZj7TmzU=;
        b=x17JFZCXWUyBygTQTmRW/sp65cvwb8HgFHuYQdEO++okAdYrwEdQSgCrdf/y1jsiWv
         D9UwSS3K8+z/42liGm8UkNDJx6goL75l/OAfY+ly65LqkMIgV8zxm/aWXy0Z+7Dcn/Qg
         Bxwi4jlcaDXBFWTLSIcILe2D3WzL+qE6qRSdWJ+W9BNVhehHYOQYkvpjV8Mnneq2KX8k
         OXNqmrqlbyg9lhnKQS3nBb6RhvXfFb/pcT1GQMvYdX5vdJfOzBcQBOaiFIWzagyT3BXx
         erPEqxgmrHUlxGJ4zAj0NtG9PgZR9N4qkSJ0x10cHTBHyy4qJzFIhwVhU2anYpJM4tS7
         G6Hg==
In-Reply-To: <20130202185440.GA2519@debian.localdomain>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: horseriver <horserivers@gmail.com>
Cc: linux-assembly@vger.kernel.org

Hello,

Answers of you previous questions:

How does disassembler check the number of bytes which consist an instruction  ?
    A disassembler just uses a table. The intel documentation
describes all the instruction, with the method on how do decode it
(not really the method you have to write it of course).
A disassembler should know where to start to disassemble, else he will
start by disassembling bad data.. and probably fail on an unknown or
unlogical instruction, or the worst case everything will be ok.
When i wrote a "disassembler just uses a table".. it is not really
true, it is not true at all.. disassembler use also heuristic engine,
some data, or function, could be store in data section for exemple or
of course data could be stored in .text section. Good disassembler
know how to interpret them, this is why a disassembler know if he is
reading a string or an executable code

Can only one byte tell the instruction's length?
    For few instruction yes for most of them.
I sort ,on intel, all opcodes in about 16 famillies. I mean i need 16
different method to get just the size of the current instruction (i
did it for my personnal position independant code length disassembler
written in assembly of course :)).
Some instructions are just 1 byte and go like: push ES, pushf, RETN.,
some are 1 byte + 1 byte or 1 byte + 1 dword/word
Others use the template Prefix byte(0 to 4), opcode bytes (1 to 3),
modReg r/m byte, optionnal scaled indexed bytes, and a displacement or
and or an immediate value eache one are 0 to 4 bytes.
In theory you have to know if an opcode use a modReg byte, and if yes
parse it to know if the following parameters are used.

Sofiane Akermoun
akersof@gmail.com

2013/2/2 horseriver <horserivers@gmail.com>
>
> On Sat, Feb 02, 2013 at 10:37:32AM -0800, Brian Raiter wrote:
> > >    I have a question about disassemblly utility .
> > >    If I fill an elf's text section with some random data,then
> > >    how does the disas command work for these data?
> > >    Is there occasion that several sequence of bytes can not be translated
> > >    into legal instructions?
> >
> > Yes, definitely. In those cases a typical disassembler will just mark
> > the first byte as being literally emitted and try to resume
> > disassembly at the next byte. For example, using ndisasm v2.07:
>
>   Thanks!
>   What is "literally emitted" meaning here?
>   I guess you mean a const value definition.
>   How does disassembler check the number of bytes which consist an instruction  ?
>   Can only noe byte tell the instruction's length?
>
> >
> > $ echo -e '\017zz' | ndisasm -
> > 00000000  0F                db 0x0f
> > 00000001  7A7A              jpe 0x7d
> > 00000003  0A                db 0x0a
> >
> > b
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html




--
Sofiane AKERMOUN
akersof@gmail.com
