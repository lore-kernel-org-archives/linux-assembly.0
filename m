From: RCS <cryptik@ig.com.br>
Subject: Re: How interrupts work
Date: Fri, 23 Aug 2002 08:30:51 -0300
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020823112649Z318750-685+36066@vger.kernel.org>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-assembly@vger.kernel.org

  Thanks, but which assembler must I use for this code? GNU as?=20
  I'm asking that because I am only familiar with nasm.=20

  Thanks Again,=20

                                  RCS=20


Em Aug 2002, Dmitry Trunikov escreveu:=20

>RCS wrote:=20
>=20
>> I need some help to understand how interrupts work on Intel.=20
>> For example, how do I print a character in the screen?=20
>>Wich register must contain the character for that? Is "int 10h" the=20
correct=20
>>interrupt for that?=20
>>=20
>>=20
>It depends on which pc or OS you use. "int 10h" is a BIOS (base input=20
>output system) interrupt i.e. it can be used AFAIK only in real CPU=20
>mode. Usually for character output is used OS API. In MSDOS you can uset=20
>"int 10h" or "int 21h" for input/output. Under linux you can use system=20
>call "int 80h".=20
>This is an example for output string under linux:=20
>=20
>// ssize_t write(int fd, const void *buf, size_t count);=20
>// write(fileno(stdout), "hello", 6);=20
>=20
>.data=20
>hello:=20
> .string "hello world\n"=20
>.text=20
>.globl _start=20
>_start:=20
> movl 4,%eax // 4 - sys function 'write'=20
> movl 1,%ebx // fd =3D fileno(stdio)=20
> movl $hello,%ecx // buf =3D str=20
> movl $12,%edx // count=20
> int $0x80=20
>=20
> movl 1,%eax // sys function 'exit'=20
> xorl %ebx,%ebx=20
> int $0x80=20
>=20
>----------=20

_________________________________________________________
Oi! Voc=EA quer um iG-mail gratuito?
Ent=E3o clique aqui: http://registro.ig.com.br/

