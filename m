From: <kieft_brian@si.com>
Subject: non-constant in current section subtraction???
Date: Fri, 26 Apr 2002 11:13:56 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <004920AF.C21188@si.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Description: cc:Mail note part
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

I'm having some trouble with the GNU assembler and the special '.' symbol. The
following code is an example:


LABEL1:
   some stuff
   more stuff

   VAR1 = . - LABEL1
   .IF (VAR1)
     do something

   .ENDIF

The dot symbol should give me the current location in memory, which is a
non-constant. However, the difference between the . and label1 (assuming they're
in the same section) is a constant. Why do I get a "non-constant expression in
if statement" error when I try to do this. I've tried working the assembler
source code a bit and making X_op = O_constant when you do the subtraction, but
that seems to screw things up and give everything a value of 0. Without the
hack, I get the right values, but they're just not constant. Has anyone ran into
this before? I'd appreciate any help I can get. Thanks,

Brian


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
