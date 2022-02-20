From: Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v3] hwmon: (dell-smm) Improve assembly code
Date: Sun, 20 Feb 2022 17:25:01 +0100
Message-ID: <20220220162501.13591-1-W_Armin@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hwmon-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645374311;
        bh=BfygSnNwPAsAKQCAw5L3JdsdO7mVJKJ8bDLaDqAzUrA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=jhXEhKTAGfZ0I7cNJxZJ2P/QrnsTw78fF5fvO2CqWCnngzAnCim4irlBjyBkHumYO
         3acpO1GBeYyrrgpjQXxW0LpKS4b9DUb5eIccEYgMR8CIcHHKmDhUB4udzKY+yvoYDE
         lEcOAvJshuiaBiur04jcaCvHWgY0oIF7hc96xOhA=
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pali@kernel.org
Cc: jdelvare@suse.com, linux@roeck-us.net, David.Laight@ACULAB.COM, linux-hwmon@vger.kernel.org, linux-assembly@vger.kernel.org, linux-kernel@vger.kernel.org

The new assembly code works on both 32 bit and 64 bit
cpus and allows for more compiler optimisations by not
requiring smm_regs to be packed. Since clang runs out
of registers on 32 bit x86 when using CC_OUT, we need
to execute "setc" ourself.
Also modify the debug message so we can still see
the result (eax) when the carry flag was set.

Tested with 32 bit and 64 bit kernels on a Dell Inspiron 3505.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
Changes in v3:
- make carry an unsigned char
- use "+a", ... for output registers
- drop "cc" from clobbered list

Changes in v2:
- fix clang running out of registers on 32 bit x86
- modify debug message
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 78 ++++++++--------------------------
 1 file changed, 18 insertions(+), 60 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index c5939e68586d..38d23a8e83f2 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -119,7 +119,7 @@ struct smm_regs {
 	unsigned int edx;
 	unsigned int esi;
 	unsigned int edi;
-} __packed;
+};

 static const char * const temp_labels[] =3D {
 	"CPU",
@@ -164,74 +164,32 @@ static int i8k_smm_func(void *par)
 	struct smm_regs *regs =3D par;
 	int eax =3D regs->eax;
 	int ebx =3D regs->ebx;
+	unsigned char carry;
 	long long duration;
-	int rc;

 	/* SMM requires CPU 0 */
 	if (smp_processor_id() !=3D 0)
 		return -EBUSY;

-#if defined(CONFIG_X86_64)
-	asm volatile("pushq %%rax\n\t"
-		"movl 0(%%rax),%%edx\n\t"
-		"pushq %%rdx\n\t"
-		"movl 4(%%rax),%%ebx\n\t"
-		"movl 8(%%rax),%%ecx\n\t"
-		"movl 12(%%rax),%%edx\n\t"
-		"movl 16(%%rax),%%esi\n\t"
-		"movl 20(%%rax),%%edi\n\t"
-		"popq %%rax\n\t"
-		"out %%al,$0xb2\n\t"
-		"out %%al,$0x84\n\t"
-		"xchgq %%rax,(%%rsp)\n\t"
-		"movl %%ebx,4(%%rax)\n\t"
-		"movl %%ecx,8(%%rax)\n\t"
-		"movl %%edx,12(%%rax)\n\t"
-		"movl %%esi,16(%%rax)\n\t"
-		"movl %%edi,20(%%rax)\n\t"
-		"popq %%rdx\n\t"
-		"movl %%edx,0(%%rax)\n\t"
-		"pushfq\n\t"
-		"popq %%rax\n\t"
-		"andl $1,%%eax\n"
-		: "=3Da"(rc)
-		:    "a"(regs)
-		:    "%ebx", "%ecx", "%edx", "%esi", "%edi", "memory");
-#else
-	asm volatile("pushl %%eax\n\t"
-	    "movl 0(%%eax),%%edx\n\t"
-	    "push %%edx\n\t"
-	    "movl 4(%%eax),%%ebx\n\t"
-	    "movl 8(%%eax),%%ecx\n\t"
-	    "movl 12(%%eax),%%edx\n\t"
-	    "movl 16(%%eax),%%esi\n\t"
-	    "movl 20(%%eax),%%edi\n\t"
-	    "popl %%eax\n\t"
-	    "out %%al,$0xb2\n\t"
-	    "out %%al,$0x84\n\t"
-	    "xchgl %%eax,(%%esp)\n\t"
-	    "movl %%ebx,4(%%eax)\n\t"
-	    "movl %%ecx,8(%%eax)\n\t"
-	    "movl %%edx,12(%%eax)\n\t"
-	    "movl %%esi,16(%%eax)\n\t"
-	    "movl %%edi,20(%%eax)\n\t"
-	    "popl %%edx\n\t"
-	    "movl %%edx,0(%%eax)\n\t"
-	    "lahf\n\t"
-	    "shrl $8,%%eax\n\t"
-	    "andl $1,%%eax\n"
-	    : "=3Da"(rc)
-	    :    "a"(regs)
-	    :    "%ebx", "%ecx", "%edx", "%esi", "%edi", "memory");
-#endif
-	if (rc !=3D 0 || (regs->eax & 0xffff) =3D=3D 0xffff || regs->eax =3D=3D =
eax)
-		rc =3D -EINVAL;
+	asm volatile("out %%al,$0xb2\n\t"
+		     "out %%al,$0x84\n\t"
+		     "setc %0\n"
+		     : "=3Dmr" (carry),
+		       "+a" (regs->eax),
+		       "+b" (regs->ebx),
+		       "+c" (regs->ecx),
+		       "+d" (regs->edx),
+		       "+S" (regs->esi),
+		       "+D" (regs->edi));

 	duration =3D ktime_us_delta(ktime_get(), calltime);
-	pr_debug("smm(0x%.4x 0x%.4x) =3D 0x%.4x  (took %7lld usecs)\n", eax, ebx=
,
-		 (rc ? 0xffff : regs->eax & 0xffff), duration);
+	pr_debug("smm(0x%.4x 0x%.4x) =3D 0x%.4x carry: %d (took %7lld usecs)\n",
+		 eax, ebx, regs->eax & 0xffff, carry, duration);

-	return rc;
+	if (carry || (regs->eax & 0xffff) =3D=3D 0xffff || regs->eax =3D=3D eax)
+		return -EINVAL;
+
+	return 0;
 }

 /*
=2D-
2.30.2

