From: Scott Sibley <sisibley@gmail.com>
Subject: Troubles with JIT compiler
Date: Thu, 21 Jan 2010 22:12:41 -0600
Message-ID: <cb4d391b1001212012l654d2a93qe8d05187f8f5ecf0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=KGHLdQiLxwomx3zuHsCMSI9DA4lm2hWCVHbYOWDNlH4=;
        b=GKmrZCkMfLKB51oUyn8SboK+1/+Gpclf6umf+gSBvJlatRiTjeqQYJa6B/wwukWgAj
         8qzSKtzLPZ8pzwncbi+GhadFN+bF9+lDFQQ6aWyKBl08wFoRZiVkI+uut5fv7WxmRA/+
         YSmkKIIL3bH9RRaE8pgL9CM8jz2QZZ6mc3+hc=
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-assembly@vger.kernel.org

I'm debugging a script engine. The engine compiles expressions into
asm instructions, assigns that data to a function pointer, and
executes the function, passing one argument.

I'm new to assembly, and pretty much stuck on the first issue I ran int=
o.

Here are the function's instructions for a basic assignment operation:

0x8067990:=A0=A0=A0 push=A0=A0 %ebp
0x8067991:=A0=A0=A0 mov=A0=A0=A0 %esp,%ebp
0x8067993:=A0=A0=A0 sub=A0=A0=A0 $0x8,%esp
0x8067999:=A0=A0=A0 fnstcw (%esp)
0x806799c:=A0=A0=A0 mov=A0=A0=A0 (%esp),%eax
0x806799f:=A0=A0=A0 or=A0=A0=A0=A0 $0xc00,%eax
0x80679a4:=A0=A0=A0 mov=A0=A0=A0 %eax,0x4(%esp)
0x80679a8:=A0=A0=A0 fldcw=A0 0x4(%esp)
0x80679ac:=A0=A0=A0 flds=A0=A0 0x806793c
0x80679b2:=A0=A0=A0 fsts=A0=A0 0x805f014
0x80679b8:=A0=A0=A0 fstps=A0 0x8067954
0x80679be:=A0=A0=A0 fldcw=A0 (%esp)
0x80679c1:=A0=A0=A0 add=A0=A0=A0 $0x8,%esp
0x80679c7:=A0=A0=A0 emms
0x80679c9:=A0=A0=A0 leave
0x80679ca:=A0=A0=A0 ret

Well, it appears to be crashing at the first instruction. Here are the
values of ebp and esp.

(gdb) x/x $ebp
0xbffff168:=A0=A0=A0 0xbffff188
(gdb) x/x $esp
0xbffff14c:=A0=A0=A0 0x0804e481

Any clue why this would cause problems? Let me know if I need to
provide more info.
--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
