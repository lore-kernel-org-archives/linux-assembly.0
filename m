From: Frederic Marmond <zebarbuc@free.fr>
Subject: Re: newbie question about integers size/portabilty.
Date: Thu, 30 Dec 2004 10:10:48 +0100
Message-ID: <1104397848.41d3c618ebfb2@imp1-q.free.fr>
References: <20041228122916.GA7137@ic.unicamp.br> <opsjpz0szcuqea3r@sucks.airplane.fire> <20041228152004.GB7304@ic.unicamp.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20041228152004.GB7304@ic.unicamp.br>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ribamar Santarosa de Sousa <ribamar.sousa@ic.unicamp.br>
Cc: Richard Cooper <generic@xersedefixion.com>, linux-assembly@vger.kernel.org

some sizeof, depending of the architecture:

on a 32 bits system:
float=4
double=8
long double=12
char=1
short=2
short int=2
int=4
long=4
long int=4
long long=8
long long int=8
char*=4


on a 64 bits system
float=4
double=8
long double=16
char=1
short=2
short int=2
int=4
long=8
long int=8
long long=8
long long int=8
char*=8


note that 'long' may make your types change (long double, long, ...) according
to the architecture.
pointeurs are also affected.

Fred


Selon Ribamar Santarosa de Sousa <ribamar.sousa@ic.unicamp.br>:

> > > 	Does anyone know where i can get a accurate table for gcc compiler?
> >
> > I think that char is 8, short is 16, long is 32, and int I think is also
> > 32.  I'm pretty sure.  That's the values I use when I have to convert
> > those stupid size names in C structures into something that actually
> > exists, and it seems to always work.
> >
> > > i am mixing several integer types to pass to a hardware data structure,
> > > this is not enough, i need exact values.
> >
> > Oh, well, then, if you're doing something hardware specific, I suppose you
> > can say to heck with the portability aspect.  So just use char for 8,
> > short for 16, and int for 32 and be done with it.
>
> Thanks for the funny approach... Now i'm convinced that the above values
> for integers must work... Just to let you know i can't say to heck the
> portability aspect because i am porting the module, so the hell is where
> I am :)
>
> Contented, Riba.
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--
Fred Marmond
