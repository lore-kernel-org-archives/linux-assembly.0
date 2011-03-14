From: Nicolas Bock <nicolasbock@gmail.com>
Subject: latency and throughput
Date: Mon, 14 Mar 2011 16:44:28 +0000
Message-ID: <AANLkTimcg5GDxtn=NUDiZtM9W-S-xaTHYanUGtEEHX1M@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:from:date:message-id:subject:to
         :content-type;
        bh=W204pboxBlLyVmbx+R+u9nXabMZ4NabMN8BLHpCLC4Y=;
        b=Ky57sPkGP2eaDA+jk1SpEmKZsY8LkRa3ahtWBDpS4A2gOet1huc46SBTKpPn0I6DKn
         Pk/MjPKIUy6476lWKiaaSbnbGdK4Lywip5NLF1zzebOODFa5fA1AM6gLXA/254d7wxv5
         4hGJXqyjQ8kCtSGVj+0R8KlPlawAhb2OjzzOg=
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hello list,

how would one go about analyzing an assembly code in terms of data
dependencies and instruction latency and throughput? What I am looking
for is a way to help me analyze the potential performance of an
instruction sequence and a way to tell me where I could possibly
improve the sequence due to data dependencies, i.e. instruction
latency issues, or instruction throughput issues. Although I can
lookup the latency/throughput values in the Intel Optimization manual,
I still have a hard time figuring out how to estimate the issue rate
of the processor and therefore how the instruction overlap in the
execution core.

Thanks in advance,

nick
