From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: gas jump
Date: Sun, 31 Aug 2003 11:55:23 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F51C60B.F6ED8DD6@wp.pl>
References: <Pine.A41.4.20.0308310041440.93300-100000@delfin.unideb.hu> <3F51C230.D94AF7EC@wp.pl>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Maciej Hrebien wrote:
> 
> Fekete Gabor wrote:
> >
> > hi
> >
> > i want to make a relative jump.
> > i tried it with "jmp 0x09" and expected it to
> > jump to the address that comes 9 bytes after
> > this "jmp".
> > is it correct?
> 
> Nope. Try jmp .+9 as Robert Plantz suggested in his post dated
> 02.02.2003 ("." means current address that gas is assembling into so ie.
> l: .long . gives you l with its own address stored into) or hard code it
> as .byte 0xeb, 0x09 (0xeb is jmp rel8). Isn't it better to just label if
> your code isn't the fixed one? ;)

I missed something, 9 bytes AFTER, so +2 because jmp rel8 encodes with 2
bytes. Sorry!

-- 
Maciej Hrebien

