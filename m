From: mikeos@inbox.ru
Subject: Re: Bin and other short question
Date: Tue, 12 Sep 2006 00:06:16 +0400
Message-ID: <20060911200616.GA4401@arch>
References: <20060911193726.1821.qmail@web50309.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060911193726.1821.qmail@web50309.mail.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

On Mon, Sep 11, 2006 at 12:37:26PM -0700, Henio Paszczak wrote:
> Hi.
> I wont to create bin file with using gas haw can i do
> it. 
> ( fir example in nasm its enough to compile with -f
> bin
> nasm -f bin -o * *.asm )
> 
> Scund question is about closing and opening sections.
> If forexample i want to change some thing in section i
> have to create it with "w" index ... is it posible to
> change this state inside section ? for example wfter
> writing what i want to change i wont to close it ...
> just for case ( interupt 125 do something like this ,
> when i used it in .text section it didn'y made any
> changes i mean if i try to write sometning iside i
> recived segmentation error)
> 
> Lukas

You can create bin file such way:

as -o test.o test.s
ld --oformat binary --omagic -Ttext 0x0 -o test test.o

Where option -Ttext sets start of text section,
for other linker's options - man ld

