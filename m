From: fmarmond@eprocess.fr
Subject: Re: Device Driver Development in Assembly Language
Date: Fri, 16 Jul 2004 22:56:18 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <1090011378.40f840f23560e@intranet.eprocess.fr>
References: <BAY12-F28SDfvaLH05O000165b0@hotmail.com>   <1089805172.40f51b74aa381@intranet.eprocess.fr> <1089915393.8863.200440567@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <1089915393.8863.200440567@webmail.messagingengine.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Fikri Aydemir <facse238@fastmail.fm>
Cc: linux-assembly@vger.kernel.org

hi,=20
No, i don't have 100% asm driver for linux...=20
I think it would be waste of time to write one, as (as i wrote you) lin=
ux=20
drivers usually use lots of C macros. But it can be usefull for learn p=
urpose,=20
to understand internal mechanical. As i'm not still a student, and not =
a=20
teacher, I don't have one in my archives... ;)=20
=20
I'm very busy those days, so I won't have time to write one for you, no=
re=20
write a dummy C driver and decompile it.(only few minutes left to answe=
r=20
you... ;) )=20
=20
I only can suggest you to do it if you don't know where to start: creat=
e a C=20
driver, compile it with full debug options, and then decompile it. Then=
, try=20
to understand how a (C) driver is done (in asm)... and then write your =
own.=20
Ask me if you don't know how to do it.=20
=20
good luck!=20
=46red=20
=20
=20
Selon Fikri Aydemir <facse238@fastmail.fm>:=20
=20
> =20
> Hi,=20
> =20
> Do you have any simple device driver example written in Assembly=20
> language? If so, can you send it to me? I really would like to ask yo=
u=20
> more precise questions but I have just started to work on this subjec=
t=20
> and my professor is not very helpful to me? I hope soon I will have m=
ore=20
> precise questions to ask.=20
>  =20
> Thanks a lot ,=20
> =20
> Fikri=20
> =20
> =20
> On Wed, 14 Jul 2004 13:39:32 +0200, fmarmond@eprocess.fr said:=20
> > it's kind of you, but I think that "Fikri Aydemir=20
> > <facse238@fastmail.fm>", the =20
> > original poster (and requester), may be more happy with that... =20
> > I was only answering his post... =20
> >  =20
> > thanks touhgh... ;) =20
> >  =20
> > Fred =20
> >  =20
> > Selon Mark Czubin <greatbadboss@hotmail.com>: =20
> >  =20
> > >  =20
> > > http://www.freewebs.com/four-f/ =20
> > > altough it's only for windows  =20
> > > all the tutorials and help you need in developing drivers in asse=
mbly  =20
> > >  =20
> > >  =20
> > > >From: fmarmond@eprocess.fr  =20
> > > >To: Fikri Aydemir <facse238@fastmail.fm>  =20
> > > >CC: linux-assembly@vger.kernel.org  =20
> > > >Subject: Re: Device Driver Development in Assembly Language  =20
> > > >Date: Tue, 13 Jul 2004 21:56:29 +0200  =20
> > > >  =20
> > > >Hi,  =20
> > > >Hum...  =20
> > > >You know, drivers stands in kernel stage, and must follow=20
'standardized'=20
> =20
> > way =20
> > >  =20
> > > >for regestering to the kernel itself.  =20
> > > >What do you teacher wants exactly?  =20
> > > >  =20
> > > >Do the driver's operations in assembly?  =20
> > > >-> embed assembly into a C prog, that will take advantage of all=
 C=20
> macros =20
> > > for  =20
> > > >registering driver to kernel (=3D> teacher wants you to do assem=
bly for=20
> its  =20
> > > >speed for particular driver tasks but don't care of the glue aro=
und)  =20
> > > >  =20
> > > >or write a .asm that would do all the stuff (teacher wants you t=
o learn =20
> =20
> > > >exactly what a driver must do to register, catch events, perform=
 =20
> > operations, =20
> > >  =20
> > > >release, ...) which is pretty much longer to write...  =20
> > > >  =20
> > > >I hope you have access to the sys calls at least!  =20
> > > >One tip: if you have to write 100% assembly, write a small drive=
r in C =20
> > (with =20
> > >  =20
> > > >full debugger options), and decompile it, to see what it does. T=
hen,  =20
> > > >understand the schem, and re-write it in optimized assembly...  =
=20
> > > >  =20
> > > >If you have more precise questions, feel free to ask, I can answ=
er in =20
> > nights =20
> > >  =20
> > > >(french time)  =20
> > > >  =20
> > > >good kuck!  =20
> > > >  =20
> > > >Fred  =20
> > > >  =20
> > > >Selon Fikri Aydemir <facse238@fastmail.fm>:  =20
> > > >  =20
> > > > >  =20
> > > > > Hi,  =20
> > > > >  =20
> > > > > I am making a research on device driver development in assemb=
ly  =20
> > > > > programming language for linux systems. I know that it is eas=
ier to =20
> =20
> > > > > write a device driver in C but my professor wants me to make =
it in  =20
> > > > > Assembly language, preferably in Intel syntax.  =20
> > > > >  =20
> > > > > Is there anyone who has worked on device driver development? =
Do you=20
> know =20
> > >  =20
> > > > > any resource such as a book or web site which I can benefit f=
rom?=20
> Thank  =20
> > > > > you...  =20
> > > > >  =20
> > > > > Fikri Aydemir  =20
> > > > > -  =20
> > > > > To unsubscribe from this list: send the line "unsubscribe =20
> > linux-assembly" =20
> > > in  =20
> > > > > the body of a message to majordomo@vger.kernel.org  =20
> > > > > More majordomo info at=A0=A0http://vger.kernel.org/majordomo-=
info.html  =20
> > > > >  =20
> > > > >  =20
> > > >  =20
> > > >  =20
> > > >  =20
> > > >  =20
> > > >-------------------------------------------------  =20
> > > >This mail sent through IMP: http://horde.org/imp/  =20
> > > >-  =20
> > > >To unsubscribe from this list: send the line "unsubscribe=20
> linux-assembly" =20
> > in =20
> > >  =20
> > > >the body of a message to majordomo@vger.kernel.org  =20
> > > >More majordomo info at=A0=A0http://vger.kernel.org/majordomo-inf=
o.html  =20
> > >  Koop geen kat in een zak. Probeer alles 14 dagen bij jou thuis. =
 =20
> > >  =20
> > >  =20
> >  =20
> >  =20
> >  =20
> > =20
> > -------------------------------------------------=20
> > This mail sent through IMP: http://horde.org/imp/=20
> =20
> =20
=20
=20
=20

-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
