From: "A D" <a_d_249@hotmail.com>
Subject: Segmented or Flat model
Date: Wed, 23 May 2007 18:56:31 -0400
Message-ID: <BAY133-F19ABEF1EEAD079FAD786D8F5350@phx.gbl>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org


I need clarification to a particular gnu assembly question. When i write a 
code:

.section .data
output:
   .int 1

.section .text
.globl _start
_start:
   movl $output, %ebx
   ....


here what type of memory model is used for movl statement(flat or 
segmented)?
Also how does movl knows which logical address to use? I mean how do 
variables
get their logical address?

Thanks.

_________________________________________________________________
Fight Allergies With Live Search 
http://search.live.com/results.aspx?q=Remedies+For+Spring+Allergies&mkt=en-ca&FORM=SERNEP

