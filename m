From: Nicolas Bock <nicolasbock@gmail.com>
Subject: Re: writing a jump table
Date: Wed, 16 Mar 2011 20:26:07 -0600
Message-ID: <4D81713F.8040909@gmail.com>
References: <4D7FFFDD.5020103@gmail.com>	<19840.863.574550.774103@eidolon.muppetlabs.com>	<4D816E2B.2000409@gmail.com> <19841.28812.233966.341511@eidolon.muppetlabs.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigD49A755D11EEDD40F046924A"
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:x-enigmail-version:content-type;
        bh=fn+out+rzacX+NkKvCG5Bh1njTatL5OZOcpyHF0JRPc=;
        b=MUAxHWUuDzwfr8HpB4+g/nb45qwEy6Hb8XgK0KhkmLpiORm3wQxyLDsGpsVqNj30Og
         I5wg9hwcYRdSqNPeUY8kVUgQQ8COSp4uZgfO0tgEk0WB4dG2X3PS7Gdy3FZobJcyw53x
         pL6XgCQ9epH9qO9iOxsMD/juLVBnJDOdIOu3Y=
In-Reply-To: <19841.28812.233966.341511@eidolon.muppetlabs.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
To: Brian Raiter <breadbox@muppetlabs.com>
Cc: linux-assembly@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigD49A755D11EEDD40F046924A
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

But how does non-PIC code where it is in memory? When I disassemble the
non-PIC version, the address space starts at 0 which must mean that the
linker relocates the code. Also, labels represent offsets if I
understand this correctly, which is also a relative address and not an
absolute. That's what I meant with that I don't fully understand why
these extra hoops are necessary.

On 03/16/11 20:23, Brian Raiter wrote:
>> I think I figured it out now. I used gcc to compile PIC for the C
>> switch statement and checked what it does. I don't fully understand
>> it to be honest, but it seems to do the job also for non PIC code.
>=20
> Of course -- PIC code just means that the code doesn't assume it knows
> where it's located in memory, which for a shared-object library is a
> necessary thing. It does mean the code has to jump through a few more
> hoops, which is why the compiler doesn't make it the default.
>=20
> b


--------------enigD49A755D11EEDD40F046924A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk2BcT8ACgkQf15tZKyRylJD6QCg69LYd7W7reoH07I4vpll6/H7
2vwAnR77rm/hcQjeO0tYPIMdYVb9vqjL
=W2BP
-----END PGP SIGNATURE-----

--------------enigD49A755D11EEDD40F046924A--
