From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: ld error
Date: Tue, 28 May 2002 07:32:01 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <AC829AF8-7247-11D6-93C6-003065A88832@sonoma.edu>
References: <15603.26981.802686.899671@shub.muppetlabs.com>
Mime-Version: 1.0 (Apple Message framework v481)
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <15603.26981.802686.899671@shub.muppetlabs.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org


On Tuesday, May 28, 2002, at 04:26  AM, Brian Raiter wrote:

>> I don't think so, because the given assembly program has a main
>> function; and the tutorial has given a step by step procedure to
>> produce the executable.
>>
>> Inspite of my above statement, I am not very sure of the given
>> assembly program being complete, basically because it doesn't work!
>> But it does have a main function.
>
> Instead of having to build the link line yourself, you could just let
> gcc do it for you. That is, instead of:
>
>     ld -m elf_i386 -static average.o /usr/lib/crtn.o /foo/bar/baz 
> blahblahblah
>
> use:
>
>     gcc -static average.o

I use gas for teaching assembly language. I have my students simply
use
       gcc average.o -o average

Then they can use C library functions to do I/O. For example, I
have them use read() and write() to interact with the terminal. By
restricting them to read/write one byte at a time, I can give
several interesting assignments to help them learn how fundamental
C programming constructs are implemented at the assembly language
level. (Well, how they *could* be implemented; compilers
sometimes do silly things.)


>
> b
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
-------------------------------------------------------
Robert G. Plantz, PhD			|
Professor of Computer Science	| cs.sonoma.edu/~bob
Sonoma State University			| plantz@sonoma.edu
1801 E. Cotati Ave.				| ph: 707.664.2806
Rohnert Park, CA 94928			| fax: 707.664.3012

