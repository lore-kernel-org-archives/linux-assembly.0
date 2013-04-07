From: ishare <june.tune.sea@gmail.com>
Subject: Re: how does ld.so call ELF's entry?
Date: Sun, 7 Apr 2013 14:56:58 +0800
Message-ID: <20130407065658.GF9617@debian.localdomain>
References: <20130407021921.GA9462@debian.localdomain>
 <CAN0_x-Je1=2mtN8tY2mvBa-X7_P0dBoG9KRh0P63uW91eE5H2Q@mail.gmail.com>
 <20130407033913.GB9617@debian.localdomain>
 <6107E321-5746-4245-8C42-0C4E589BEE4A@ymail.com>
 <20130407034554.GC9617@debian.localdomain>
 <CAN0_x-J_7VOhzezQhWBZNAPfbREtoOkk3yMcS3kLzL5XFD5cwg@mail.gmail.com>
 <20130407045207.GE9617@debian.localdomain>
 <CAN0_x-JR2EAnN3_NZX72qRQ1DmT5-Gmd3aYw6Sw5R5_twyEiKg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=2Sa/Dl2L2tlFeTtCiHrzx6iVg+tnzSPSovy/x/fm1h0=;
        b=AtMuYYqW5bs0G1pU9QoUIcRyFQ68+wXUfQ3kBSfPdm53fSNUKV/TEFHxKYSEXscFQW
         H2/ZwSQLiBfQG/kla708dbDU2w33Ll2wds9kP2b8LvV6rFy3tPw6IfGh0wqNPDdec+ab
         iiRl7ofAf3a2uDIACJPENmAgv6xLcxqPH26ONj6dszIf7ecox1vI+L9rJKjHss70g8Np
         RSogl3lIz2HOH3eUWmoWgfK9H5IaGv4QcYt/HpXQKBSVpCGNUUJ6cKK3/i63URIPDWIs
         V4waBttuIFR6ldb3qiSalECVaZIcH2Eptbe74hBtsQA3YB+7wv9RyiQmKvEvcmGnf9MT
         f2bQ==
Content-Disposition: inline
In-Reply-To: <CAN0_x-JR2EAnN3_NZX72qRQ1DmT5-Gmd3aYw6Sw5R5_twyEiKg@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sofiane Akermoun <akersof@gmail.com>
Cc: linux-assembly@vger.kernel.org


  yeah!

  I have found the work is done through create_elf_tables() function.

  at early time kernel copy args to bprm structure , then copy it to user stack.

  I am dealing with one problem .
  
  When kernel execute "/bin/sh" , it load ld.so successfully , but without jumping 
  to the elf's entry point ,it exit ,which cause  kernel panic . 

  how can I debug for this problem ? how to catch more information for resolving it?
  
  thanks! 
