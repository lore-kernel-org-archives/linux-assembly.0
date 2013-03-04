From: Sofiane Akermoun <akersof@gmail.com>
Subject: Re: what does this do ?
Date: Mon, 4 Mar 2013 07:07:29 +0100
Message-ID: <CAN0_x-LicuVtzdGPxwX-CJD1AiJ2gjfb+M5uKd6=DsH0-6SPzA@mail.gmail.com>
References: <20130303172104.GA2788@debian.localdomain>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=O8sOmvL8nSkgkCFZvIqMvXdmNFfwFqKmvV0UrENEKbM=;
        b=sfI/tC6jtxDUoVq1md4dezayeXu9QCQDK0V38JDWXmIDlerzZbMUhypmS+ihl49jCC
         94R8c3fyEsp97Oito82nZJUliwOxhDUVIu7tYojjhW5G1myz5D1jQZ/987Aj1ObTs9sB
         +JFNwk1XQ53CkDBI84Op8ey7acEIKmSSUPEHcyfgTMGmADu49oaaz7afhsKO7wqqvjwJ
         fCuXxwInrwpbnDbwQKlda3LvZvhxjtn6FAZr95oAeTlFKPsH1q6HRMNePSNHnzV6o4ap
         yuPlOFviewycsAZZ2Z+3bRtAAUH75RiZAOvwsb8vxC9RtlQaUNLs+NsYpwVoEFrlkVcJ
         Idtw==
In-Reply-To: <20130303172104.GA2788@debian.localdomain>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ishare <june.tune.sea@gmail.com>
Cc: linux-assembly@vger.kernel.org

Apprently here, 661b is an hex value.
You code is a bit strange because it is probably from C source that
generate asm code at runtime
But outside of the context it has non sense for me.. %c at the foutrh
line should be for string formating of a c program... and in theory if
we want to use hex value we use a "0x" prefix to avoid
misundertanding.
Do you have a link to the originall source or the project which this
code come from?

regards,

Sofiane Akermoun

2013/3/3 ishare <june.tune.sea@gmail.com>:
>
>
> here are a portion of  build-in asm code  :
>
>     "  .long 661b\n"                    \
>     "  .long 663f\n"            \
>     "  .byte %c0\n"             /               \
>     "  .byte 662b-661b\n"                       \
>     "  .byte 664f-663f\n"
>
> what is 661b ,663f ? etc .
> what do they  mean?
>
> thanks!
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Sofiane AKERMOUN
akersof@gmail.com
