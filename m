From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: monitoring code while executing.
Date: Mon, 22 Nov 2004 20:35:33 +0100
Message-ID: <20041122193533.GP26791@lug-owl.de>
References: <20041122182459.60354.qmail@web51903.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TRkqPRiqIDKgfg/F"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20041122182459.60354.qmail@web51903.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
To: linux-c-programming@vger.kernel.org, linux-assembly@vger.kernel.org


--TRkqPRiqIDKgfg/F
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-11-22 10:24:59 -0800, A M <alim1993@yahoo.com>
wrote in message <20041122182459.60354.qmail@web51903.mail.yahoo.com>:
> Can anybody think of a method in which one process can
> view (monitor, read) the instructions of another
> process while it is running (one process see
> instruction of another process while they get fetched
> to be executed)? Is it possible with threads instead
> of processes?=20

Any debugger (like gdb) or system/library call tracer (strace, ltrace)
does this using the ptrace system call.

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

--TRkqPRiqIDKgfg/F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBoj+EHb1edYOZ4bsRAl4DAJ0bQM/5bYlyereRdby0nFYD0pQ0ZwCeNne8
6BsvyLfBinG8TOP6zJUvPs0=
=RxCk
-----END PGP SIGNATURE-----

--TRkqPRiqIDKgfg/F--
