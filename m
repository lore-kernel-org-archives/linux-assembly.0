From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: gcc gas errors and vim
Date: Sat, 9 Nov 2002 17:46:20 -0800 (PST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <15821.47724.673551.682792@eidolon.muppetlabs.com>
References: <3DCDB1F7.8070007@ipeg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3DCDB1F7.8070007@ipeg.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> gcc    -c -o main.o main.S
> /tmp/ccXhsmV7.s: Assembler messages:
> /tmp/ccXhsmV7.s:22: Error: suffix or operands invalid for `mul'
> gmake: *** [main.o] Error 1

gcc understands a .S file to mean that the assembly program should be
preprocessed first, so it stores the preprocessed output to a
temporary file, with a .s suffix. Run your .S file through the
preprocessor alone to check what's on line 22. (If you don't want your
assembly file preprocessed then change the suffix to .s.)

b
