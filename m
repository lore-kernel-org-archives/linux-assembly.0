From: Ewald Wasscher <ewald.wasscher@pobox.com>
Subject: Re: Problem building httpd
Date: Sat, 31 Aug 2002 10:42:43 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <1030783363.5588.2.camel@freyr.localnet>
References: <Pine.LNX.4.43L.0208180810220.1047-100000@alpha.linuxassembly.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.43L.0208180810220.1047-100000@alpha.linuxassembly.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Konstantin Boldyshev <konst@linuxassembly.org>
Cc: linux-assembly@vger.kernel.org

On Sun, 2002-08-18 at 06:11, Konstantin Boldyshev wrote:
> On Sat, 17 Aug 2002, Ewald Wasscher wrote:
> 
> > I just anxiosly tried to build httpd from the new 0.17 release with cgi
> > support enabled. Unfortunately it fails:
> >
> > bash-2.05a$ make httpd
> > nasm -w+orphan-labels -w+macro-params -i../inc/ -f bin -D__LINUX__
> > -D__KERNEL__=24 -D__SYSCALL__=__S_KERNEL__ -D__OPTIMIZE__=__O_SIZE__
> > -D__ELF__ -D__ELF_MACROS__ httpd.asm
> > httpd.asm:282: short jump is out of range
> > make: *** [httpd] Error 1
> >
> > As I know next to nothing about assembler I wonder how one should fix
> > that (replace jb with jmp?)
> 
> Replace 'jb' with 'jb near'.
> This will be fixed in the next release.
> 

With nasm 0.98.34 it builds fine though.

Greetings,

Ewald


