From: Ribamar Santarosa de Sousa <ribamar.sousa@ic.unicamp.br>
Subject: Re: newbie question about integers size/portabilty.
Date: Tue, 28 Dec 2004 13:20:04 -0200
Message-ID: <20041228152004.GB7304@ic.unicamp.br>
References: <20041228122916.GA7137@ic.unicamp.br> <opsjpz0szcuqea3r@sucks.airplane.fire>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <opsjpz0szcuqea3r@sucks.airplane.fire>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Cooper <generic@xersedefixion.com>
Cc: linux-assembly@vger.kernel.org

> > 	Does anyone know where i can get a accurate table for gcc compiler?
> 
> I think that char is 8, short is 16, long is 32, and int I think is also  
> 32.  I'm pretty sure.  That's the values I use when I have to convert  
> those stupid size names in C structures into something that actually  
> exists, and it seems to always work.
> 
> > i am mixing several integer types to pass to a hardware data structure,  
> > this is not enough, i need exact values.
> 
> Oh, well, then, if you're doing something hardware specific, I suppose you  
> can say to heck with the portability aspect.  So just use char for 8,  
> short for 16, and int for 32 and be done with it.

Thanks for the funny approach... Now i'm convinced that the above values
for integers must work... Just to let you know i can't say to heck the
portability aspect because i am porting the module, so the hell is where
I am :)  

Contented, Riba. 


