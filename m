From: <kieft_brian@si.com>
Subject: wrong opcode?
Date: Fri, 14 Jun 2002 13:27:06 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <004E42C8.C21188@si.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Description: cc:Mail note part
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org, binutils@sources.redhat.com

I curious as to why the code generated for these two move.w commands is
completely different. In the first assembly I used two variables (one equal to 0
and the other equal to 8). I tried doing a move using the variables added
together as my offset to register A1 and managed to get 33B9 0000 0000 0170 0000
0008. When I simply put an 8 in instead of the variables, I got the correct
code. 3379 0000 0000 0008. Any ideas??????

I'm using gnu as on a pc-cygwin system with a m68k target. 


3901 034a 0000 0008         .DC.L   C_WCP1_MSG_PARM
 3902 034e 0000 0000        .DC.L   HWPN_PARM_OFS
 3903 0352 33B9 0000 MOVE.W SYS_SYS_VERS_W,C_WCP_MSG_PARM+HWPN_PARM_OFS(%A1)
 3903      0000 0170 
 3903      0000 0008 
  
  
 
 3901 034a 0000 0008        .DC.L   C_WCP1_MSG_PARM
 3902 034e 0000 0000        .DC.L   HWPN_PARM_OFS
 3904                       
 3905 0352 3379 0000        MOVE.W  M_SYS_SYS_VERS_W,8(%A1)
 3905      0000 0008 
 3906      




**********************************************************************
This e-mail and any files transmitted with it are confidential and may
be legally privileged or otherwise exempt from disclosure under
applicable law. This e-mail and its files are intended solely for
the individual or entity to whom they are addressed and their content
is the property of Smiths Aerospace.  If you are not the intended
recipient, please do not read, copy, use or disclose this communication.
If you have received this e-mail in error please notify the e-mail 
administrator at postmaster@si.com and then delete this e-mail, its
files and any copies.

This footnote also confirms that this e-mail message has been scanned
for the presence of known computer viruses.
***********************************************************************
