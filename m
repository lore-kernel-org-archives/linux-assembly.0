From: jeff <jko@save-net.com>
Subject: Assembler Tools
Date: Mon, 15 Sep 2003 07:30:23 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200309150730.23968.jko@save-net.com>
References: <200309110801.37516.rafael.diniz@ic.unicamp.br> <200309111414.47716.wklux@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200309111414.47716.wklux@yahoo.co.uk>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly-admin@mlists.in-berlin.de, linux-assembly@vger.kernel.org

For the last year I've been struggling with
asm development tools and have put together
a combination that works.  Next, the plan is
to continue porting the DOS alib to Linux or
build a filemanger to complete the Assembler
tool package.

Anyway, is anyone interested in looking at
this?  It does symbolic debugging and
includes a editor with some syntax highlighting.
Basically, one can debug using the source
file and set breakpoints with mouse clicks.

The editor is written in assembler and can
be used as a base to create other editors.
Everything is table driven and it has commands
for simple windowing, macros, paragaphing,
user extensions, calculator, etc.

jeff

