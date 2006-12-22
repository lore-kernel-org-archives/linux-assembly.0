From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: suffix or operands invalid for
Date: Fri, 22 Dec 2006 08:55:30 -0800
Message-ID: <1166806530.4573.35.camel@localhost>
References: <d5418ffc0612211839n531644f2x11f8afc4f293f1dd@mail.gmail.com>
	 <458BD4BB.1050502@verizon.net>
	 <d5418ffc0612220618ra72b5dfpcca0312c356b45ce@mail.gmail.com>
	 <1166804181.4573.20.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <1166804181.4573.20.camel@localhost>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kenton Brede <kbrede@gmail.com>
Cc: linux-assembly@vger.kernel.org

On Fri, 2006-12-22 at 08:16 -0800, Robert Plantz wrote:
> On Fri, 2006-12-22 at 08:18 -0600, Kenton Brede wrote:
> > On 12/22/06, Frank Kotler <fbkotler@verizon.net> wrote:
> > 
> > At any rate I tried:
> > 
> > $ as --32 power.s -o power.o
> > 
> > $ ld power.o -o power
> > 
> 
> First, at this point, if you do
>     gcc -m32 power.o -o power

Oops. If it wasn't clear, I meant to use gcc instead of ld for the
linking phase. I.e.,

     as --32 --gstabs power.s -o power.o
     gcc -m32 power.o -o power

The "--gstabs" option will include debugging info. Then you can use gdb
to single step through your program etc. Great learning tool.


