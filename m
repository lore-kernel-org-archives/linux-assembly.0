From: "Rick A. Hohensee" <rickh@capaccess.org>
Subject: Forreal Mode update
Date: Sun, 20 Jul 2003 04:05:19 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <fc.0010c7b2009ad0a90010c7b2009ad0a9.9ad0aa@capaccess.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-assembly@vger.kernel.org

I don't have interrupts working in Forreal Mode yet, but I think I've
figured out what the two likely scenarios are. (Forreal Mode is
unprotected USE32. PE=0, Dbit in CS descriptor =1.)

PE=0 clearly means intvecs are 4-byte 8086-emulation-style, regardless of
Dbit. The exact description of INT says so, and it would be a very big
deal for it to be otherwise, like a special class of GDTless interrupt
gate for a mode INTeL doesn't support, or who knows what. The issue a
4-byte intvec creates in a USE32 world is what happens to a USE32 EIP
when the intvec offset is assigned to IP. Just IP, not EIP. Is the high
side of EIP persistant, like the high side of EAX when you clobber AX, or
does it get zeroed? Those appear to be the two possibilities. Getting
zeroed, UNLIKE EAX, would be better. Then your Forreal Mode event handler
code needs to be in the low meg. Just the handlers, and just thier
entry-points. No-Sweat Item. IF, HOWEVER, the high side of EIP is simply
left there, all is not lost. Then there are schemes to replicate faux IDTs
every 64k, and you can still have more than a meg of code in 32 bit
unprotected Forreal Mode. And with an extra jump to get to the actual
handler code Forreal Mode may still be faster to handle interrupts than
Pmode, thanks in part to the 4-byte intvecs.

Things that aren't issues are the Dbit of the handler code, which can be
USE32 also, and if fact must be, and thus the interrupt and the IRET stack
frames balance. The rmode CS values in the intvecs probably should all be
0, keeping them in the non-issue category. The real sticky bit is the
undefined behavior of the high side of EIP.

Even if you have to do something like keep all code in the low meg, data
beyond the low meg is already a non-issue in Forreal Mode.

Rick Hohensee


