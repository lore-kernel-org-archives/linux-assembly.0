From: Corey Holcomb-Hockin <crsntlvs@ipeg.com>
Subject: C structures and gas
Date: Mon, 11 Nov 2002 16:43:05 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3DD04E99.5080704@ipeg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

What is the best way to access C structures with gas assembly?  I 
haven't gotten any good ideas from looking at assembly generated from C 
code.  It looks like it keeps track of offsets and the size of 
structures on its own.  I would have a hard time keeping track of 
offsets and changing them if the structure changed.

Corey Holcomb-Hockin

