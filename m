From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: Troubles with JIT compiler
Date: Fri, 22 Jan 2010 08:50:32 -0800
Message-ID: <1264179032.1974.5.camel@bob-desktop>
References: <cb4d391b1001212012l654d2a93qe8d05187f8f5ecf0@mail.gmail.com>
	 <1264137975.1983.30.camel@bob-desktop>
	 <cb4d391b1001212204u73bbda5cub4e36e88836a2972@mail.gmail.com>
	 <1264143669.1983.38.camel@bob-desktop>
	 <cb4d391b1001212316p736a62cfrce0f5ad43896f671@mail.gmail.com>
	 <cb4d391b1001220245n61ff839elc19851404017f4a3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <cb4d391b1001220245n61ff839elc19851404017f4a3@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Scott Sibley <sisibley@gmail.com>
Cc: linux-assembly@vger.kernel.org

On Fri, 2010-01-22 at 04:45 -0600, Scott Sibley wrote:

> After someone's tip, I found a solution to this. Passing the linker
> '-z execstack' made it run, no problem. It's funny that Linux didn't
> complain about it, but rather just seg-faulted.
> --

Thank you, Scott, for sharing the solution with us.

According to the man page for ld, that option "Marks the object as
requiring executable stack."

I don't know much about jit compilers, so I can't comment on the GNU
development environment not complaining about it. I do know that if
there is something we don't like about it, we can get double our money
back. :-)

--Bob


