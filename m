From: Stephan Walter <stephan.walter@gmx.ch>
Subject: Re: asmutils 0.17
Date: Sat, 17 Aug 2002 18:10:20 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020817181020.28d3a051.stephan.walter@gmx.ch>
References: <Pine.LNX.4.43L.0208171734360.1025-100000@alpha.linuxassembly.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.43L.0208171734360.1025-100000@alpha.linuxassembly.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Konstantin Boldyshev <konst@linuxassembly.org>
Cc: linux-assembly@vger.kernel.org

Hi Konstantin

truss.asm should be updated. As a label of a "dd" statement it uses
"pause", which is a reserved word in NASM 0.98.33 (and possibly in all
the 0.98.xx versions).

The file MCONFIG or the Makefile respectively should be changed to allow
compiling with NASM 0.98.33 (and higher) as well.

Regards,
Stephan
