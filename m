From: Vadiraj C S <vadiraj@mail.cyberneme.com>
Subject: stack contents at function call
Date: Mon, 1 Mar 2004 13:18:24 +0530
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20040301131824.02c597f0.vadiraj@mail.cyberneme.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org


  Hello Assembly Gurus

   I'm working on Assembly programming under linux from few days, here are some issues

 1.When a function call is made the parameters are pushed on to the stack and a a call
to the function is made. 

 Now the top of the stack is the return address, Please correct me if I'm wrong here,
and the parameters above it is the first parameter sent and so on..

 1. Is this OS dependent, or compiler dependent? 
 2. Does this sequence change when call from C language and call from assembly.

Cos I noticed difference with gcc(GNU compiler) and icc (Intell compiler)


 Help is needed urgent, 

Thanks in advance...



-- 

With Best Regards
 Vadiraj C S    

