From: Rudolf Marek <MAREKR2@cs.felk.cvut.cz>
Subject: Re: calling bios interrupt from kernel
Date: Mon, 24 Nov 2003 23:15:51 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <17342.7809648731$1069712535@news.gmane.org>
References: <3FC22539.7060509@eprocess.fr>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3FC22539.7060509@eprocess.fr>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Marmond <fmarmond@eprocess.fr>
Cc: linux-assembly@vger.kernel.org


Yes its possible but "unclean"

Look for lrmi library.

Or read the FAQ section on http://linuxassembly.org


Regards


Rudolf
 
On Mon, 24 Nov 2003, Frederic Marmond wrote:

> Date: Mon, 24 Nov 2003 16:35:21 +0100
> From: Frederic Marmond <fmarmond@eprocess.fr>
> To: linux-assembly@vger.kernel.org
> Subject: calling bios interrupt from kernel
> 
> I'm working on a graphic card for which I have only a binary driver, 
> without sources.
> 
> I would want to get started by calling the int 0x10 in a vm86 environment.
> Does anybody tried something like this? Is there any way to succeed?
> 
> Any info would be welcome!
> Thanks in advance.
> 
> Fred
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
