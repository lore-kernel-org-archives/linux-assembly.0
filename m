From: Sofiane Akermoun <akersof@gmail.com>
Subject: Re: how does ld.so call ELF's entry?
Date: Sun, 7 Apr 2013 05:13:37 +0200
Message-ID: <CAN0_x-+5CYN5L4pPCVd_V095canJJuc6D10cv9scTvyndPv2LQ@mail.gmail.com>
References: <20130407021921.GA9462@debian.localdomain>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=On8s9Q8dSKBrv3z+zqUI/HQYOPOhFypt70UYJZL/kYg=;
        b=Ozr85Dnc2PJjk7n/juK1W9+X+wa+Qhm2zJQn8USnSEwYgxOA1v7msaUzDcucwEnudi
         BVGiUJXSSS3IOplmGmCPf+FhmkvFSnFCw+v8SeuBDsp5bme8sRNVA2Hvvd/fen4jhkee
         DFgnhL5h6YR1sBN73A2h4XdQITTqo6HMuPnpYnjtOAZ8EW8CsNmO5Jpcr0+nQv0UlU3w
         oOd7H5OyhXH55FbDTsAVC24ZIoWOcI8A6FZcynciwgWSaLs3n53hOLwlWqhNqHRIwl6S
         ocBkE5XKsETq5nWQorB966B7PtLArYVWFjZHV7QA+UIsm1cMRIeJGYJTsYrBYRaxwGb6
         672Q==
In-Reply-To: <20130407021921.GA9462@debian.localdomain>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ishare <june.tune.sea@gmail.com>
Cc: linux-assembly@vger.kernel.org

Hello,


The interpreter is specified during linking process and the program
header of your binary is filled with good values.
Then when the operating system load your binary, he finds next the
interpreter to use.
The linker ld sets the good values by default but you can overwrite it
or specify other values if you want.
The steps are:
1)The operating system loads your binary
2)The program loader system execute the Interpreter specifiy in the binary
3)The interpreter gather all the dynamic libraries needed in memory
4)The Control is passed to the entry point of your program

The entry point is specified in your code source as a "global". And
could be find in your object file by the linker.
In theory there are some defaults tag to specify entry point, like
"..start" for nasm, but you can also passed yours to the linker (ld
-e).

regards,

Sofiane Akermoun
akersof@gmail.com

2013/4/7 ishare <june.tune.sea@gmail.com>:
>
>   For an ELF ,which needs a interpreter , how is it  been called by the interpreter ?
>
>   As I know the interpreter is loaded first and do something essential ,then call the main routine of ELF .
>   How is this procedure implemented ?
>
>   Thanks!
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Sofiane AKERMOUN
akersof@gmail.com
