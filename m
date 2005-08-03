From: Claudio Fontana <sick_soul@yahoo.it>
Subject: Re: im news, heres why
Date: Tue, 2 Aug 2005 17:35:49 -0700 (PDT)
Message-ID: <20050803003549.58625.qmail@web26001.mail.ukl.yahoo.com>
References: <20050802233131.99326.qmail@web34012.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20050802233131.99326.qmail@web34012.mail.mud.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: a c <notawwal@yahoo.com>
Cc: linux-assembly <linux-assembly@vger.kernel.org>

This is not very much assembly related, however here
are my 2c:

--- a c <notawwal@yahoo.com> wrote:

> i wanted to know about this, hopefully someone on
> here
> can look at this and decode it, its a packet,
> unfortunately i forgot to -s 0 on tcpdump before i
> saw
> it
> but ive seen it a few times before and this is as
> long
> as it gets
> 
> 04:04:39.6808717 00:XX:aa:XX:aa:XX 0000592
>  0x0000 4500 0240 7678 0000 4011 fd35 0000 0000
>  0x0010 ffff ffff 0044 0043 022c f66a 

IP HEADER
=========

IP version=4
IP header length=5*(32 bit words)=20 bytes
Type of service=0 (unused)
datagram size(header+data)= 0x0240 (576 bytes)
ID=0x7678
Flags=none
13 bit fragment offset=0
Time to live=0x40 hops
Protocol=0x11 (17 = UDP)
Checksum=0xfd35
Source address=0.0.0.0
Destination=255.255.255.255 (!)

UDP header
==========
Source port=0x44 (70)
Destination port=0x43 (69) - possibly a TFTP service
(Trivial File Transfer protocol), or whatever process
happens to be listening there (I think it is used by
MS worms too)

Length(header+data)=0x022c (556 bytes)
Checksum=0xf66a

Transported Data (first bytes, total size of payload
is 548 bytes)

>                                       0101 0600
>  0x0020 7aa4 e836 000a 0000 0000 0000 0000 0000
>  0x0030 0000 0000 0000 0000 0000 d0a4 0214 0000
>  0x0040 0000 0000 0000 0000 0000 0000 0000 0000

It does not look like a valid TFTP packet (filename?
mode of operation?). It might be a customized
TFTP-like protocol or a worm or both or none.

Good luck

Claudio


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
