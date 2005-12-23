From: Fred Marmond <fmarmond@free.fr>
Subject: Re: newbie
Date: Fri, 23 Dec 2005 10:11:53 +0100
Message-ID: <200512231011.54193.fmarmond@free.fr>
References: <20051223165014.3a1db406.amerei@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20051223165014.3a1db406.amerei@gmail.com>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Niel A <amerei@gmail.com>
Cc: linux-assembly@vger.kernel.org

Hi Niel
string is a label, that's to say here, a pointer.
If you are in x86 architecture (32bits), a pointer is 32bits long, so y=
ou'll=20
have to do "mov edi,string".
If you are in x86_64 arch (64bits), you'll have to use 64bits registers=
 for=20
pointers, "mov rdi,string"


=46red


Le Vendredi 23 D=E9cembre 2005 17:50, Niel A a =E9crit=A0:
> hello all!
>
> i'm taking linux assembly as a hobby for christmas and i found your g=
reat
> site. the tutorials have been much helpful.
>
> anyway, i meant to ask something..
>
> section .data
> 	string: db "hi!",10
>
> and i wanna capitalize the small letter 'h'.
>
> at first i used
> 	mov di, string ; but di is 16 bits and ld complains
>
> so i eventually started using the 32 bit ones to do the capitalisatio=
n
> operation. but for some reason, i lose all other letters, including t=
he
> linefeed.
>
> please point me to the right direction.
>
> merry christmas,
> - niel
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assem=
bly"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
