From: Konstantin Boldyshev <konst@linuxassembly.org>
Subject: Re: Loading shared libraries in assembly
Date: Fri, 19 Jul 2002 22:23:06 +0400 (MSD)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.43L.0207192221370.1149-100000@alpha.linuxassembly.org>
References: <200207191055.05262.jborden@sorenson.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200207191055.05262.jborden@sorenson.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

On Fri, 19 Jul 2002, Jason Borden wrote:

> My question is: is there a way to load shared libraries
> and their functions into an assembly program using kernel
> system calls without having to go through libdl and friends?

Yes, and this way is to implement your own loader.

-- 
Regards,
Konstantin

