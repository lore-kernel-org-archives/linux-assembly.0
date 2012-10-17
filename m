From: Fei Yang <yangfei.kernel@gmail.com>
Subject: Re: [RFC PATCH v2] Hardcoded instruction causes cpu-hotplug fail on
 be8 big-endian ARM platfrom
Date: Wed, 17 Oct 2012 20:00:51 +0800
Message-ID: <CAKw8HL3+=4JXTQ+nphM5XjN_yaVUy55fzytGX=83P+P2n=qvnw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hotplug-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:cc:content-type;
        bh=x/TYLpQYQAQrLpEBshIfM65pCBnVaVgAQXCiMwXGkRM=;
        b=khXOwC9xvunKeGaEYvci1UCc2CfDCbXgbErRW7CzQlf/oDwa0HaZisLkY1l+TSz/ty
         Y1QRDwlrL6dQH6cMzszYJWEK4QDZkh1lBYkphNaE7SdaqYD926k4jNdDEvGeQuuZlHsk
         ovgbZx/PXxU64/XUAA9lGL7YFqr103hafNaBv+MbdanVtddOIjJE9b600R3Uo7cCvx2d
         1lK9bMAiu27+u2COQYZcOS78HAWd8e4MnmVv5a9o1cp18E5y1DVg9IjrbLoEDA1N6Eae
         OnisKD9M+uprC2emr3MKLrmAvQZ7AqPxpW5RVrkZUVUmcKHPdfyJAus7oidoKqEX2fgu
         uvnQ==
Sender: linux-hotplug-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Martin <dave.martin@linaro.org>, linux@arm.linux.org.uk, lethal@linux-sh.org, magnus.damm@gmail.com, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org
Cc: Mikael Pettersson <mikpe@it.uu.se>, "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>, linux-hotplug@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yangfei (Felix)" <felix.yang@huawei.com>

<cut>

> Not handling the Thumb case is a definite bug for any file which may
> run on v7, since the kernel could be built in Thumb for that case.
> For example, the existing code is mach-realview/hotplug.c is broken
> when building an SMP Thumb-2 kernel for the Realview PBX-A9.
>
> Cheers
> ---Dave

Thanks for pointing this out. I think we just cannot make any
assumption about the versions of the tools used. Based on this, I have
made a v2 of the patch against linux-3.7-rc1. I am not touching the
CFLAGS in the patch as I am not familiar with the three ARM boards
here.
Can the respective board maintainers
(mach-exynos/mach-realveiw/mach-shmobile) give any comments about v2
of the patch?

Thanks.
---Fei

v2: Define opcode of the ARM "WFI" instruction in the right way.

Signed-off-by: Fei Yang<yangfei.kernel@gmail.com>

diff -urN linux-3.7-rc1/arch/arm/mach-exynos/hotplug.c
linux/arch/arm/mach-exynos/hotplug.c
--- linux-3.7-rc1/arch/arm/mach-exynos/hotplug.c	2012-10-15
05:41:04.000000000 +0800
+++ linux/arch/arm/mach-exynos/hotplug.c	2012-10-17 19:25:49.000000000 +0800
@@ -18,11 +18,17 @@
 #include <asm/cacheflush.h>
 #include <asm/cp15.h>
 #include <asm/smp_plat.h>
+#include <asm/opcodes.h>

 #include <mach/regs-pmu.h>

 #include "common.h"

+/*
+ * Define opcode of the WFI instruction.
+ */
+#define __WFI __inst_arm_thumb16(0xe320f003, 0xbf30)
+
 static inline void cpu_enter_lowpower(void)
 {
 	unsigned int v;
@@ -72,7 +78,7 @@
 		/*
 		 * here's the WFI
 		 */
-		asm(".word	0xe320f003\n"
+		asm(__WFI
 		    :
 		    :
 		    : "memory", "cc");
diff -urN linux-3.7-rc1/arch/arm/mach-realview/hotplug.c
linux/arch/arm/mach-realview/hotplug.c
--- linux-3.7-rc1/arch/arm/mach-realview/hotplug.c	2012-10-15
05:41:04.000000000 +0800
+++ linux/arch/arm/mach-realview/hotplug.c	2012-10-17 19:25:20.000000000 +0800
@@ -15,6 +15,12 @@
 #include <asm/cacheflush.h>
 #include <asm/cp15.h>
 #include <asm/smp_plat.h>
+#include <asm/opcodes.h>
+
+/*
+ * Define opcode of the WFI instruction.
+ */
+#define __WFI __inst_arm_thumb16(0xe320f003, 0xbf30)

 static inline void cpu_enter_lowpower(void)
 {
@@ -64,7 +70,7 @@
 		/*
 		 * here's the WFI
 		 */
-		asm(".word	0xe320f003\n"
+		asm(__WFI
 		    :
 		    :
 		    : "memory", "cc");
diff -urN linux-3.7-rc1/arch/arm/mach-shmobile/hotplug.c
linux/arch/arm/mach-shmobile/hotplug.c
--- linux-3.7-rc1/arch/arm/mach-shmobile/hotplug.c	2012-10-15
05:41:04.000000000 +0800
+++ linux/arch/arm/mach-shmobile/hotplug.c	2012-10-17 19:25:34.000000000 +0800
@@ -20,6 +20,12 @@
 #include <mach/emev2.h>
 #include <asm/cacheflush.h>
 #include <asm/mach-types.h>
+#include <asm/opcodes.h>
+
+/*
+ * Define opcode of the WFI instruction.
+ */
+#define __WFI __inst_arm_thumb16(0xe320f003, 0xbf30)

 static cpumask_t dead_cpus;

@@ -39,7 +45,7 @@
 		/*
 		 * here's the WFI
 		 */
-		asm(".word	0xe320f003\n"
+		asm(__WFI
 		    :
 		    :
 		    : "memory", "cc");
