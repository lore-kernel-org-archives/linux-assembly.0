From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Mixing C and assembly
Date: Wed, 5 Mar 2003 20:55:40 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <15974.54476.436663.588809@eidolon.muppetlabs.com>
References: <200303052350.00680.davidkedrosky@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200303052350.00680.davidkedrosky@rogers.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dAvId KeDrOsKy <davidkedrosky@rogers.com>
Cc: Linux Assembly Programming List <linux-assembly@vger.kernel.org>

> The error I am getting when I try to run the program in KDevelop (which uses 
> gcc) is:
> main.c: undefined reference to `asm_func' 

That's right. There is no asm_func symbol.

> section         .text
> 
> global _asm_func
> 
> _asm_func:

The practice of silently appending an underscore to exported C symbols
is not done in the Unix world, in general. Export the same symbol you
import.

b
