From: Konstantin Boldyshev <konst@linuxassembly.org>
Subject: Re: Problem building httpd
Date: Sun, 18 Aug 2002 08:11:23 +0400 (MSD)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.43L.0208180810220.1047-100000@alpha.linuxassembly.org>
References: <3D5E7E4C.1080303@pobox.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3D5E7E4C.1080303@pobox.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

On Sat, 17 Aug 2002, Ewald Wasscher wrote:

> I just anxiosly tried to build httpd from the new 0.17 release with cgi
> support enabled. Unfortunately it fails:
>
> bash-2.05a$ make httpd
> nasm -w+orphan-labels -w+macro-params -i../inc/ -f bin -D__LINUX__
> -D__KERNEL__=24 -D__SYSCALL__=__S_KERNEL__ -D__OPTIMIZE__=__O_SIZE__
> -D__ELF__ -D__ELF_MACROS__ httpd.asm
> httpd.asm:282: short jump is out of range
> make: *** [httpd] Error 1
>
> As I know next to nothing about assembler I wonder how one should fix
> that (replace jb with jmp?)

Replace 'jb' with 'jb near'.
This will be fixed in the next release.

-- 
Regards,
Konstantin

