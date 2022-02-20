From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH v2] hwmon: (dell-smm) Improve assembly code
Date: Sun, 20 Feb 2022 18:48:58 +0000
Message-ID: <6f4c21b5e1cb4fa38a5e0c1716658329@AcuMS.aculab.com>
References: <20220219211011.16600-1-W_Armin@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hwmon-owner@vger.kernel.org>
In-Reply-To: <20220219211011.16600-1-W_Armin@gmx.de>
Content-Language: en-US
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Armin Wolf' <W_Armin@gmx.de>, "pali@kernel.org" <pali@kernel.org>
Cc: "jdelvare@suse.com" <jdelvare@suse.com>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

From: Armin Wolf
> Sent: 19 February 2022 21:10
> 
> The new assembly code works on both 32 bit and 64 bit
> cpus and allows for more compiler optimisations by not
> requiring smm_regs to be packed

I'm intrigued about the __packed..

Prior to 5.17-rc1 __packed was only applied to the fields after 'eax'.
This actually has no effect (on any architecture) because there is
no padding to remove - so all the later fields are still assumed to
be 32bit aligned.

5.17-rc1 (565210c781201) moved the __packed to the end of the
structure.
AFAICT this structure is only ever used in one file and for on-stack
items. It will always actually be aligned and is only read by the
code in the file - so why was it ever marked __packed at all!
On x86 it would make no difference anyway.

I can only guess it was to ensure that the asm code didn't go
'wrong' because of the compiler adding 'random' padding.
That isn't what __packed is for at all.
The linux kernel requires that the compiler doesn't add 'random'
padding - even if the C standard might allow it.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

