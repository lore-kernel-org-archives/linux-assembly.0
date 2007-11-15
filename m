From: Liam <oasisbhrnw99@yahoo.com>
Subject: Help finding ARGC
Date: Wed, 14 Nov 2007 21:01:12 -0800 (PST)
Message-ID: <320520.11054.qm@web45102.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi all,

I was reading about ARGC and that it holds how many
arguments were given on the command line when the
program was executed.

My question is, where is it on the stack?

If I do:

movl %esp, %ebp

at the beginning of the program, how can I get to the
ARGC value?




      ____________________________________________________________________________________
Be a better sports nut!  Let your teams follow you 
with Yahoo Mobile. Try it now.  http://mobile.yahoo.com/sports;_ylt=At9_qDKvtAbMuh1G1SQtBI7ntAcJ
