From: h-peter recktenwald <lx@lxhp.in-berlin.de>
Subject: Re: gas' nop(s)
Date: Wed, 7 Aug 2002 07:41:36 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020807074136.0a1c2cf3.lx@lxhp.in-berlin.de>
References: <3D4D8E7F.8A393F62@wp.pl>
	<20020805102040.7d12bd33.*@lxhp.in-berlin.de>
	<3D4EBBA5.698AA14D@wp.pl>
	<20020805222102.193b66fc.lx@lxhp.in-berlin.de>
	<3D4F9750.328C98B1@wp.pl>
Reply-To: lx@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3D4F9750.328C98B1@wp.pl>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: m_hrebien@wp.pl
Cc: linux-assembly@vger.kernel.org

On Tue, 06 Aug 2002 11:30:56 +0200
m_hrebien@wp.pl wrote:

> > asm 4 bytes shorter w/o the ".global" statement, <jnc> then w. byte disp.
> 
> Yes, right! But it still adds "89F6" padding which stands for "mov
> %esi,%esi" & my question was how to avoid this.

ok. you can not.

hp
