From: Mateusz Marzantowicz <mateuszm@server.pl>
Subject: Re: GCC Optimization?
Date: Tue, 23 Nov 2004 17:43:26 +0100
Message-ID: <41A368AE.8020407@server.pl>
References: <2462.1101169594@www25.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <2462.1101169594@www25.gmx.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

> Second question:
> What does mov $0x0,%eax? Why dont they use xor %eax and what is it good for?
> 

It's because GCC was designed for more processors than only x86 based 
and in some cases it won't work. With optimization enabled you will find 
there xorl %eax, %eax instead of mov $0x0,%ea

Regards
