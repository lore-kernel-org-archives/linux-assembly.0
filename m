From: ishare <june.tune.sea@gmail.com>
Subject: how does ld.so call ELF's entry?
Date: Sun, 7 Apr 2013 10:19:21 +0800
Message-ID: <20130407021921.GA9462@debian.localdomain>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:subject:message-id:mime-version
         :content-type:content-disposition:user-agent;
        bh=GkJXRFcSso0EB3vdLml1rlXrFlAhvrrCH6RhzzXIFVE=;
        b=X2BHjUo/463HCkN4K9c2cUrHrfzLvMulZO2QA92IHf6EjmZGgidbE/8Wt3BZ7IxoVl
         wowPcajjKTyqy69iDiQRa03HZU+azL5uu9o0+Ozq6fCQ7eUxUuO6TPoO6MgrCKhtpBZS
         SDRVq6VJOSA93239696v8FTMRvPwdfjnEPfmMzuWg1cVeaXzkzAnpUB53WIan5VdeCvp
         wGXddD/KTRjEYr+BMFvsrepS+Nnyif8sh/Kv/LDsw6m+NNERQju4Mu7hf4+9uGCdjwPm
         4/TNZfy+Ku9VKjC+a9yITmWaIhq2yIEA2n+yH33JiZhOzVNe6e4D1vVvSFkAGJhWhlrZ
         dY+g==
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

 
  For an ELF ,which needs a interpreter , how is it  been called by the interpreter ?

  As I know the interpreter is loaded first and do something essential ,then call the main routine of ELF .
  How is this procedure implemented ?

  Thanks!
