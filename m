From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: hello again :D
Date: Fri, 06 Jan 2006 22:32:46 -0500
Message-ID: <43BF365E.20507@comcast.net>
References: <20060107110622.65f5623a.amerei@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20060107110622.65f5623a.amerei@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Niel A <amerei@gmail.com>
Cc: linux-assembly@vger.kernel.org

Niel A wrote:

Hi Niel,

> section .text

Ricardo is correct - the ".text" section isn't writeable. Nasm knows 
"write" as a possible section property/attribute. A look at the .o file 
will show ".text" as writeable. But when ld gets ahold of it, ld knows 
".text" is supposed to be readonly, and changes it back! So to fool ld:

section code write

... seems to do it. Presumably, there's a reason why code pages are RO - 
be careful with this stuff!

Best,
Frank

