From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: gas "ljmp" instruction
Date: Mon, 16 Dec 2002 08:24:18 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3DFD7FA2.8050808@eprocess.fr>
References: <3DFD1CAF.6010106@curvesoft.com>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ram <ram@curvesoft.com>
Cc: linux-assembly@vger.kernel.org

Hi,
ljmp is 'long jump'
A 'short' jump (standard jump) will move your ip pointer to a near area 
(in real mode, in the +/-32768 bytes around => jmp 0x1234, which is the 
offset).
If you need more displasment, you have to specify the segment (jmp 
0x1234:0x5678). This is a far jump (long jump). I don't remember opcodes.

In the bootsect.S, we only copy the code at a different place, and then, 
run into our copy:
# First things first. Move ourself from 0x7C00 -> 0x90000 and jump there.

    movw    $BOOTSEG, %ax
    movw    %ax, %ds        # %ds = BOOTSEG
    movw    $INITSEG, %ax
    movw    %ax, %es        # %ax = %es = INITSEG
    movw    $256, %cx
    subw    %si, %si
    subw    %di, %di
    cld
    rep
    movsw
    ljmp    $INITSEG, $go

We copy the code from BOOTSEG:0 to INITSEG:0, and jump to INITSEG:0.
Do you understant that?
cld: clear direction => auto increment
rep    : will repeat next instruction while cx>0
movsw: move word from ds:si to es:di and
        decrement cx
        increment si (by 2, as we are moving words)
        increment di (by 2 as well)
if the direction bit in the flags was 1, we would have decrement by2 si 
and di (so, the cld).

Is it clearer?


Fred



ram wrote:

> Hi,
>
> I was looking at bootsect.S in the Linux sources to understand how
> the boot process works and noticed the "ljmp" instruction but I can
> find no documentation on it either in the Intel docs or the gas docs.
> Does anyone know what it does, and more generally, is there
> some documentation on the full set of x86 opcode mnemonics supported
> by gas ? I'm a novice at the x86 instruction set ...
>
> Thanks.
>
> Ram
>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



