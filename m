From: anil kumar <m.anilkumar80@gmail.com>
Subject: meaning of .section ".bstext", "ax"
Date: Wed, 14 Apr 2010 16:36:31 +0530
Message-ID: <h2h887f81cc1004140406m77e45985u21ab9940ea87d33c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:received:message-id
         :subject:from:to:content-type;
        bh=R8DHFAPHyRTK7Y7Rh0Dwa7J8s1qeTPW4NSvhmGLP6bY=;
        b=BM7KczVpeJ3ZQji/6e6qM9nrsY4JTBRj7f3yTSLEZitMVhk71AbPkjB0gwhMsM18Ry
         bE5Er9SNNI8IBJgUbGr3a3vv2NqrKpTgHvtK/XqYih1//9o2IUwl+I7NcjO5gdQQnjYB
         cewrAFQ09/ZETdV/l6eVxtNaYL+yDLhn7ToW4=
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hello,
I am trying to understand assembly code written in arch/x86/boot/header.S code.
I am not able to grab meaning of following line:
 .section ".bstext", "ax"

Can you tell meaning of this line ?

Thanks,
Anil

PS: It would be great help if someone can point any link which explain
code mentioned in this file.
I am not able to locate any good link using google search engine.
