From: ram <ram@curvesoft.com>
Subject: GRUB sample kernel question
Date: Sat, 01 Nov 2003 09:07:02 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FA3E836.4070709@curvesoft.com>
References: <Law9-F40TZiqpJjmH4P000039ed@hotmail.com> <oprxh599q8b2epmx@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <oprxh599q8b2epmx@localhost>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Hi,

I was looking at the toy kernel in the grub distribution (multiboot.h, 
kernel.c, boot.S
in the 'docs' subdirectory) and noticed boot.S starts out like this:

    .globl    start, _start
start:
_start:
    jmp    multiboot_entry
    ....
multiboot_entry:

I'm wondering why this jump is needed; couldn't the start/_start labels 
simply have
been placed adjacent to the multiboot_entry label thereby avoiding the 
jump ?

Thanks.

Ram


