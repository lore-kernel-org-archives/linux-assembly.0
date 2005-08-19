From: Rene Dudfield <renesd@gmail.com>
Subject: asmutils httpd using sendfile and clone.
Date: Fri, 19 Aug 2005 18:29:23 +1000
Message-ID: <64ddb72c050819012920c1d966@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hey,

I've made some changes to the httpd in asmutils to use sendfile and
clone on linux.

http://www.madecollective.com/~rene/httpd_sendfile.asm

It uses up even less memory, and resources now.  It's a very fast/low
resource static file httpd :)  I'm still planing on making lots of
improvements to it.  Just as fun mainly.


Cheers.
