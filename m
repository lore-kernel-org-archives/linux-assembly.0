From: horseriver <horserivers@gmail.com>
Subject: what does this do?
Date: Mon, 18 Feb 2013 04:46:51 +0800
Message-ID: <20130217204651.GA8312@debian.localdomain>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:subject:message-id:mime-version
         :content-type:content-disposition:user-agent;
        bh=bH2jBceVaJ3T4/Hi9zY8e9MJ5uNYeroK9WEff9qCmHA=;
        b=HiDCGIT5xyNFjwilweThyhKcITfCoRSlcFYGymJl/mmV6S9P5wez4pdrl8p21Be95D
         3ODIOaK+Kkn20BYq3ZK4FOdGnv8TZWskh1H4MaVPj/wDssRlWmMAR9vtZ7FIn9UUfKge
         x3TIg53fjhbMxmJXtQzMXzT3q1u2Cm7r4u10wzTzMFYQdsdvw3sixF3PxWuv6ldwbdbl
         NxsXz1lCVIgY8duQYRV+3ZRRMoJBc+UEwGGtzcT7b4za4eIaSh1KsSHPrtdLasZUure9
         SSqahJyQFj8KlhPFR3bIZEpzSOoXmrZu/DxGgR9feKvMjQVnsSePZEg/DRTf0nyuBMOh
         DF3A==
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

hi:

   what does this code do ?
	lss    0xc010020c,%esp

  does it need to addressing gdt entry?

thanks!
