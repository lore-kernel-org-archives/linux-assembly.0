From: "stonelock" <crypto_stonelock@sympatico.ca>
Subject: Re: a-Linux question
Date: Fri, 8 Oct 2004 10:43:39 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <000e01c4ad45$331af590$6740fea9@grammaton>
References: <152709311.20041007214548@home.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Claudiu Tanaselia <tanaselia@home.ro>, linux-assembly@vger.kernel.org

Hello!

Its been a while since I reformated partitions under Linux, but if my memory
is correct, you can use the program fdisk (under root) to format a new
partition. Just follow the instructions to create a new partition and to
write it to disk.

If what you're saying is that you already have a FAT32 partition then you
should be able to view it with fdisk also. There's another command to check
what partitions are active on your system but i forget.

Once you know where you're FAT32 partition is located, may it be /dev/hda6
or something else, all you need to do is incorporate an entry under the file
fstab under /etc ( /etc/fstab ). This will of course only work if you use a
linux that supports this file path. You're fstab file might be located
elsewhere or might be under a different name, or it might not exist at all
for your specific linux architecture.

If everything worked right, you're partition will be available at every boot
easily as a mountable partition or even directly if you have it mounted
automatically.

Hope this helps a bit.
aXoneX
ps: If you want a full line for an entry in fstab, let me know and i'll post
what i have so you can examine how it's done.

> Hello all,
>
> I'd  downloaded  the  a-Linux, it's really cool stuff, but does anyone
> knows how can I mount a FAT32 partition for read/write? I tried the od
> fashioned  way, but in /dev directory there were no hda6 device. And I
> need a hda6 one. How can I create one?
>
> When will it be the next release of a-Linux?
>
> Thanks,
> Claudiu Tanaselia.
>
> ------------------------------
> "Space... The final frontier"
> http://www.tanaselia.home.ro
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly"
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

