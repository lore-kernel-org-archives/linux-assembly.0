From: Nicolas Bock <nicolasbock@gmail.com>
Subject: 4x4 single-precision matrix product with SSE
Date: Fri, 11 Mar 2011 15:49:52 -0700
Message-ID: <4D7AA710.2030303@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig96A66F67627C959FAF83C75C"
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:x-enigmail-version:content-type;
        bh=toLl+BVkO3Opr4O6kax3kbzjTELagksFlJCex5bBypQ=;
        b=mNfzaF4rjDdRjcUCCoT/iSjLFMNMQWkSLQeTRKK7n5uClvQz+wYRpVop9diN1tb6Wl
         fWtCOB1ImMqHV5m6W+oL5RnMkpcqob7iSc0tvdqhygbHHjbSuxMtRd8bYnZYLcJqRsdN
         z3CDh4Vk0ToNnVA2rM80F79cZOXXcjqFMfnNY=
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
To: linux-assembly@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig96A66F67627C959FAF83C75C
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello list,

I am writing an assembly function that multiplies 2 4x4 single precision
matrices. I wrote 2 versions, one using SSE the other using SSE4.1. What
surprised me is that the SSE4.1 version fails to beat the SSE version,
it is in fact slightly slower.

Is this the right place to ask for help? If anyone is interested I can
post some code which would maybe clarify the situation a bit.

If this is not the right place, please ignore me...

nick


--------------enig96A66F67627C959FAF83C75C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk16pxAACgkQf15tZKyRylKs5QCg+IcsUYRO+idK8D37FNbnWp3d
tLIAn3eXnHMjHJtLNjTd1hZVNMr4TLj6
=bhE6
-----END PGP SIGNATURE-----

--------------enig96A66F67627C959FAF83C75C--
