From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: SIMD question
Date: Wed, 22 Feb 2006 19:20:20 +0100
Message-ID: <43FCAB64.5090406@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Hello everybody!

I have quite big commercial software and the producer tells me that they 
did heavy SIMD optimisations to get maximum speed in solving a given 
problem. Of course i don't have the source code but the soft runs in 
GNU/Linux enviroment (x86 architecture).

I did some experiments on smaller problems and i suspect that this 
procuder's SIMD optimisations is a one big lie - the code can run much 
faster. There are some SIMD instructions when i disassemble this 
~250-meg binaries but analysing it is a quite frustrating job.

My question is: is there a way (without touching the kernel as yet) to 
trace in a given period of time the CPU so that i will be noticed when 
SIMD instructions are being executed? Or maybe setting debugging traps 
in all SIMD occuring places is the only way?

PS Thanks to Konstantin we have new asmutils :) Feel free, you - the 
reader of this message, to improve my parts of code which were written 
many many days ago so even beautifullization is warmly welcome ;)

Best regards,
Maciek
