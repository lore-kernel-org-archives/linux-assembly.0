From: Konstantin Boldyshev <konst@linuxassembly.org>
Subject: Re: asmutils 0.17
Date: Sun, 18 Aug 2002 18:53:45 +0400 (MSD)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.43L.0208181505381.1622-100000@alpha.linuxassembly.org>
References: <20020817181020.28d3a051.stephan.walter@gmx.ch>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20020817181020.28d3a051.stephan.walter@gmx.ch>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephan Walter <stephan.walter@gmx.ch>
Cc: linux-assembly@vger.kernel.org

On Sat, 17 Aug 2002, Stephan Walter wrote:

> truss.asm should be updated. As a label of a "dd" statement it uses
> "pause", which is a reserved word in NASM 0.98.33 (and possibly in all
> the 0.98.xx versions).

Yes, I will update it, but not because of nasm.
It introduces quite an issue with LIBC build.

> The file MCONFIG or the Makefile respectively should be changed
> to allow compiling with NASM 0.98.33 (and higher) as well.

Sorry, for now I do not plan to support any nasm versions
other than clean 0.98, I am tired of problems that they cause.

-- 
Regards,
Konstantin

