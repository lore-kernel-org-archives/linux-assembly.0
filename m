From: =?iso-8859-1?Q?=A3ukasz?= <blurrpp@yahoo.com>
Subject: Passing parameters to assembler functions in 'C' 64 style.
Date: Thu, 4 Dec 2008 12:20:45 -0800 (PST)
Message-ID: <5360.11799.qm@web50303.mail.re2.yahoo.com>
Reply-To: blurrpp@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi. 
I started to write assembler functions for C on 64-bit arch. On 32-bit arch. every parameters ware put on stack, now is different, what can be easyly seen reading source program. For example if im passing one  
(int *) parameter, adress (&int) is kept in %rdi register, and so one if u are passing more parameters. Ofcurse is not dificult to use it if u know but is there any key according to which parameters are stored?. I've made some "experiments" with different numbers and kind parameters, but the "key" must be described somewhere.

Luke


      
