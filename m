From: "=?iso-8859-1?q?Rodrigo=20F.=20Baroni?=" <rodrigobaroni@yahoo.com.br>
Subject: Write functions in assembly ?
Date: Mon, 10 Mar 2003 14:39:40 -0300 (ART)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030310173941.31982.qmail@web11102.mail.yahoo.com>
Reply-To: rodrigobaroni@yahoo.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-assembly@vger.kernel.org

Hello all,

  Is there some way to write just a function (or
method - c++) in assembly  that will be called from a
main program ? (Receiving the parameters passed to it)


  Example :

file main.c:
--------
#include <stdio.h>
#include "myfunction.h"
int main( void )
{
    int a =3D 10 , b =3D 20 , c =3D 0;
    c =3D myfunction( &a, &b );
    return c;
}

file myfunction.h
------
extern int myfunction( int *, int * );

file myfunction.c  <<-- this file in assembly !
-------
int myfunction( int *var1 , int *var2 )
{
    *var1 =3D *var2 + *var1;
    return *var2 * var1;
}


  Thanks
Rodrigo F Baroni

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
