From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Directory contents
Date: Mon, 29 Nov 2004 08:57:04 +0100
Message-ID: <20041129075704.GN14719@lug-owl.de>
References: <200411271900.48627.hitoc_mail@yahoo.it> <41AACEDD.4080509@codito.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="D9sZ58tf58331Q5M"
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <41AACEDD.4080509@codito.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
To: linux-c-programming@vger.kernel.org, linux-assembly@vger.kernel.org


--D9sZ58tf58331Q5M
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-11-29 12:55:17 +0530, sandeep <sandeep@codito.com>
wrote in message <41AACEDD.4080509@codito.com>:
> >I want to write a function that can read the contents of a specified=20
> >directory
> >in order to find a certain type of file or to copy a directory-tree or
> >something else.
> >Neverthless I need of some system functions that find the files that are
> >contained in that directory (like FINDFIRST and FINDNEXT under ms-dos).
> >
> >Who can help me?
> "man scandir" and man on functions mentioned at the end of that manpage.

From the man page:
----------------------------- >8 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
CONFORMING TO
       None  of  these  functions is in POSIX.  LSB has deprecated the libr=
ary
       call alphasort() and never contained scandir().

       The functions scandir() and alphasort() are from BSD 4.3, and have b=
een
       available  under  Linux since libc4.  Libc4 and libc5 use the more p=
re-
       cise prototype

       int alphasort(const struct dirent **a, const struct dirent **b);

       but glibc 2.0 returns to the imprecise BSD prototype.

       The function versionsort() is a GNU extension,  available  since  gl=
ibc
       2.1.   Since  glibc  2.1, alphasort() calls strcoll(3); earlier it u=
sed
       strcmp(3).
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D 8< --------------=
---------

So I guess you don't really want to use these functions. opendir(),
readdir() and closedir() are what's ment for that. If you're actually
writing an libc replacement (and thus need to use the syscall interface
instead of the libc interface), you can use open(..., ... | O_DIRECTORY)
in conjunction with getdents().

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Irak! =
  O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--D9sZ58tf58331Q5M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBqtZQHb1edYOZ4bsRArf5AJoDty7kIhKMR7TrWE2QBNnDpTE0UwCdGotP
hGRl3IKKYr50nVoSwCayTeU=
=r2S6
-----END PGP SIGNATURE-----

--D9sZ58tf58331Q5M--
