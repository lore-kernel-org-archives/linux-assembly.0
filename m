From: RCS <cryptik@ig.com.br>
Subject: Re: variables
Date: Fri, 23 Aug 2002 08:27:30 -0300
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020823112328Z318770-685+36065@vger.kernel.org>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-assembly@vger.kernel.org

Thanks, with that command-line I could anderestand=20
a simple program as followed:=20

C-CODE=20
------=20

int a =3D 1;=20

int main(void)=20
{=20
  int b =3D 2;=20

  a =3D b;=20
}=20

ASSEMBLER CODE=20
--------------=20

	.file	"Variaveis.c"=20
	.version	"01.01"=20
gcc2_compiled.:=20
globl a=20
data=20
	.align 4=20
	.type	 a,@object=20
	.size	 a,4		;  Global Variable Size Definition a (4 bytes)=20
a:=20
	.long 1			;  Global Variable a =3D 1=20
text=20
	.align 4=20
globl main=20
	.type	 main,@function=20
main:=20
	pushl %ebp=20
	movl %esp,%ebp=20
	subl $24,%esp=20
	movl $2,-4(%ebp)	;  Local Variable b =3D 2=20
	movl -4(%ebp),%eax=20
	movl %eax,a		;  a =3D b=20
L2:=20
	leave=20
	ret=20
Lfe1:=20
	.size	 main,.Lfe1-main=20
	.ident	"GCC: (GNU) 2.95.3 20010315 (release) (conectiva)"=20


ARE THE COMMENTS CORRECT ?=20



Em Aug 2002, Dmitry Trunikov escreveu:=20

>RCS wrote:=20
>=20
>> Can anyone explain me how global and local variables from C are treated =

>in=20
>>assembler?=20
>> Is that write that local variables are storage in the stack?=20
>>=20
>Yes.=20
>You can compile c-program to asm-source. Try gcc -S program.c=20
>=20
>----------=20

_________________________________________________________
Oi! Voc=EA quer um iG-mail gratuito?
Ent=E3o clique aqui: http://registro.ig.com.br/

