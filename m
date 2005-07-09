From: Paolo Ornati <ornati@fastwebnet.it>
Subject: Re: x86 Endiannes and libc printf
Date: Sat, 9 Jul 2005 10:19:37 +0200
Message-ID: <20050709101937.0aad4448@localhost>
References: <42117.62.38.142.34.1120849517.squirrel@webmail.wired-net.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <42117.62.38.142.34.1120849517.squirrel@webmail.wired-net.gr>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: nanakos@wired-net.gr
Cc: linux-assembly@vger.kernel.org

On Fri, 8 Jul 2005 22:05:17 +0300 (EEST)
"Nanakos Chrysostomos" <nanakos@wired-net.gr> wrote:

> int main()
> {
>         char *filename= "endian.txt";
>         unsigned long buf;
>         char *k=(char *)&buf;
>         int fd;
> 
>         fd = open("makis",O_RDONLY);
> 
>         read(fd,&buf,4);
> 
>         printf("%.4s\n",&buf);
>         printf("%p\n",buf);
>         printf("&buf: %p %#x %p\n",&buf,*k,k);
>         return 0;
> }
> 
> endian.txt
> ----------
> DBCA
> 
> 
> #./read
> DCBA
> 0x41424344
> &buf: 0xbffff8b0 0x44 0xbffff8b0
> #
> 
> 
> In the first printf everything is fine.In the second printf we see
> that the 0x44,0x43,0x42,0x41 byte-data is printed in the revserse
> order,while we can see
> that in memory it is in the right order after the read system call.Why
> this happens?Is it being internal in printf???


No, it isn't printf... it's just that x86 CPU are little endian.


When you do:
	printf("%.4s\n",&buf);
you are printing these four bytes in memory-order.


When you do:
	printf("%p\n",buf);
you are treating "buf" as a single number. Since your CPU is little
endian it expects the low order bytes to come first.


Another example:

#include <stdio.h>

int main(void) {
	unsigned int buf = 0x11223344;
	unsigned char *x = (unsigned char*)&buf;
	printf("0x%hhx\n", x[0]);
	return 0;
}


printf will print 0x44... simply because the 0x11223344 numer is stored
in memory in this way:

address		value
&buf		0x44
&buf+1		0x33
&buf+2		0x22
&buf+3		0x11


For more info about x86 CPU look here:

http://developer.intel.com/design/pentium4/manuals/index_new.htm

-- 
	Paolo Ornati
	Linux 2.6.12.2 on x86_64
