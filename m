From: Steffen Solyga <solyga@absinth.net>
Subject: some thoughts and questions
Date: Sat, 24 Apr 2004 02:58:58 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20040424005858.GA1194@absinth.net>
References: <20040422231507.GA1495@absinth.net> <4089974B.1080604@earthlink.net>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4089974B.1080604@earthlink.net>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux assembly <linux-assembly@vger.kernel.org>

glad to see that i'm not alone with my subscription
and my questions to come :-)
Did somebody of you guys already try writing a boot loader?
Not that i intend to write one...
I'm quite new to x86 assembly; spent a lot of time programming
the 6502/6510, turbo-stuff for the c64-floppy, but thats that
long ago, about 15 years. When the PC came up I hated its
design, because there was no need to have the cuircuit-drawing
next to my box, no fixed addresses and so on. However, the games
got me and I bought by first PC (386). And some years later I
learned to love the UNIX boxes at the university... Well, that
was just a short jump to Linux -- as users.
Now, object oriented programming isn't exiting, let's try the
opposite again. It's not just the result (working program) that
counts, but the fun shifting bits, exploring the architecture.

How do you feel about these tons of opcodes shipped with the x86
processors? Is it fun to know them all? Or is it just a waste
of time to learn about block-move-instructions? (As far as I
remember, the 8080 already had a block instruction -- I didn't
believe it those days! Was'n there a loop?)

By the way, if somebody of should have the guts to teach me
something, i would be happy having my first assembly lines
commented http://linux.xulin.de/asm/cmdline/cmdline.asm
Meaning, "xor eax, eax" looks more interesting than "mov eax, 0",
and I think there are a lot of x86-ideas I have to learn...
The 6502 only had two flags usable for branching (zero+carry),
and now I have two more (sign+parity) - how do I really make
use of them?

Thanks a lot,
Steffen

-- 
----------------------------
Steffen Solyga
mail: solyga@absinth.net
www : http://linux.xulin.de/
----------------------------
