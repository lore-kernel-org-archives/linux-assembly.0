From: Konstantin Boldyshev <konst@linuxassembly.org>
Subject: Re: a-linux:   Kernel panic:  No init found
Date: Sat, 26 Oct 2002 14:36:17 +0400 (MSD)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.43L.0210250615001.1152-100000@alpha.linuxassembly.org>
References: <20021024182717.63201.qmail@web40207.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20021024182717.63201.qmail@web40207.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Darius Stout <darstout@yahoo.com>
Cc: linux-assembly@vger.kernel.org

On Thu, 24 Oct 2002, Darius Stout wrote:

> ../bootdisk.bash a-linux.img /home/download1/alinux/asmutils-0.17 /mnt
> > new_boot.img

I guess that you are doing something very wrong here.
First, you need kernel binary.
Then, you need to compile asmutils.
In the end, to generate bootdisk, something like:

./bootdisk.bash bzImage /home/download/alinux/asmutils-0.17/src /mnt >boot.img

-- 
Regards,
Konstantin


