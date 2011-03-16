From: Nicolas Bock <nicolasbock@gmail.com>
Subject: Re: writing a jump table
Date: Wed, 16 Mar 2011 10:57:04 -0600
Message-ID: <4D80EBE0.50808@gmail.com>
References: <4D7FFFDD.5020103@gmail.com> <19840.863.574550.774103@eidolon.muppetlabs.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigB21F0DE8BB488E2D3F660616"
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:x-enigmail-version:content-type;
        bh=NRWXnhjRonVGv7o+s2AgMKakMsUx86PcuWgyl8QIKcw=;
        b=Rvrk1sbsv7FMG9tuX4wNeS2f+3mrRG4ITf/DBwpKIbcQ6zaVGux6s5owakvtGj8gmx
         N4GIzaWIxWjQqHJwCiZOuOoSowFJmY0N6dtGEupdBRIniq+bW/Rs/SKt5SUfa9r1u9xq
         mzr1xYSmRF0tQIR9mjcKiIoRj7h5w63jOQjmw=
In-Reply-To: <19840.863.574550.774103@eidolon.muppetlabs.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
To: Brian Raiter <breadbox@muppetlabs.com>
Cc: linux-assembly@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigB21F0DE8BB488E2D3F660616
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Using a larger switch statement in C, I looked at the code that gcc
produces and changed a few things in my assembly function. It now looks
like below. This function works now, it actually jumps to label_02. When
I try to put that function into a project that uses libtool to build a
dynamic library however, I get the following linking error:

/usr/lib/gcc/x86_64-pc-linux-gnu/4.4.5/../../../../x86_64-pc-linux-gnu/bi=
n/ld:
=2E/.libs/libspamm_kernel.a(jump_table.o): relocation R_X86_64_32S agains=
t
`.rodata' can not be used when making a shared object; recompile with -fP=
IC
=2E/.libs/libspamm_kernel.a(jump_table.o): could not read symbols: Bad va=
lue

What does this error mean?

Thanks,

nick





jump_table.S:

  .text
  .global jump_table
  .type jump_table, @function

jump_table:
  # Push stack pointer so we can make room for local storage.
  push %rax

  mov $0x02, %rax # Move index into rax; 2 is supposed to end up at
label_02.
  jmp *table(, %rax, 8) # Jump into the table.

  .section .rodata
  .align 8
table:
  .quad label_00
  .quad label_01
  .quad label_02

  .text
label_00:
  jmp done

label_01:
  jmp done

label_02:
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


--------------enigB21F0DE8BB488E2D3F660616
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk2A6+MACgkQf15tZKyRylK4oQCg7o/C9A+1/wuw5zvbYpXnvMOJ
WK4An0RtdlHfFi86IWqe/vrxhWDxh8sO
=JCbH
-----END PGP SIGNATURE-----

--------------enigB21F0DE8BB488E2D3F660616--
