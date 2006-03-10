From: glburt@comcast.net
Subject: argc/argv
Date: Fri, 10 Mar 2006 04:00:33 +0000
Message-ID: <031020060400.159.4410F9E10006CADE0000009F22007613949B9D9A0D0409@comcast.net>
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

I am trying to build a system that needs to pick up the command line arguments.  However, it seems there are two ways to do it.

The old way is that argc and argv elements are on the stack.

Using gcc 3.4.3, the argc is edi and the pointer for argv is in esi, according to the times that I have tried it.  

Is this correct????

Gary Burt
