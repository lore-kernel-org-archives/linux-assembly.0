From: leslie.polzer@gmx.net
Subject: Re: Unable To Jump To Undefined Symbol
Date: Tue, 14 Mar 2006 16:27:00 +0100
Message-ID: <20060314152700.GA13315@wintermute>
References: <4416C936.2010403@wipro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4416C936.2010403@wipro.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
To: Deepak Pandey <deepak.pandey@wipro.com>
Cc: linux-assembly@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2006 at 07:16:30PM +0530, Deepak Pandey wrote:

> Hi, I got a compilation problem saying UNABLE TO JUMP TO UNDEFIND
> SYMBOL while compiling a code in which I tried to jump to a
> symbol(symbol_name) from a different file by an assembly instruction
> (j symbol_name).However I also declared the symbol as global(.globl
> symbol_name) but still it didnot worked.
You need to tell the assembler in the file which references the symbol
that it's out there.  Use extern, EXTRN or whatever directive your
assembler supports for this purpose.

> The Symbol was defined as follows:
> LEAF(symbol_name)
>       /*some assembly instructions*/
> END(symbol_name)
What assembler uses these syntactic constructs?

  Leslie

--=20
gpg --keyserver pgp.mit.edu --recv-keys 0x52D70289
http://nic-nac-project.de/~skypher/

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.1 (GNU/Linux)

iD8DBQFEFuDEn/ep3VLXAokRAoWFAJ0cryETUBtR+jRSUq/uWUMuvKpfJACgqrv8
FS3hm08o/zHSS48p3mLwor8=
=Kn3b
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
