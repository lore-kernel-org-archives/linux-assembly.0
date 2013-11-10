From: Blake McBride <blake@arahant.com>
Subject: Re: Need help doing a jmp rather than a call
Date: Sat, 9 Nov 2013 18:01:01 -0600
Message-ID: <l5mibj$v0t$1@ger.gmane.org>
References: <l5k8kk$9kd$1@ger.gmane.org> <CAN0_x-KsbCkp7EEasjN7UFvKR5itJ65+7RCDK2x9vxr0ji0H0g@mail.gmail.com> <l5kra0$aj2$1@ger.gmane.org> <CAN0_x-KEFpmEKzAsAUKAYhGTP4QbMpBCQvwXCq9Hhit95TnwnA@mail.gmail.com> <CAN0_x-Jt-PJQeNHTbYACafxOHjSJN_3_BAZj5UbLo2dcns27aw@mail.gmail.com> <l5lftf$c89$1@ger.gmane.org> <20131109144246.GD5152@jeffraw> <l5lnau$mpa$1@ger.gmane.org> <20131109213023.GE5152@jeffraw> <l5me18$o1e$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Another person I was communicating with suggested that the first 
argument to fun2 (GenericFunction) may be destroyed by GenericFunction 
prior to calling jumptToMethod (fun3) such that it is impossible for 
any jumpToMethod code to retrieve it for Method's (fun4) use.  I 
verified that rdi is destroyed by GenericFunction (fun2).  This ends 
the quest.  It can't be done without changing GenericFunction - which 
is not worth the effort.  The C calling mode I support that doesn't use 
the assembler works fine.

Thank you to everyone for the help.

Blake McBride


