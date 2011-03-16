From: Nicolas Bock <nicolasbock@gmail.com>
Subject: Re: writing a jump table
Date: Wed, 16 Mar 2011 10:48:31 -0600
Message-ID: <4D80E9DF.4020605@gmail.com>
References: <4D7FFFDD.5020103@gmail.com>	<19840.863.574550.774103@eidolon.muppetlabs.com>	<4D80C56F.4040403@gmail.com>	<4D80C8A0.6090407@zytor.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig1D0E80737802003624870CC0"
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:x-enigmail-version:content-type;
        bh=m/tbIojAKrVopZjwfWf1v1Kh28FSVDoE8EGyc7XfaLs=;
        b=s1rg5MGC5yiCiPHnXUARM5xutkp3mQ0EyjZW6/Gf413+h2Wiw5K6DXvwqG8etwMDMG
         lwOQVxQY/9o3FL2VJSMm6SKyQFhWEhei7SEog8X7JBJlxIWkapPqlHbjUXUx75sRD2No
         mKkRS0YxKcsS63t7MuheEAgpcEh+l8ipMYZ8A=
In-Reply-To: <4D80C8A0.6090407@zytor.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
To: Frank Kotler <fbkotler@zytor.com>
Cc: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig1D0E80737802003624870CC0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi frank

Honestly I don't know. I don't have a lot of assembly experience and
this is all pretty new to me.

nick


On Wednesday, March 16, 2011, Frank Kotler <fbkotler@zytor.com> wrote:
> Nicolas Bock wrote:
>
> Hi Brian,
>
> yes, I compiled it and when I run the code it segfaults.
>
>
> Don't you need 64-bit addresses in your jump-table for 64-bit code?
>
> Best,
> Frank
>
>
>


--------------enig1D0E80737802003624870CC0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk2A6eUACgkQf15tZKyRylIzFgCeJFCxIpOcq747sRHVPykiIayR
aDMAoPd9psZbLM4iy534yc8SXx5lBRTa
=zPBD
-----END PGP SIGNATURE-----

--------------enig1D0E80737802003624870CC0--
