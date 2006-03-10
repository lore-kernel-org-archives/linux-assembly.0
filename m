From: leslie.polzer@gmx.net
Subject: Re: PS/2 Mouse
Date: Fri, 10 Mar 2006 01:07:31 +0100
Message-ID: <20060310000731.GA8544@wintermute>
References: <BAY14-F23AC99099DE8349B422488D0EC0@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BAY14-F23AC99099DE8349B422488D0EC0@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
To: Martin Fflores <abebex17@hotmail.com>
Cc: linux-assembly@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2006 at 10:42:04PM +0000, Martin Fflores wrote:

> asm("outb %%al,$0x60;": :"a"(EnabledDataReport));
Try

 asm("outb %%al,$0x60;": "a"(EnabledDataReport):);

instead.

  Leslie

--=20
gpg --keyserver pgp.mit.edu --recv-keys 0x52D70289
http://nic-nac-project.de/~skypher/

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.1 (GNU/Linux)

iD8DBQFEEMNDn/ep3VLXAokRAvHgAKC1PsM/P0FCL7rNa0WtzRA2moKFSACgrrMP
t4wB/P5nSlXhs0vvsYDpqpo=
=MwXF
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
