From: Bai Shuwei <baishuwei@gmail.com>
Subject: how to get AMD CPU identification information?
Date: Tue, 9 Mar 2010 22:27:04 +0800
Message-ID: <f3566d61003090627s7f018511t444fa28bb02b341a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=Cnx28eG6yhHPMTLIEZO+cIBepeS5KtSPB8ILWIyGptA=;
        b=cozBH2ju8OOLsw7T89d8MXabCorxkA/MDef6kvTHubCmq1QJFTg3fdn9Lx/6YgQkrf
         EzmToY4iU4VXR+fo9y74ZPTXWT5KfiPNw7HXJ/WawxCH83e18dsMzjw0/2SYacSz9a1q
         a4xmxyomuEbQJZsCEP7AEUKhsoS5bsdE2kAx0=
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hi, ALL:
   On the Intel platform, we can use the CPUID instruction to get the
processor serial number which is the identification for the CPU. But
on the AMD platform, i find only can get the cpu family,model,
stepping. I think those information cannot identify one processor. So
how i can get the identification information for AMD processor, or how
i distinguish every AMD processor?


Thanks ALl

Bai SHuwei

-- 
Love other people, as same as love yourself!
Don't think all the time, do it by your hands!

E-Mail: baishuwei@gmail.com
