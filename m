From: RHYDEMSCS@aol.com
Subject: GCC Register Usage
Date: Wed, 26 Jun 2002 15:45:06 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <4EEA533B.72B7DC09.0257E4BA@aol.com>
Content-Transfer-Encoding: 8bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

I'm calling some assembly code from GCC
and I need to know which registers I'm supposed
to preserve and which can be trashed.
I believe I can trash EAX (function return result),
ECX and EDX, but I want to make sure.
Thanks,
Randy Hyde


