From: Mikael Pettersson <mikpe@it.uu.se>
Subject: Re: Hardcoded instruction causes certain features to fail on ARM
 platfrom due to endianness
Date: Mon, 15 Oct 2012 09:28:15 +0200
Message-ID: <20603.47887.262025.941051@pilspetsen.it.uu.se>
References: <DA41BE1DDCA941489001C7FBD7A8820E3CB407A4@szxeml549-mbx.china.huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DA41BE1DDCA941489001C7FBD7A8820E3CB407A4@szxeml549-mbx.china.huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Yangfei (Felix)" <felix.yang@huawei.com>
Cc: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Yangfei (Felix) writes:
 > Hi all,
 > 
 >     I found that hardcoded instruction in inline asm can cause certains certain features fail to work on ARM platform due to endianness.
 >     As an example, consider the following code snippet of platform_do_lowpower function from arch/arm/mach-realview/hotplug.c:
 >                 / *
 >                  * here's the WFI
 >                  */
 >                 asm(".word      0xe320f003\n"
 >                     :
 >                     :
 >                     : "memory", "cc");
 > 
 >     The instruction generated from this inline asm will not work on big-endian ARM platform, such as ARM BE-8 format. Instead, an exception will be generated.
 > 
 >     Here the code should be:
 >                 / *
 >                  * here's the WFI
 >                  */
 >                 asm("WFI\n"
 >                     :
 >                     :
 >                     : "memory", "cc");
 > 
 >     Seems the kernel doesn't support ARM BE-8 well. I don't know why this problem happens.
 >     Can anyone tell me who owns this part? I can prepare a patch then. 
 >     Thanks.

Questions regarding the ARM kernel should go to the linux-arm-kernel mailing list
(see the MAINTAINERS file), with an optional cc: to the regular LKML.

BE-8 is, if I recall correctly, ARMv7's broken format where code and data have
different endianess.  GAS supports an ".inst" directive which is like ".word"
except the data is assumed to be code.  This matters for disassembly, and may
also be required for BE-8.

That is, just s/.word/.inst/g above and report back if that works or not.
