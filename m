From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Example of execve
Date: Tue, 29 Apr 2003 14:39:58 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <16046.61742.822990.119167@eidolon.muppetlabs.com>
References: <20030429193112.27027.qmail@web11406.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20030429193112.27027.qmail@web11406.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> Can anyone give me an example of how can i implement
> the execve syscall under asm, because I don't know how
> to pass arrays as parameters.

You don't pass arrays per se to execve(). execve() takes pointers to
arrays. Just construct the array somewhere in your data
segment. Simple example:

section .data

str1:	db	"foo", 0
str2:	db	"bar", 0
str3:	db	"baz", 0
array:	dd	str1, str2, str3, 0

section .text

	push	str1		; filename
	push	array		; argv
	push	dword 0		; envp
	call	execve

b
