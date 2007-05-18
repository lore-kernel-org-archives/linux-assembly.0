From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 2.6.21.1] i386: save registers before intra-privilege
 syscall
Date: Fri, 18 May 2007 16:08:40 -0700
Message-ID: <464E31F8.7010701@zytor.com>
References: <20070517220638.GA6532@localhost.localdomain> <464CD44A.5000307@zytor.com> <464CE4CA.8000704@uni-greifswald.de> <464CE653.4020006@zytor.com> <464D64B2.6050104@uni-greifswald.de> <464E2B97.9040205@zytor.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <464E2B97.9040205@zytor.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Philipp Kohlbecher <pk031698@uni-greifswald.de>
Cc: Dave Jones <davej@codemonkey.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-assembly@vger.kernel.org

H. Peter Anvin wrote:
> Sticking kernel mode values in those fields would add no value, except
> as a poison (since %ss == KERNEL_DS and would cause a #GP(0) if it ever
> reached IRET.)

#SS(0), rather, of course.

	-hpa
