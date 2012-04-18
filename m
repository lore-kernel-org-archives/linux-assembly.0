From: Daniel Hilst <danielhilst@gmail.com>
Subject: Declare strings on stack, gas
Date: Wed, 18 Apr 2012 14:58:13 +0000
Message-ID: <4F8ED685.2030408@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=gS8OPDH8i/C0vlIktva+laFCN6SLsC9R8CFLA0Z7AzQ=;
        b=OZW9vgKi0/ryJ1TYwiVS36/cQqkmLr1cPnHUSpKofGdtIE1naHKnmd9Pxd91+r1tu4
         Sgt1mVar5NV87LivXFxEc/D/WVuiAPtk+LP8uu3C8nWkpTOGFF6S6kem9L9kwuCIU+On
         pL7MzhtY3YsEBHlgL4i/esncPeAS9RmbnVL9EAbMif/m43G7yXLegDMU7vOcm1dMvMdj
         tN8Z1pfLQl+SnW6YxlEcT6/awEmdKS6cw9ro5vi4upzxNTHpm3L2vHgHdXyyTrPpsOK9
         zGG7nl6YhS66Pl0uj9Vny1eRzbLfIttMyBCAmgZS5mKHrHqhAkCphSsDRAhb3FNOd2/N
         iaTA==
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Is possible to declare strings on stack? I'm using mov + ebp offsets to 
do something like that.. Is there an easier way to do it?

Here is an sample off how I'm doing it: http://sprunge.us/UUZI

The hex numbers are a "Hello World" string..
I have tried .assci without success :(

Thanks in advance!


-- 
Follow the white rabbit!
