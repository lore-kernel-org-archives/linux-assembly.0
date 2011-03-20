From: Frank Kotler <fbkotler@zytor.com>
Subject: Re: Translating nasm boot strap to as
Date: Sat, 19 Mar 2011 20:42:06 -0400
Message-ID: <4D854D5E.6060402@zytor.com>
References: <4D84C23A.2020504@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4D84C23A.2020504@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Hilst Selli <danielhilst@gmail.com>
Cc: linux-assembly@vger.kernel.org

Daniel Hilst Selli wrote:

> times510-($-$$)  db  0

.org 510

Seems to do the trick?

Best,
Frank


