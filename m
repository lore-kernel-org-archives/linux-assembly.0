From: Timo Lindfors <lindi@kurp.hut.fi>
Subject: Re: chdir on linux does not work
Date: Wed, 24 May 2006 07:26:14 +0300
Message-ID: <20060524042614.GA18142@kurp.hut.fi>
References: <20060524024929.99396.qmail@web50504.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060524024929.99396.qmail@web50504.mail.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
To: Noprianto <opennopri@yahoo.com>
Cc: linux-assembly@vger.kernel.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, May 23, 2006 at 07:49:29PM -0700, Noprianto wrote:
> -> from what i read, chdir is system call number 12

Yep, but better use something like

%define __NR_chdir               12

to make code more readable. Also, your example works just fine here:

$ nasm a.asm -f elf
$ gcc a.o -o a -nostdlib
$ strace ./a
execve("./a", ["./a"], [/* 30 vars */]) = 0
chdir("/bin")                           = 0
_exit(0)                                = ?

Remember that chdir affects only the process that calls chdir. You
can't e.g. write a replacement for shell's builtin "cd" command that
way.

best regards,
Timo Lindfors

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFEc+BmQwOiFKptEGsRAi8WAKCsLs/lhDRnntWAorQy/RmIQLKPsACeN5oY
W2xjjWL580Y4IbqG5Ks5hi4=
=hndJ
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
