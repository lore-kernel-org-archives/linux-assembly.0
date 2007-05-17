From: Philipp Kohlbecher <pk031698@uni-greifswald.de>
Subject: [PATCH 2.6.21.1] i386: save registers before intra-privilege syscall
Date: Fri, 18 May 2007 00:06:38 +0200
Message-ID: <20070517220638.GA6532@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Dave Jones <davej@codemonkey.org.uk>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-assembly@vger.kernel.org

=46rom: Philipp Kohlbecher <pk031698@uni-greifswald.de>

The kernel_execve function issues a software interrupt (int 0x80) to ma=
ke
a system call to sys_execve. This function expects to find the stack se=
gment
and stack pointer of the function that issued the system call in the pt=
_regs
struct. The syscall entry code that sets up this struct expects the sta=
ck
segment and the stack pointer of the issuing function already on the st=
ack.
But the Intel processor saves these registers only if a stack-switch oc=
curs,
i.e. for inter-privilege interrupts and exceptions (cf. Intel Software
Developer=E2=80=99s Manual, Vol. 3A, p. 5-17,
http://www.intel.com/design/processor/manuals/253668.pdf).
=46or an intra-privilege interrupt like the one issued in kernel_execve=
, these
registers must be saved manually.

Signed-off-by: Philipp Kohlbecher <pk031698@uni-greifswald.de>

---

I am a total newbie and this is my first patch, so please be merciful..=
=2E
Also, please CC me, I am not on the list.

--- a/arch/i386/kernel/sys_i386.c	2007-05-13 18:40:33.000000000 +0200
+++ b/arch/i386/kernel/sys_i386.c	2007-05-13 17:23:10.000000000 +0200
@@ -258,7 +258,8 @@ int kernel_execve(const char *filename,
 int kernel_execve(const char *filename, char *const argv[], char *cons=
t envp[])
 {
 	long __res;
-	asm volatile ("push %%ebx ; movl %2,%%ebx ; int $0x80 ; pop %%ebx"
+	asm volatile ("push %%ebx ; movl %2,%%ebx ; push %%ss ; push %%esp;"
+				"int $0x80 ; addl $(4*2),%%esp ; pop %%ebx"
 	: "=3Da" (__res)
 	: "0" (__NR_execve),"ri" (filename),"c" (argv), "d" (envp) : "memory"=
);
 	return __res;
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
