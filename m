From: "Hendrik Visage" <hvjunk@gmail.com>
Subject: Re: literature for programming graphic card
Date: Sat, 13 Jan 2007 11:23:10 +0200
Message-ID: <d93f04c70701130123i472901adpb0f1817fd3d8000@mail.gmail.com>
References: <268310.40796.qm@web50301.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <268310.40796.qm@web50301.mail.yahoo.com>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Henio Paszczak <blurrpp@yahoo.com>
Cc: linux-assembly@vger.kernel.org

On 1/10/07, Henio Paszczak <blurrpp@yahoo.com> wrote:
> Hi.
> I'm looking for some good sources how to program
> graphics card in Linux does any body something like
> this :) ?

Source code would be the Xorg drivers and svgalib ;^P
(See previous thread related to programming graphics,
drawing lines etc.)


> Second, for three days I've Pentium D processor and,
> again , I'm looking for literature about programming
> two core, there is a lot of stuff in Internet but
> maybe some of You know something really good.

Refer to any text on SMP, threading, etc.
It's the same things just now you have two cpus on the same
silicon wafer enclosed and with pins added instead of one.

At least in Linux/Solaris you shouldn't have issues as long as you do the right
things to create the threads/processes that'll be distributed by the OS
over the available CPUs/cores.

-- 
Hendrik Visage
