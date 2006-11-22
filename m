From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: GAS colorr pixel problem
Date: Wed, 22 Nov 2006 14:45:21 -0800
Message-ID: <1164235521.5255.62.camel@ubuntu>
References: <BAY22-F33AC6FFC9C9C95246563DF5E30@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <BAY22-F33AC6FFC9C9C95246563DF5E30@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: A D <a_d_249@hotmail.com>
Cc: jylam@lnxscene.org, linux-assembly@vger.kernel.org

On Wed, 2006-11-22 at 16:08 -0500, A D wrote:
> Again my thanks goes to Jean-Yves Lamoureux and all the forum members. That 
> is all i wanted to know.
> 
> --STeve

Also, if you use C libraries for your I/O, you can assemble your
assembly language source files with
   as --gstabs -o foo.o foo.s
where --gstabs gives you debugging symbols. Then use gcc to
link your object file(s), even if you have only one file:
   gcc -o myProg foo.o

gcc recognizes that the input file is already an object file,
so it goes directly to the linking phase. The advantage of
doing it this way instead of using ld is that gcc will
automatically find the C libraries for you. If you use
ld, you need to explicitly list the C libraries.


