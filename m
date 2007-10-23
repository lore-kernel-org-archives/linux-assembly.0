From: Lope De Vega <lope.vega@yahoo.com>
Subject: what is faster offsets or pointers?
Date: Tue, 23 Oct 2007 08:05:58 -0700 (PDT)
Message-ID: <924619.21958.qm@web45503.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hello,

If having a memory block (a contigous region) so it
can also be treated as a vector, what would be faster?

  * accesing parts of such a region through
scale/base/index (offsets)

  * by using pointers.

My bet is that offsets perform better.

Regards,



__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

