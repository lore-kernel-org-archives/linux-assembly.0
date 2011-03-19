From: Daniel Hilst Selli <danielhilst@gmail.com>
Subject: Translating nasm boot strap to as
Date: Sat, 19 Mar 2011 11:48:26 -0300
Message-ID: <4D84C23A.2020504@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=6l8CofLzvOS8ZcObqZwaf/lLgdGUyn0OzSFRcxNSlak=;
        b=pswC+k1CmG7H2bUI+J2p4uGU4g16AJR228RU8nH3/QAWkgSw+YqzNKYrjIgi3mL9vD
         g9Fomy3LrDT904wot5RyXzC4exnlenypPfOHUatgrBZJgLCRd98U1fKVi3KlcwgdWJ9p
         sVr3/1Ylchy5Pz3gMOemYgLeb48VxeS6sAZSY=
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

I got some little code in intel syntax(nasm) and want to translate it to 
AT&T syntax to assembly it with as.

The code is a bootstrap and can be found here: http://ideone.com/Qldvx


I got problem to translate 2 things ..
this:

jmp 07C0h:start


I try this

jmp 0x7C0, start

but got "Too memory operands error"
I also try all order combinations plus $ prefix combinations

and to fill the file:

times510-($-$$)  db  0

I didn't find any $$ translation in as


-- 
"Do or do not... there is no try" Yoda Master
