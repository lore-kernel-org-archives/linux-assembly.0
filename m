From: "=?iso-8859-1?q?Rodrigo=20F.=20Baroni?=" <rodrigobaroni@yahoo.com.br>
Subject: Gcc extended asm : error
Date: Sun, 23 Feb 2003 19:49:09 -0300 (ART)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030223224909.79695.qmail@web11103.mail.yahoo.com>
Reply-To: rodrigobaroni@yahoo.com.br
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0-1236154341-1046040549=:78601"
Content-Transfer-Encoding: 8bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
To: linux-assembly@vger.kernel.org

--0-1236154341-1046040549=:78601
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Id: 
Content-Disposition: inline

Hello everybody,

      Does anyboby could know where are the problem in
the source attached ? The follow message are given by
gcc:

    asm2.c: In function `main':
    asm2.c:22: Invalid `asm' statement:
    asm2.c:22: fixed or forbidden register 2 (cx) was
spilled for class CREG.=20


Rodrigo F Baroni
Computer Science Bach's Student
Sao Paulo, Brazil

_______________________________________________________________________
Busca Yahoo!
O servi=E7o de busca mais completo da Internet. O que voc=EA pensar o Yahoo=
! encontra.
http://br.busca.yahoo.com/
--0-1236154341-1046040549=:78601
Content-Type: text/plain; name="asm2.txt"
Content-Description: asm2.txt
Content-Disposition: inline; filename="asm2.txt"

#include <stdio.h>

#define rep_movsl( src, dest, numwords )	\
	__asm__ __volatile__ ( \
	"cld\n\t" \
	"rep\n\t" \
	"movsl" \
	: : "S" (src), "D" (dest), "c" (numwords) \
	: "%ecx", "%esi", "%edi" )

int main( void )
{
	char *src, *dest;
	int nro = 9;

	src = ( char * ) calloc( 10, sizeof( char ) );
	dest = ( char * ) calloc( 10, sizeof( char) );

	sprintf( src, "%s", "ola mundo" );
	printf( "%s", src );

	rep_movsl( src, dest, 9 );
	
	printf( "%s", dest ); 
	return 0;
}

--0-1236154341-1046040549=:78601--
