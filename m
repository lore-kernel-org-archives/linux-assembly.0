From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Linear memory
Date: Mon, 10 Jun 2002 12:35:23 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D0480EB.1050602@eprocess.fr>
References: <200205161840.LAA18243@gold.he.net>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

hi all,

I'd like to access to a memory area on a mtd device, without having 
compiling the mtd support in the kernel.
(read a firmware info, on a embeded environment => kernel as small as 
possible)
Is there any isue?

I mean:
is the device mapped anywhere, or is it really invisible, if i don't 
compile the mtd support?
If it is visible (how can i check that point?) do you know if there is 
any way to access it (like in flat mode, by a largest descriptor or 
something...)?


thanks for answers!

Fred


