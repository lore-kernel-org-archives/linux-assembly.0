From: hpr <phpr@snafu.de>
Subject: Re: Newbie Question
Date: Fri, 28 Feb 2003 06:28:27 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200302280636.h1S6afXG014076@hirsch.in-berlin.de>
References: <1EAF5F87-4AAD-11D7-BC68-0030657C1952@sonoma.edu>
Reply-To: lx@snafu.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <1EAF5F87-4AAD-11D7-BC68-0030657C1952@sonoma.edu>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert G. Plantz" <plantz@SONOMA.EDU>, dAvId KeDrOsKy <davidkedrosky@rogers.com>
Cc: Linux Assembly Programming List <linux-assembly@vger.kernel.org>

Robert G. Plantz am Donnerstag, 27. Februar 2003 23:42:
> Assuming that you want the (16-bit) word at address 1234 to be loaded
> into ax, I see two problems:
> a. address 1234 probably cannot be accessed by your program, and
> b. linux is unhappy if you change ebx. (Your program needs to
>     save/restore ebx.)

not linux, but (probably) "C"...
i/o related syscalls use ebx for the file descriptor

hp

-- 
Linux,Assembly,Forth: <http://www.lxhp.in-berlin.de/index-lx.shtml>
    pse, reply to << lxhp -at- lxhp -dot- in-berlin -dot- de >>
