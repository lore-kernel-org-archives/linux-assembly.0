From: Urs Thuermann <urs@isnogud.escape.de>
Subject: How to force GAS/x86 to use short offsets
Date: 09 Oct 2008 02:20:32 +0200
Message-ID: <ygf8wsy7h67.fsf@janus.isnogud.escape.de>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

When using indirect addressing with an offset, there are several
opcodes for byte and dword offsets.  When I specify the offset
directly GAS uses the short opcode with a one byte offset if possible
but not when the offset is the result of a calculation.  Here is an
example:

$ as -adnl foo.s
   1                    OFFSET  =       end - string
   2              
   3                            .text
   4 0000 8D4604                lea     4(%esi), %eax
   5 0003 8D860400              lea     OFFSET(%esi), %eax
   5      0000
   6              
   7                            .data
   8 0000 61626300      string: .string "abc"
   9                    end:

When changing the order so that the two labels are known earlier, GAS
uses the short form:

$ as -adnl foo.s
   1                            .data
   2 0000 61626300      string: .string "abc"
   3                    end:
   4              
   5                    OFFSET  =       end - string
   6              
   7                            .text
   8 0000 8D4604                lea     4(%esi), %eax
   9 0003 8D4604                lea     OFFSET(%esi), %eax

My question is, is there a way to force GAS to use the short opcode
even when the offset is calculated and not yet known to be small
enough?


urs
