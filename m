From: Frank Kotler <fbkotler@verizon.net>
Subject: Re: Disassemble in GDB
Date: Sun, 01 Jun 2008 10:32:22 -0400
Message-ID: <4842B2F6.7000702@verizon.net>
References: <g1tke5$cnh$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <g1tke5$cnh$1@ger.gmane.org>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bill <bill.clinton@fredastaire.ch>
Cc: linux-assembly@vger.kernel.org

Bill wrote:
> I wrote a simple hello world in c. how can i disassemble main() with
> gdb?

"disassemble main"

Use the "-g" switch when you compile it. (note the effect of the "-O" 
switch, while you're at it)

Best,
Frank


