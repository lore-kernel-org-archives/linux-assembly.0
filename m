From: dAvId KeDrOsKy <davidkedrosky@rogers.com>
Subject: Newbie Question
Date: Thu, 27 Feb 2003 17:57:42 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200302271757.42990.davidkedrosky@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Assembly Programming List <linux-assembly@vger.kernel.org>

The following program gives me a seg fault.  But I don't understand why.

1.	mov	ebx, dword 1234
2.	mov	ax, [ebx]

To me the code would mean 1) move the integer 1234 into ebx and then 2) move 
the value of ebx into ax.  But of course my reasoning is incorrect.

Feedback would be great.

Dave
