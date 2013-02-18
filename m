From: horseriver <horserivers@gmail.com>
Subject: different asm code
Date: Mon, 18 Feb 2013 13:06:30 +0800
Message-ID: <20130218050630.GA11240@debian.localdomain>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:subject:message-id:mime-version
         :content-type:content-disposition:user-agent;
        bh=HjHpeVHhZSgNopWuM2FtHAJoW18bia4yHDs0+8vY9MQ=;
        b=Gl25/J/aMzfbWhEvZ6LZXL3Pz/krn5dpv3bLJS+mFTarMY8xwfRVSCnF6/kAC3OapH
         xjBG+MVp/oQt1GWBPkwtUhwogWT0qVwT3RgCdgxakQW6DwiLxJlvYua+/JlQw5NvpUng
         FY8xglRnL1E6s9kY0pMDo62Nm1t+LQ1EPzuQJGpKCRWJQguOcCicUeuSWLF2kH2Qtvxo
         DLvTqI7bb6g07VRs78uDlxs3yv+BK37AU+pDjjnzbUSP7S5pN0wuH5MIsnIbXw8O/cgp
         Q09S9uTcYvxO7HIGlnZ/fA9i2W9FJKlpR87OeaLpJXPIXKnXWQEYVWIx0cFwIYdaOPhn
         U9Rg==
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

hi:)

  I have compiled a .S file ,using command gcc -c x.S -o x.
  Then I use objdump to look up its asm code, even find that some code is not the
  same as that .S file , more important is , some code in origin  .S file has disappear .
  
  what is about the reason ? If it is due to version , why some code chould get lost after compile?


thanks!
