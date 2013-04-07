From: Sofiane Akermoun <akersof@gmail.com>
Subject: Re: how does ld.so call ELF's entry?
Date: Sun, 7 Apr 2013 09:47:59 +0200
Message-ID: <CAN0_x-K9fZHzN1yk1C0W7-LBwCnmOHhDG8n4TmDXTaVEBRWVDQ@mail.gmail.com>
References: <20130407021921.GA9462@debian.localdomain>
	<CAN0_x-Je1=2mtN8tY2mvBa-X7_P0dBoG9KRh0P63uW91eE5H2Q@mail.gmail.com>
	<20130407033913.GB9617@debian.localdomain>
	<6107E321-5746-4245-8C42-0C4E589BEE4A@ymail.com>
	<20130407034554.GC9617@debian.localdomain>
	<CAN0_x-J_7VOhzezQhWBZNAPfbREtoOkk3yMcS3kLzL5XFD5cwg@mail.gmail.com>
	<20130407045207.GE9617@debian.localdomain>
	<CAN0_x-JR2EAnN3_NZX72qRQ1DmT5-Gmd3aYw6Sw5R5_twyEiKg@mail.gmail.com>
	<20130407065658.GF9617@debian.localdomain>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=7xhnhGKOvM3RgIMX51HNxnwgsDWPSAEI9B27m0d11qg=;
        b=M6jymEI7CvZdI8TgsQSfo6GTh3QKiUbzQG1SCB9JiXa4+WTjU+dxjcjhyLe8RQ5QSE
         F/KuxjchpIRz0189cwVHCx2/CMUNC2q5TIneOAsSVTe3yEmmhzC7WJrZb6TtYliQOQNV
         8bZ7PC9qaKb44MLEyoAWnVtOw+PtdE0ZuskFsOuH0dNc+yjU3IF7puZqNKEAhTvbSy7q
         6WKy09oXktecd+SXFWK8pVw98W7M9z8tbrAZxCkWK5OwRuwdUfiV/QO109POuy6qGTNB
         qyPN1xYMClzkZdoXA+fsphhPT04sWO8sfYltTJDXB4n1ZK5SyjCr24YMH1/z5kLDRV5w
         R3Rg==
In-Reply-To: <20130407065658.GF9617@debian.localdomain>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ishare <june.tune.sea@gmail.com>
Cc: linux-assembly@vger.kernel.org

I don't know what you are doing. if you are writing your proper
assembler, or whatever. But the standard tools are gdb, printing on
screen information like addresses. if it is kernel related then kdb
and an emulator like bochs, qemu or virtualbox to avoid kernel
freezing in performing remote debugging.

Although it is interesting, without asm code not sure it is the best
place to talk about inner operating system mechanism.

regards.

Sofiane Akermoun
akersof@gmail.com

2013/4/7 ishare <june.tune.sea@gmail.com>:
>
>   yeah!
>
>   I have found the work is done through create_elf_tables() function.
>
>   at early time kernel copy args to bprm structure , then copy it to user stack.
>
>   I am dealing with one problem .
>
>   When kernel execute "/bin/sh" , it load ld.so successfully , but without jumping
>   to the elf's entry point ,it exit ,which cause  kernel panic .
>
>   how can I debug for this problem ? how to catch more information for resolving it?
>
>   thanks!



-- 
Sofiane AKERMOUN
akersof@gmail.com
