From: "Yangfei (Felix)" <felix.yang@huawei.com>
Subject: Hardcoded instruction causes certain features to fail on ARM
 platfrom due to endianness
Date: Mon, 15 Oct 2012 03:46:47 +0000
Message-ID: <DA41BE1DDCA941489001C7FBD7A8820E3CB407A4@szxeml549-mbx.china.huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: zh-CN
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
To: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi all,

    I found that hardcoded instruction in inline asm can cause certains certain features fail to work on ARM platform due to endianness.
    As an example, consider the following code snippet of platform_do_lowpower function from arch/arm/mach-realview/hotplug.c:
                / *
                 * here's the WFI
                 */
                asm(".word      0xe320f003\n"
                    :
                    :
                    : "memory", "cc");

    The instruction generated from this inline asm will not work on big-endian ARM platform, such as ARM BE-8 format. Instead, an exception will be generated.

    Here the code should be:
                / *
                 * here's the WFI
                 */
                asm("WFI\n"
                    :
                    :
                    : "memory", "cc");

    Seems the kernel doesn't support ARM BE-8 well. I don't know why this problem happens.
    Can anyone tell me who owns this part? I can prepare a patch then. 
    Thanks.
