From: Scott Sibley <sisibley@gmail.com>
Subject: Re: Troubles with JIT compiler
Date: Fri, 22 Jan 2010 00:04:40 -0600
Message-ID: <cb4d391b1001212204u73bbda5cub4e36e88836a2972@mail.gmail.com>
References: <cb4d391b1001212012l654d2a93qe8d05187f8f5ecf0@mail.gmail.com>
	 <1264137975.1983.30.camel@bob-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=n06aZ4myF3bpr8+YgQxS9Rwe3M/LV7bbiL5DTM87zb0=;
        b=m2WarC3xH5tHcOSY6uc2xH0Wui6F6LhdfrLufCbx/YnbTtJoRko4hkEeRbIIe5LxS6
         8GNjymeAVyY9ydZLGI/oDja+20BTcN2LB17jDYJp6wDEbONJ0s2/4GY7rYQCa+/7daRs
         l5V511qgNVHFieWUkpK/QVuM7oaBe7fU9DRxg=
In-Reply-To: <1264137975.1983.30.camel@bob-desktop>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Robert Plantz <plantz@sonoma.edu>
Cc: linux-assembly@vger.kernel.org

On Thu, Jan 21, 2010 at 11:26 PM, Robert Plantz <plantz@sonoma.edu> wro=
te:
> On Thu, 2010-01-21 at 22:12 -0600, Scott Sibley wrote:
>> I'm debugging a script engine. The engine compiles expressions into
>> asm instructions, assigns that data to a function pointer, and
>> executes the function, passing one argument.
>>
>> I'm new to assembly, and pretty much stuck on the first issue I ran =
into.
>>
>> Here are the function's instructions for a basic assignment operatio=
n:
>>
>> 0x8067990: =A0 =A0push =A0 %ebp
>> 0x8067991: =A0 =A0mov =A0 =A0%esp,%ebp
>> 0x8067993: =A0 =A0sub =A0 =A0$0x8,%esp
>> 0x8067999: =A0 =A0fnstcw (%esp)
>> 0x806799c: =A0 =A0mov =A0 =A0(%esp),%eax
>> 0x806799f: =A0 =A0or =A0 =A0 $0xc00,%eax
>> 0x80679a4: =A0 =A0mov =A0 =A0%eax,0x4(%esp)
>> 0x80679a8: =A0 =A0fldcw =A00x4(%esp)
>> 0x80679ac: =A0 =A0flds =A0 0x806793c
>> 0x80679b2: =A0 =A0fsts =A0 0x805f014
>> 0x80679b8: =A0 =A0fstps =A00x8067954
>> 0x80679be: =A0 =A0fldcw =A0(%esp)
>> 0x80679c1: =A0 =A0add =A0 =A0$0x8,%esp
>> 0x80679c7: =A0 =A0emms
>> 0x80679c9: =A0 =A0leave
>> 0x80679ca: =A0 =A0ret
>>
>> Well, it appears to be crashing at the first instruction. Here are t=
he
>> values of ebp and esp.
>>
>> (gdb) x/x $ebp
>> 0xbffff168: =A0 =A00xbffff188
>> (gdb) x/x $esp
>> 0xbffff14c: =A0 =A00x0804e481
>>
>
> An immediate problem I see is that the stack pointer is not properly
> aligned. This is 32-bit code, and the Intel manual says that the stac=
k
> should be aligned at 32-bit addresses. That is, the least significant
> digit in esp should be 0, 4, 8, or c.
>
> I also note that the values in ebp and esp are very far apart.
> Typically, they contain similar values -- addresses somewhere in the
> stack.
>
> I would look at how the stack was set up in this program.
>
> --Bob
>
>
>

Hey, Robert. Thanks for replying.

How can I look into how the stack's being setup? This is a C program
that's compiling
data as instruction code into a pointer, and casting that pointer to a
function pointer, then
calling that function pointer. So the C code is managing the stack if
I'm not mistaken.
Correct me if I'm wrong.

Here's where the instructions are compiled:

IL_CORE_COMPILE(avs_x86_compiler_compile)
{
    X86GlobalData *gd =3D X86_GLOBALDATA(ctx);
    ILInstruction *insn;

    avs_debug(print("X86: Compiling started..."));
    /* Initialize X86 Assembler opcode context */
    x86_context_init(&gd->ctx, 4096, 1024*1024);

    /* Compile function entrance, setup stack frame*/
    x86_emit1(&gd->ctx, pushl, ebp);
    x86_emit2(&gd->ctx, movl, esp, ebp);

    /* Setup floating point rounding mode to integer truncation */
    x86_emit2(&gd->ctx, subl, imm(8), esp);
    x86_emit1(&gd->ctx, fstcw, disp(0, esp));
    x86_emit2(&gd->ctx, movl, disp(0, esp), eax);
    x86_emit2(&gd->ctx, orl, imm(0xc00), eax);
    x86_emit2(&gd->ctx, movl, eax, disp(4, esp));
    x86_emit1(&gd->ctx, fldcw, disp(4, esp));

    for (insn=3Davs_il_tree_base(tree); insn !=3D NULL; insn =3D insn->=
next) {
        avs_debug(print("X86: Compiling instruction: %p", insn));
        compile_opcode(gd, obj, insn);
    }

    /* Restore floating point rounding mode */
    x86_emit1(&gd->ctx, fldcw, disp(0, esp));
    x86_emit2(&gd->ctx, addl, imm(8), esp);

    /* Cleanup stack frame */
    x86_emit0(&gd->ctx, emms);
    x86_emit0(&gd->ctx, leave);
    x86_emit0(&gd->ctx, ret);

    /* Link machine */
    obj->run =3D (AvsRunnableExecuteCall) gd->ctx.buf;
    avs_debug(print("X86: Compiling finished..."));
    avs_debug(print("X86: Function: %p", obj->run));
    return 0;
}
--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
