From: <kieft_brian@si.com>
Subject: GAS - \@ in macros and labels
Date: Wed, 29 May 2002 10:49:36 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <004C6F8A.C21188@si.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Description: cc:Mail note part
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

I'm having a little trouble with specifying labels inside of two different
macros using the \@ variable. See the following...

 .MACRO tableHdr    someArgs
A_\@:
     .DC.W  (B_\@ - A_\@)   
    stuff....

 .ENDM

 .MACRO tableEnd    someArgs
B_\@:
 .ENDM

Unfortunately the number produced by \@ will never be in sync between the two
macros due to the fact that a new macro call will increment the counter (not to
mention that there may be some other macros called in between Hdr and End).

So I attempted to resolve the situation by creating my own variable...

.MACRO  tableHdr    someArgs
.SET    CMD_NUM,\@
A_CMD_NUM:
     .DC.W  (B_CMD_NUM - A_CMD_NUM)     
    stuff....

 .ENDM

 .MACRO tableEnd    someArgs
B_CMD_NUM:
 .ENDM


Unfortunately GAS sees this as literal text and throws a bunch of "symbol
already defined" errors. Any ideas on how to make the CMD_NUM appear as its
value in a label? Thanks,

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
