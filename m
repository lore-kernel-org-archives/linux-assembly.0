From: HIToC <hitoc_mail@yahoo.it>
Subject: read key from keyboard
Date: Mon, 1 Nov 2004 17:55:25 +0100 (CET)
Message-ID: <20041101165525.33834.qmail@web25104.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: linux-assembly@vger.kernel.org

Hi all

How can I read a key from the keyboard when the key is
available?
I wish also to know the keyboard scan code... Do you
remember the
funtion 0 of interrupt 16h of BIOS??

	xor	ah, ah
	int	16h
returns:
	AH =3D BIOS scan code
	AL =3D ASCII character


I have seen that on Linux we can read from the stdin:

	mov	eax, 0x03	; sys_read
	xor	ebx, ebx	; stdin =3D 0
	mov	ebx, buffer	; buffer
	mov	ecx, 0x01	; count
	int	0x80		; Linux kernel

but this code does not return the key when it is
immediatelly
available... It prints the key on stdout and waits
that the
user presses enter!

Thanks!!


=3D=3D=3D=3D=3D
HIToC


	=09
___________________________________=20
Nuovo Yahoo! Messenger: E' molto pi=F9 divertente: Audibles, Avatar, We=
bcam, Giochi, Rubrica=85 Scaricalo ora!=20
http://it.messenger.yahoo.it
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
