From: Jan Wagemakers <janw@easynet.be>
Subject: Re: permission problem
Date: Sat, 20 Nov 2004 17:42:05 +0100
Message-ID: <20041120164205.GA15847@qwerty.be>
References: <4b0d6e0d0411200626361bd414@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4b0d6e0d0411200626361bd414@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

joy merwin monteiro <joy.merwin@gmail.com> schreef:

>  wantdd to write something to the parallel port
> "windows style"  but am getting a seg fault on the "out"
> instruction.

Before you can write something to a port you need to get "ioperm". Type
'man ioperm' for more information.

You can find some example-programs that use "ioperm" at
<http://www.janw.easynet.be/eng.html>.

Also, at <http://www.janw.easynet.be/koffie.html>, I have an example-program
that writes to port 0x310. This webpage is in the Dutch language and is
using the at&t-syntax - so maybe a little difficult to read - but hopefully
not to difficult to get the picture ;-)

Also remember to run programs that use ioperm as 'suid-root' (chown root prg
; chmod 4750 prg), or you will stil get a segmentation fault.

Hope this helps you.


-- 
Met vriendelijke groetjes         - Jan Wagemakers -

... RFS: picprog: Microchip PIC serial programmer software (GPL)
    Deb-package is available at <http://www.janw.easynet.be/picprog.html>
