From: leslie.polzer@gmx.net
Subject: Re: Question regarding EIP instruction pointer
Date: Fri, 30 Mar 2007 15:58:23 +0200
Message-ID: <20070330135823.GA5129@wintermute.farpoint>
References: <BAY133-F35089BE38C90DC5E52C15CF5630@phx.gbl>
Reply-To: leslie.polzer@gmx.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BAY133-F35089BE38C90DC5E52C15CF5630@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
To: A D <a_d_249@hotmail.com>
Cc: linux-assembly@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2007 at 09:38:41AM -0400, A D wrote:

> I know that EIP register is the instruction pointer. But how does it
> know how many bytes it needs to increment to the next instruction?
In order to execute the current instruction, the CPU must determine its
format, which also means finding out how many bytes the command takes.

Next command is at eip+sizeof(command).  Of course, this only holds for
subsequent execution, branching is another thing.

  Leslie

--=20
NEW homepage: https://viridian.dnsalias.net/~sky/homepage/
gpg --keyserver pgp.mit.edu --recv-keys DD4EBF83

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQFGDRd+yYzv6N1Ov4MRAi34AJwLG4qkWhm/z1zvUueHWvY23c1RPACfa39X
ezhx73grgCRu7NS3UJ48tYU=
=+C2L
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
