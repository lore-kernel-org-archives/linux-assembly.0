From: Konstantin Boldyshev <konst@linuxassembly.org>
Subject: Re: Linear memory access
Date: Wed, 12 Jun 2002 10:58:39 +0400 (MSD)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.43L.0206121054500.1726-100000@alpha.linuxassembly.org>
References: <3D06ED6F.6090804@eprocess.fr>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3D06ED6F.6090804@eprocess.fr>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

On Wed, 12 Jun 2002, Frederic Marmond wrote:

> I'd like to access to a memory area on a mtd device, without having
> compiling the mtd support in the kernel.
> (read a firmware info, on a embeded environment => kernel as small as
> possible)
> Is there any isue?
>
> I mean:
> is the device mapped anywhere, or is it really invisible, if i don't
> compile the mtd support?
> If it is visible (how can i check that point?) do you know if there is
> any way to access it (like in flat mode, by a largest descriptor or
> something...)?

It should be visible, but you need to know its address.
If you want to access it from userspace, use /dev/mem.
(from kernelspace all is as usual).

-- 
Regards,
Konstantin

