From: "=?iso-8859-1?q?Rodrigo=20F.=20Baroni?=" <rodrigobaroni@yahoo.com.br>
Subject: Inline gcc assembly
Date: Sun, 16 Feb 2003 23:46:55 -0300 (ART)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030217024655.31547.qmail@web11107.mail.yahoo.com>
Reply-To: rodrigobaroni@yahoo.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-assembly@vger.kernel.org


   Hello all,


     Please, could someone, explain how does work the
gcc inline assembly code , like in the codes in
/usr/src/linux/include/asm, or the sample above ? :


#include <stdio.h>

int main(void) {
  register unsigned int out =3D 0;
  register const char *a =3D "hello\n";
  register size_t s =3D 6;
 =20
  __asm__ __volatile__ ("movl %0, %%ebx;
			 movl %1, %%ecx;
			 movl %2, %%edx;
			 call __NR_write;"
			:
			:"r" (out, a, s)
			:"%ebx","%ecx","%edx");
  return 0;
}


  There are a lot of theses at kernel source in /asm,
=2E. I have look for a good explain about it, but I did
not found yet...




     Rodrigo F Baroni
Computer Science Bach's Student
    Sao Paulo, Brazil

_______________________________________________________________________
Busca Yahoo!
O servi=E7o de busca mais completo da Internet. O que voc=EA pensar o Y=
ahoo! encontra.
http://br.busca.yahoo.com/
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
