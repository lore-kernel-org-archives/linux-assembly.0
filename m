From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: ENTRY
Date: Sat, 20 Jul 2002 06:44:59 -0700 (PDT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <15673.26971.804016.201012@eidolon.muppetlabs.com>
References: <20020720132900.482255db.h.vanberkum@chello.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20020720132900.482255db.h.vanberkum@chello.nl>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: h.vanberkum@chello.nl
Cc: linux-assembly@vger.kernel.org

> I have searched all over the net for the ENTRY instruction. It is
> found in the linux bootcode( head.S) . Could someone please point me
> to some documentation about this instruction?

It's not an instruction. It's a macro. Look at the #includes for
head.S to find the macro definition (linux/linkage.h in this case).

b
