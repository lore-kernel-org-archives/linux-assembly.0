From: Konstantin Boldyshev <konst@linuxassembly.org>
Subject: Re: chdir command
Date: Mon, 6 May 2002 10:32:36 +0400 (MSD)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.43L.0205061030420.1494-100000@alpha.linuxassembly.org>
References: <3CD2EAF6.5A27E998@exeter.edu>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3CD2EAF6.5A27E998@exeter.edu>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

On Fri, 3 May 2002, Allan Wooley wrote:

> section .text
>     global _start
>
> path    db '/root',0
>
> _start:
>
>     mov ebx, path
>     mov eax,12
>     int 80h
>
>     mov eax, 1
>     int 80h        ;; int 0x80
>
> Although I have gotten system calls 1, 3-6 & 11 to work fine in
> assembly
> programs, I can not get the change-working-directory call to work.

Make sure you have needed permissions. Which error do you get?

-- 
Regards,
Konstantin

