From: Hendrik Visage <hvjunk@gmail.com>
Subject: Re: different asm code
Date: Mon, 18 Feb 2013 17:22:32 +0200
Message-ID: <CADtGFvkFR_rGnC18Z+yYFObtVOAQPXo1KrrNfT1_kOb-3Zg4XQ@mail.gmail.com>
References: <20130218050630.GA11240@debian.localdomain>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=7MxKfJXThXJZ++9AwdWWRBhQlC3a0Y67zkfA9CziHWA=;
        b=AFGvrjBjMrzLLVWVWFrp8kSlCJ05gAy2QN4kaplK0f9ZKw79JFk7r1RnA+xt6L6EKq
         t9fPJfpfyH/MWJsdzsfBSVRx18yR812oXsiP2ZSktbSyS1nX+FowWiIHX19fdbfxsSQ6
         G2QNRP/ZukX/6/r3ZoKiPNUeqfDnUJlVO14YDUqFcAgNTNn7Cxl7pCwePphL6xyD2oUP
         U1ehV9fdTs9k2PI350SGMnR4QHI3k48rb+KuIO2kymm1qIdQTWcPniYWoI05mAP+2/Ml
         RAHEFFl48AQ1BwJ3lt4oH2ObSfK+tHZ2nUNEn3QrQ6uUtgQLZlXIH3BmOS+bwnzWOIfE
         AcEQ==
In-Reply-To: <20130218050630.GA11240@debian.localdomain>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: horseriver <horserivers@gmail.com>
Cc: linux-assembly@vger.kernel.org

On Mon, Feb 18, 2013 at 7:06 AM, horseriver <horserivers@gmail.com> wrote:
> hi:)
>
>   I have compiled a .S file ,using command gcc -c x.S -o x.
>   Then I use objdump to look up its asm code, even find that some code is not the
>   same as that .S file , more important is , some code in origin  .S file has disappear .
>
>   what is about the reason ? If it is due to version , why some code chould get lost after compile?

Give examples please.

There are several "similar"/equivalent code/instructions that the
assembler could chose from.

Ie. to zero a register, you could
1) mov REGISTER,0
2) xor REGISTER, REGISTER
3) mv REGISTER,g0 (on a SPARC where g0 is always zero)
