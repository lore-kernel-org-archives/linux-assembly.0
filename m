From: Nicolas Bock <nicolasbock@gmail.com>
Subject: Re: writing a jump table
Date: Wed, 16 Mar 2011 08:13:03 -0600
Message-ID: <4D80C56F.4040403@gmail.com>
References: <4D7FFFDD.5020103@gmail.com> <19840.863.574550.774103@eidolon.muppetlabs.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig237C0B9416E52D67AA5176EA"
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:x-enigmail-version:content-type;
        bh=UA9DYpHTSiVoNtZYUWEnkOUXWdHUh4EvFnfZSqt1EZE=;
        b=izaYcY9wF/6cisqKTtsYqpojS139L8kXzRTU7v6uSPzFX7zAY8uGgV2VNTskPcobaU
         arKD/99CC2hHXjujGZh0HRf66+tgDWcuHlzsM/nXZKmVrpJhW8W8oN+BoBJoh3ORmqh+
         1ARJwqPHEGuv2/Njn/ZudBv1RsjopjdKKIZDI=
In-Reply-To: <19840.863.574550.774103@eidolon.muppetlabs.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
To: Brian Raiter <breadbox@muppetlabs.com>
Cc: linux-assembly@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig237C0B9416E52D67AA5176EA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Brian,

yes, I compiled it and when I run the code it segfaults.

nick


On 03/15/11 18:25, Brian Raiter wrote:
>> I am trying to write a jump table, but unfortunately with limited
>> success. When I compile the code and disassemble it, the offset of
>> "table" is 0, which I guess means that something didn't work out.
>=20
> Actually, table appears immediately following your indirect jump
> instruction, so I would assume that the offset would be zero. Did you
> actually try this code to verify that it doesn't do what you expect?
>=20
> b
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--------------enig237C0B9416E52D67AA5176EA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk2AxW8ACgkQf15tZKyRylKGcwCg2yKg4xkNnEwDgnWty9zUCwco
9ogAoNt0/b3DFi0tYjcvXswiqPg3S8nv
=+tUo
-----END PGP SIGNATURE-----

--------------enig237C0B9416E52D67AA5176EA--
