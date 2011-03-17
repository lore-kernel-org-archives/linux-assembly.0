From: Nicolas Bock <nicolasbock@gmail.com>
Subject: Re: writing a jump table
Date: Wed, 16 Mar 2011 20:12:59 -0600
Message-ID: <4D816E2B.2000409@gmail.com>
References: <4D7FFFDD.5020103@gmail.com> <19840.863.574550.774103@eidolon.muppetlabs.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigE04E62CCE65022EC996C9883"
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:x-enigmail-version:content-type;
        bh=xJDEFXrH/4Nn/L7URMDroBUOM4K4Hm5XBz6IZqu9UsA=;
        b=hlNF+YKEkltO3iXk2xa95LmFYhZI7wO1cDb6a4kmVhLB8+wpUg3ca3b8hnm7plT87n
         ItQFZPHr9FpRx4z3VKmz1HevVLG753sFBrR8ODSh02T0RTmE+y25vvUeMuv+lrTsjnFR
         hutePSAGCMwwf/iPGn58cx4cJhnxgB5356AuA=
In-Reply-To: <19840.863.574550.774103@eidolon.muppetlabs.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
To: Brian Raiter <breadbox@muppetlabs.com>
Cc: linux-assembly@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigE04E62CCE65022EC996C9883
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I think I figured it out now. I used gcc to compile PIC for the C switch
statement and checked what it does. I don't fully understand it to be
honest, but it seems to do the job also for non PIC code. For posterity,
here is the code:

  .text
  .global jump_table
  .type jump_table, @function

jump_table:
  # Push stack pointer so we can make room for local storage.
  push %rax

  mov $0x02, %rax # Move index into rax; 2 is supposed to end up at
label_02.

  lea 0(,%rax, 4), %rdx
  lea table(%rip), %rax
  mov (%rdx, %rax), %edx
  movslq %edx, %rdx
  lea table(%rip), %rax
  lea (%rdx, %rax), %rax
  jmp *%rax

  .section .rodata
  .align 4
table:
  .long label_00-table
  .long label_01-table
  .long label_02-table
  .long label_03-table

  .text
label_00:
  jmp done

label_01:
  jmp done

label_02:
  jmp done

label_03:
  jmp done

done:
  pop %rax
  ret

  .size jump_table, .-jump_table


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


--------------enigE04E62CCE65022EC996C9883
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk2BbisACgkQf15tZKyRylIm0wCgt24zUKkGqNoBCCreBQXRO+2X
6lsAn1q1luWdF4otpWzsRBfuvVjif9hE
=97mH
-----END PGP SIGNATURE-----

--------------enigE04E62CCE65022EC996C9883--
