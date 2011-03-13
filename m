From: Nicolas Bock <nicolasbock@gmail.com>
Subject: Re: 4x4 single-precision matrix product with SSE
Date: Sun, 13 Mar 2011 14:23:31 -0600
Message-ID: <4D7D27C3.5050404@gmail.com>
References: <4D7AA710.2030303@gmail.com> <AANLkTimCWmanFU19admtg5q18HvCOxrdjm+9XWFT-0Zm@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig2FA02BBB000186E018E1EE39"
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:x-enigmail-version:content-type;
        bh=B68RffFH0Csm4P4E9Wnjs+KpqVsufP1Uazxf5xpsrQs=;
        b=isVSAhl0POCwIfoFWszDyhKzrgmKC2oYeQwl/OoVNnOIR+ZaHN6+0gLgI0qXIZoaxg
         BU7rHfqLWxILjeA6aXpzkUMlZrYY4wK5RjhxPRYHm/vcwdEe4wq8vh/3/c+WepUbyVs8
         qhNR/m46OnM+VKfXIb6Jsyliv1NjgrkBaVw+Y=
In-Reply-To: <AANLkTimCWmanFU19admtg5q18HvCOxrdjm+9XWFT-0Zm@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
To: Frederic Marmond <fmarmond@gmail.com>
Cc: linux-assembly@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig2FA02BBB000186E018E1EE39
Content-Type: multipart/mixed;
 boundary="------------050900030501040003060605"

This is a multi-part message in MIME format.
--------------050900030501040003060605
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I have attached a short test project that demonstrates what I am doing.

I time this simply with the time function, i.e.

$ time ./mul_SSE 100000000

real    0m1.037s
user    0m1.036s
sys     0m0.001s

$ time ./mul_SSE4_1 100000000

real    0m2.006s
user    0m2.003s
sys     0m0.002s

I assume that I have prepared the A matrix for SSE a little bit by
"dilating" the elements into A =3D { A11, A11, A11, A11, A12, A12, ...  }=
,
while for SSE4.1 I am calling the multiply with the transpose of B.

As these matrices are really small, they should be completely in L1, so
the movaps operation should have pretty low latency. Since the SSE
version uses 4 times more data for A than the SSE4.1 version, I am
surprised that given the larger number of data movements for the SSE
version it still beats the SSE4.1 version. But maybe I am just not
coding this very intelligently.

Any suggestions would be very welcome,

Thanks already, nick


On 03/12/11 01:20, Frederic Marmond wrote:
> Hello Nicolas,
>=20
> Yes, it's the right place :)
> could you please paste your code as well as your benchmark context ?
>=20
> Fred
>=20
> 2011/3/11 Nicolas Bock <nicolasbock@gmail.com
> <mailto:nicolasbock@gmail.com>>
>=20
>     Hello list,
>=20
>     I am writing an assembly function that multiplies 2 4x4 single prec=
ision
>     matrices. I wrote 2 versions, one using SSE the other using SSE4.1.=
 What
>     surprised me is that the SSE4.1 version fails to beat the SSE versi=
on,
>     it is in fact slightly slower.
>=20
>     Is this the right place to ask for help? If anyone is interested I =
can
>     post some code which would maybe clarify the situation a bit.
>=20
>     If this is not the right place, please ignore me...
>=20
>     nick
>=20
>=20

--------------050900030501040003060605
Content-Type: text/plain;
 name="Makefile"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="Makefile"

I0NGTEFHUyA9IC1PMCAtZwpDRkxBR1MgPSAtTzIgLWZmYXN0LW1hdGgKCmFsbCA6IG11bF9T
U0UgbXVsX1NTRTRfMQoKbXVsX1NTRSA6IG1haW5fU1NFLm8gbWF0cml4X211bHRpcGx5X1NT
RS5vCglnY2MgLW8gJEAgJF4KCm11bF9TU0U0XzEgOiBtYWluX1NTRTRfMS5vIG1hdHJpeF9t
dWx0aXBseV9TU0U0XzEubwoJZ2NjIC1vICRAICReCgouUEhPTlk6IGNsZWFuCmNsZWFuOgoJ
cm0gLWYgKi5vCgptYWluX1NTRS5vIDogbWFpbi5jCglnY2MgJChDRkxBR1MpIC1EU1NFIC1j
IC1vICRAICReCgptYWluX1NTRTRfMS5vIDogbWFpbi5jCglnY2MgJChDRkxBR1MpIC1EU1NF
NF8xIC1jIC1vICRAICReCgolLm8gOiAlLmMKCWdjYyAkKENGTEFHUykgLWMgLW8gJEAgJF4K
CiUubyA6ICUuUwoJZ2NjICQoQ0ZMQUdTKSAtYyAtbyAkQCAkXgo=
--------------050900030501040003060605
Content-Type: text/x-csrc;
 name="main.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="main.c"

#include <stdio.h>
#include <stdlib.h>

#define RANDOM_MATRIX
//#define PRINT_DEBUG

#if defined(SSE)
void
matrix_multiply_SSE (const unsigned int N, float *A, float *B, float *C);=

#elif defined(SSE4_1)
void
matrix_multiply_SSE4_1 (const unsigned int N, float *A, float *B, float *=
C);
#endif

int
main (int argc, char **argv)
{
  float __attribute__ ((aligned (64))) A[4][4];
  float __attribute__ ((aligned (64))) A_dilated[4][4][4];
  float __attribute__ ((aligned (64))) B[4][4];
  float __attribute__ ((aligned (64))) B_transpose[4][4];
  float __attribute__ ((aligned (64))) C[4][4];

  short i, j;

  unsigned int max_N =3D 1;

  /* Parse command line. */
  if (argc =3D=3D 2)
  {
    max_N =3D strtol(argv[1], NULL, 10);
  }

  /* Fill matrix with some random stuff. */
  for (i =3D 0; i < 4; i++) {
    for (j =3D 0; j < 4; j++)
    {
#ifndef RANDOM_MATRIX
      A[i][j] =3D i*4+j;
      B[i][j] =3D i*4+j;
      C[i][j] =3D i*4+j;
#else
      A[i][j] =3D rand()/(float) RAND_MAX;
      B[i][j] =3D rand()/(float) RAND_MAX;
      C[i][j] =3D rand()/(float) RAND_MAX;
#endif
      B_transpose[j][i] =3D B[i][j];
      A_dilated[i][j][0] =3D A[i][j];
      A_dilated[i][j][1] =3D A[i][j];
      A_dilated[i][j][2] =3D A[i][j];
      A_dilated[i][j][3] =3D A[i][j];
    }
  }

#ifdef SSE
  matrix_multiply_SSE(max_N, (float*) &A_dilated[0][0], (float*) &B[0][0]=
, (float*) &C[0][0]);
#elif defined(SSE4_1)
  matrix_multiply_SSE4_1(max_N, (float*) &A[0][0], (float*) &B_transpose[=
0][0], (float*) &C[0][0]);
#endif

#ifdef PRINT_DEBUG
  for (i =3D 0; i < 4; i++) {
    for (j =3D 0; j < 4; j++)
    {
      //printf(" %i", (int) C[i][j]);
      printf(" %f", C[i][j]);
    }
    printf("\n");
  }
#endif

  return 0;
}

--------------050900030501040003060605
Content-Type: text/x-asm;
 name="matrix_multiply_SSE.S"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="matrix_multiply_SSE.S"

# C API:
#
# void
# matrix_multiply_SSE (const unsigned int N, float *A, float *B, float *C=
);

#define N %rdi
#define A %rsi
#define B %rdx
#define C %rcx

#define i %rax

  .text
  .align 256
  .global matrix_multiply_SSE
  .type matrix_multiply_SSE, @function

matrix_multiply_SSE:

  push i
  xor i, i

  test N, N
  jbe end_loop

start_loop:

  movaps 0x00(C), %xmm0
  movaps 0x10(C), %xmm1
  movaps 0x20(C), %xmm2
  movaps 0x30(C), %xmm3

  movaps 0x00(B), %xmm4
  movaps 0x10(B), %xmm5
  movaps 0x20(B), %xmm6
  movaps 0x30(B), %xmm7

  # Calculate C(1,:).
  movaps 0x000(A), %xmm8
  movaps 0x010(A), %xmm9
  movaps 0x020(A), %xmm10
  mulps %xmm4, %xmm8
  mulps %xmm5, %xmm9
  addps %xmm8, %xmm0
  movaps 0x030(A), %xmm11
  mulps %xmm6, %xmm10
  addps %xmm9, %xmm0
  movaps 0x040(A), %xmm12
  mulps %xmm7, %xmm11
  addps %xmm10, %xmm0
  movaps 0x050(A), %xmm13
  mulps %xmm4, %xmm12
  addps %xmm11, %xmm0
  movaps 0x060(A), %xmm14
  mulps %xmm5, %xmm13
  addps %xmm12, %xmm1
  movaps 0x070(A), %xmm15
  mulps %xmm6, %xmm14
  addps %xmm13, %xmm1
  movaps 0x080(A), %xmm8
  mulps %xmm7, %xmm15
  addps %xmm14, %xmm1
  movaps 0x090(A), %xmm9
  mulps %xmm4, %xmm8
  addps %xmm15, %xmm1
  movaps 0x0a0(A), %xmm10
  mulps %xmm5, %xmm9
  addps %xmm8, %xmm2
  movaps 0x0b0(A), %xmm11
  mulps %xmm6, %xmm10
  addps %xmm9, %xmm2
  movaps 0x0c0(A), %xmm12
  mulps %xmm7, %xmm11
  addps %xmm10, %xmm2
  movaps 0x0d0(A), %xmm13
  mulps %xmm4, %xmm12
  addps %xmm11, %xmm2
  movaps 0x0e0(A), %xmm14
  mulps %xmm5, %xmm13
  addps %xmm12, %xmm3
  movaps 0x0f0(A), %xmm15
  mulps %xmm6, %xmm14
  addps %xmm13, %xmm3
  mulps %xmm7, %xmm15
  addps %xmm14, %xmm3
  addps %xmm15, %xmm3

  # Write C back.
  movaps %xmm0, 0x00(C)
  movaps %xmm1, 0x10(C)
  movaps %xmm2, 0x20(C)
  movaps %xmm3, 0x30(C)

  inc i
  cmp N, i
  jb start_loop

end_loop:
  pop i
  ret

  .size matrix_multiply_SSE, .-matrix_multiply_SSE

--------------050900030501040003060605
Content-Type: text/x-asm;
 name="matrix_multiply_SSE4_1.S"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="matrix_multiply_SSE4_1.S"

# C API:
#
# void
# matrix_multiply_SSE4_1 (const unsigned int N, float *A, float *B, float=
 *C);

#define N %rdi
#define A %rsi
#define B %rdx
#define C %rcx

#define i %rax

  .text
  .align 256
  .global matrix_multiply_SSE4_1
  .type matrix_multiply_SSE4_1, @function

matrix_multiply_SSE4_1:

  push i
  xor i, i

  test N, N
  jbe end_loop

start_loop:

  movaps 0x00(C), %xmm0
  movaps 0x10(C), %xmm1
  movaps 0x20(C), %xmm2
  movaps 0x30(C), %xmm3

  movaps 0x00(B), %xmm4
  movaps 0x10(B), %xmm5
  movaps 0x20(B), %xmm6
  movaps 0x30(B), %xmm7

  movaps 0x00(A), %xmm8
  movaps 0x10(A), %xmm9

  # Calculate C(1,:).
  movaps %xmm4, %xmm10
  dpps $0xf1, %xmm8, %xmm10
  movaps %xmm5, %xmm11
  dpps $0xf2, %xmm8, %xmm11
  movaps %xmm6, %xmm12
  dpps $0xf4, %xmm8, %xmm12
  movaps %xmm7, %xmm13
  dpps $0xf8, %xmm8, %xmm13
  blendps $0x01, %xmm10, %xmm11
  blendps $0x03, %xmm11, %xmm12
  blendps $0x07, %xmm12, %xmm13
  addps %xmm13, %xmm0

  movaps 0x20(A), %xmm8

  # Calculate C(2,:).
  movaps %xmm4, %xmm10
  dpps $0xf1, %xmm9, %xmm10
  movaps %xmm5, %xmm11
  dpps $0xf2, %xmm9, %xmm11
  movaps %xmm6, %xmm12
  dpps $0xf4, %xmm9, %xmm12
  movaps %xmm7, %xmm13
  dpps $0xf8, %xmm9, %xmm13
  blendps $0x01, %xmm10, %xmm11
  blendps $0x03, %xmm11, %xmm12
  blendps $0x07, %xmm12, %xmm13
  addps %xmm13, %xmm1

  movaps 0x30(A), %xmm9

  # Calculate C(3,:).
  movaps %xmm4, %xmm10
  dpps $0xf1, %xmm8, %xmm10
  movaps %xmm5, %xmm11
  dpps $0xf2, %xmm8, %xmm11
  movaps %xmm6, %xmm12
  dpps $0xf4, %xmm8, %xmm12
  movaps %xmm7, %xmm13
  dpps $0xf8, %xmm8, %xmm13
  blendps $0x01, %xmm10, %xmm11
  blendps $0x03, %xmm11, %xmm12
  blendps $0x07, %xmm12, %xmm13
  addps %xmm13, %xmm2

  # Calculate C(4,:).
  movaps %xmm4, %xmm10
  dpps $0xf1, %xmm9, %xmm10
  movaps %xmm5, %xmm11
  dpps $0xf2, %xmm9, %xmm11
  movaps %xmm6, %xmm12
  dpps $0xf4, %xmm9, %xmm12
  movaps %xmm7, %xmm13
  dpps $0xf8, %xmm9, %xmm13
  blendps $0x01, %xmm10, %xmm11
  blendps $0x03, %xmm11, %xmm12
  blendps $0x07, %xmm12, %xmm13
  addps %xmm13, %xmm3

  # Write C back.
  movaps %xmm0, 0x00(C)
  movaps %xmm1, 0x10(C)
  movaps %xmm2, 0x20(C)
  movaps %xmm3, 0x30(C)

  inc i
  cmp N, i
  jb start_loop

end_loop:
  pop i
  ret

  .size matrix_multiply_SSE4_1, .-matrix_multiply_SSE4_1

--------------050900030501040003060605--

--------------enig2FA02BBB000186E018E1EE39
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk19J8MACgkQf15tZKyRylIO5QCg9hiy6YL2W1EaRrK6xCO3330L
MtMAoL4QZC/4mpxLXmhf2HUGf5c0FCr5
=djD8
-----END PGP SIGNATURE-----

--------------enig2FA02BBB000186E018E1EE39--
