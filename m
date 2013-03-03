From: ishare <june.tune.sea@gmail.com>
Subject: what does this do ?
Date: Mon, 4 Mar 2013 01:21:04 +0800
Message-ID: <20130303172104.GA2788@debian.localdomain>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:subject:message-id:mime-version
         :content-type:content-disposition:user-agent;
        bh=HpbmrYKmI9NONdmzsEQvHz6W9xlTQhjv/2dStGPQ+i8=;
        b=Q5giKgrp+QUggoPP76QLF76gs3MlEAn4hRaqw6S5h34EExny00zGzfRgZ0zzvUOz9D
         Vr0Rq++PIYBnXjSyeE+B55fNvEvD8MYTt4YC2QdQE/wsUmA2VaSSdMiHNYme9czKwN6b
         9geaJIH61r3DCZ+JAjUD2wCkK2HyiDL9xheeE9qYJdzQAWPhYn6LIya/T35XfO3B9UOU
         yzJj1EliejpcnBDhIVFOWET3HmXXLglA7A4jo+/hPSB8GT7oBNnSTkVMT/b+0SZjs34u
         Ijp5MgkI01yN66ZzhL4dJ1nbQeAgSTAXKTQq9/zzKlXYfim+K673sWUBZ98Y+G8Wq/6W
         2xgw==
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org



here are a portion of  build-in asm code  :

    "  .long 661b\n"                    \
    "  .long 663f\n"            \
    "  .byte %c0\n"             /               \
    "  .byte 662b-661b\n"                       \
    "  .byte 664f-663f\n"

what is 661b ,663f ? etc . 
what do they  mean?

thanks!
