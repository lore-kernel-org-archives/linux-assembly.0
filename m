From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: paddw vs paddb
Date: Wed, 29 Dec 2004 23:40:25 +0100
Message-ID: <41D33259.79A348C4@wp.pl>
References: <20041229121244.27226.qmail@web52908.mail.yahoo.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Ankit Jain wrote:
> 
> hi
> 
> i know about movd but i want to move 16bit atr a time

You can't move a word to a mmx register directly. You have to
simulate it ie. with a temp ored with the destination register:

pxor %mm7,%mm7
xor  %eax,%eax

movw your_word,%ax

movd %eax,%mm7
por  %mm7,%mm0

which moves your_word to the lowest part of mm0 and you have
to be sure that low word of mm0 is zeroed before the operation.
Or you can:

movd %mm0,%eax
movw your_word,%ax
movd %eax,%mm0

etc. but i don't recomend this kind of coding. Keep your words
together and use movq.

-- 
Maciej Hrebien

