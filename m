From: "=?iso-8859-1?q?Rodrigo=20F.=20Baroni?=" <rodrigobaroni@yahoo.com.br>
Subject: PIII-IV SSE instructions set
Date: Sun, 3 Aug 2003 01:42:32 -0300 (ART)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030803044232.97466.qmail@web11108.mail.yahoo.com>
Reply-To: rodrigobaroni@yahoo.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-assembly@vger.kernel.org

Hello all,

    Does anybody knows if is possible to code in a
linux enviroment using the PIII-IV SSE (Stream SIMD
Extend) instructions set ?

    Some examples of SSE instructions are :

addps, addss
subps, subss
mulps, mulss
divps, divss
sqrtps, sqrtss
maxps, maxss
minps, minss
(...)

   And a code example follows  :

asm {
	push esi;
	push edi;
	; a is loaded into xmm1
	; b is loaded into xmm2
	mov xmm0, xmm1;
	mulps xmm0, xmm2;
	; store result into c
	pop edi;
        pop esi;
}


     Thanks a lot,

   Rodrigo F Baroni
Computer Science Bach's student.
 Sp, Brazil



_______________________________________________________________________
Conhe=E7a o novo Cad=EA? - Mais r=E1pido, mais f=E1cil e mais preciso.
Toda a web, 42 milh=F5es de p=E1ginas brasileiras e nova busca por imag=
ens!
http://www.cade.com.br
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
