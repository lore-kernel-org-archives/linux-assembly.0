From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Need Help: Why there are two  local labels "1:" in arch/x86/boot/header.S
Date: Mon, 12 Sep 2022 21:16:04 -0700
Message-ID: <25376.1028.158994.494072@eidolon.muppetlabs.com>
References: <SYBP282MB02504399F3DCE931EA88A613AB479@SYBP282MB0250.AUSP282.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <SYBP282MB02504399F3DCE931EA88A613AB479@SYBP282MB0250.AUSP282.PROD.OUTLOOK.COM>
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: liu hang <jwegoni@outlook.com>
Cc: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

> and it jumps to start_of_setup-1f, 1f stands for local lable 1:
> but there are two local labels 1: in kernel 5.19 header.S

The "1f" syntax refers to the first line labeled "1" that appears next
-- the "f" stands for "forwards". A "1b" would reference the first "1"
going "backwards". Under this system, there are no requirements that
labels be unique; each reference just refers to the nearest label.

b
