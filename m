From: Nicolas Bock <nicolasbock@gmail.com>
Subject: writing a jump table
Date: Tue, 15 Mar 2011 18:10:05 -0600
Message-ID: <4D7FFFDD.5020103@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigCC68461DBB8CBD796BA51BAD"
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:x-enigmail-version:content-type;
        bh=3vYuJaFgJxrXOAAnYkGbFCDfXbuQvmWHwzKGkEU4nzU=;
        b=N8Oszl7EBsVbqrS1Xzk+A2u4fbF3stJ9F2jMtnmaGwaN20dB4eh34eAEhtkFSF+qHv
         UNhgv5HkaNtYKYeAhLw04LvshRkKvF5O5ywGqzCli+z9l5xtZ3zNZZjLxgiz2cYBqYzo
         WKrmw5CEhMC/CwrUw6VFV1D4WOebcS72MdueY=
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
To: linux-assembly@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigCC68461DBB8CBD796BA51BAD
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello list,

I am trying to write a jump table, but unfortunately with limited
success. When I compile the code and disassemble it, the offset of
"table" is 0, which I guess means that something didn't work out. Any
help would be gratefully appreciated.

The assembly code, jump_table.S:

  .text
  .global jump_table
  .type jump_table, @function

jump_table:
  push %rax

  mov $0x02, %rax # Move index into rax; 2 is supposed to end up at
label_02.
  jmp *table(, %rax, 4) # Jump into the table.

  .align 8
table:
  .long label_00
  .long label_01
  .long label_02

label_00:
  nop

label_01:
  nop

label_02:
  nop

done:
  pop %rax
  ret

  .size jump_table, .-jump_table


compiled with: gcc -c -g -o jump_table.o jump_table.S

disassembled code:

(gdb) disassemble jump_table
Dump of assembler code for function jump_table:
   0x0000000000000000 <+0>:     push   %rax
   0x0000000000000001 <+1>:     mov    $0x2,%rax
   0x0000000000000008 <+8>:     jmpq   *0x0(,%rax,4)
   0x000000000000000f <+15>:    nop
   0x0000000000000010 <+16>:    add    %al,(%rax)
   0x0000000000000012 <+18>:    add    %al,(%rax)
   0x0000000000000014 <+20>:    add    %al,(%rax)
   0x0000000000000016 <+22>:    add    %al,(%rax)
   0x0000000000000018 <+24>:    add    %al,(%rax)
   0x000000000000001a <+26>:    add    %al,(%rax)
   0x000000000000001c <+0>:     nop
   0x000000000000001d <+0>:     nop
   0x000000000000001e <+0>:     nop
   0x000000000000001f <+0>:     pop    %rax
   0x0000000000000020 <+1>:     retq
End of assembler dump.



Thanks already, nick


--------------enigCC68461DBB8CBD796BA51BAD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk1//90ACgkQf15tZKyRylI9eACaAovf8WE0zj8xGI8ROuTTfWnO
/a8An1NnteZks92izzYVZOaD+UfdmBBu
=57H5
-----END PGP SIGNATURE-----

--------------enigCC68461DBB8CBD796BA51BAD--
