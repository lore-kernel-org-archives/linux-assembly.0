From: Sofiane Akermoun <akersof@gmail.com>
Subject: Re: Disassembly of 00000
Date: Mon, 4 Feb 2013 20:25:34 +0100
Message-ID: <CAN0_x-Jdvwoqzx4_XNqdZPk1EndOhgd_eU=6NQ9Mp1b=Vs471A@mail.gmail.com>
References: <20130202045339.GD2391@debian.localdomain>
	<20749.23788.343335.87280@eidolon.muppetlabs.com>
	<20130202185440.GA2519@debian.localdomain>
	<CAN0_x-Kw9TxbD4EHmD1Ns5BJtBXToW_qsXSZWRzEtKxObXMhSQ@mail.gmail.com>
	<20130204062426.GD2612@debian.localdomain>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=4wdstUA3t2MsmgAFYZPefJ2iux+QrIVZaq/z3kH8eh0=;
        b=XUgy9tvwhBLd1Z+TFS+9wTpag4oJW7EmaQ1CErJ6uFi2oU0kSJ+GilyjPWlrtyQnWY
         4zYc/MvwQlQzGkR7LDV9i5gyDbSAuu2XocQMofVEl7no/kA3wL8XHRES3ulNmWjjWjxu
         ofALMT1QTIM67ZiNUH07ZI5YBP9hCZ1dhqbrsuncsf5ooYnmkWQx8hc9UhRHS5k21P1W
         zHkMLSUT9P4oRO5JCBtKXcZLhFm6NN0YM/bqul+reBydFMdIKGVujpf4cQw64pIQL9Hh
         aJjUtYLNdLSGAnwJ4YFk6h3HxlrfRUgCWV5CtO5psnxseGUiqpvtsDg3OuBYtvA4tBtu
         pI+w==
In-Reply-To: <20130204062426.GD2612@debian.localdomain>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: horseriver <horserivers@gmail.com>
Cc: linux-assembly@vger.kernel.org

almost every bytes could be a legal instruction. A disassembler need
to know where to start to disassemble the code.
When you pass a binary to a disassembler, it knows that it has to
start at the begining of the code. (a disassembler find the code
section by checking some informtion in the header of the binary).
The condition is to start to disassemble at the begining of the code
else you can not find the offset and length for each instruction.


An examle:
imagine you have this:
66 83 84 98 00 10 000003 1234565431
the disassembler start by checking the first byte and continue until
he find an instruction.

66 : It is a prefix, it means that the whole instrusction use 16 bits
addressing instead of the default 32 bits

83: This instruction use 2 operands, and the second operand is a byte.
This opcode is followed by a mod r/m byte

84; the mod r/m byte equal in binary format 10 000 100.
10: the first operand is memory with a dword displacement
000: the instruction is a ADD
100: it means this mod r/m byte is followed by a SIB byte

98: the SIB byte equal 10 011 000 in binary
it means scale = 4 index = ebx, base = eax

Then now we know:
    1 byte prefix   = 66
+ 1 byte opcode instruction = 83
+ 1 byte modr/m = 84
+ 1 byte SIB = 98
+ 4 bytes a displacement = 00 10 00 00 (1000 for human)
+ 1 byte operand = 03
The instruction is 9 bytes long
In other words: add word ptr ds:[ebx*4 + eax + 1000], 3

Here 98 is a SIB byte not the instruction CWD, and 03 an operand of 1
byte not the ADD instruction (yes 03 = ADD also).

As last words, you need to get the context to disassemble, and to get
the context you have to start at the begining of the code section to
disassemble, or at least at an instruction that you have checked and
confirmed.

regards,

Sofiane Akermoun
akersof@gmail.com




2013/2/4 horseriver <horserivers@gmail.com>:
>
>>A disassembler just uses a table. The intel documentation describes all
>>the instruction, with the method on how do decode it (not really the method
>>you have to write it of course).
>>A disassembler should know where to start to disassemble, else he will
>>start by disassembling bad data.. and probably fail on an unknown or
>>unlogical instruction, or the worst case everything will be ok.
>
>   Thanks!
>
>   What is the condition that decide one byte is or not a legal instruction's start ?
>
>   Are there some occasions that disassembler need scan more than one byte to detect
>
>   its logic ?
>
>
>
>
>
>



-- 
Sofiane AKERMOUN
akersof@gmail.com
