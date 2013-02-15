From: Sofiane Akermoun <akersof@gmail.com>
Subject: Re: .word _XY_
Date: Fri, 15 Feb 2013 02:21:06 +0100
Message-ID: <CAN0_x-Lj_sDKiH5nrGctsuKOfR9-Ohd=kxtdYmvV_msXqP3Zdw@mail.gmail.com>
References: <20130212071510.GA5460@debian.localdomain>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=ehMzjSV87h7NN4MXfU21PATMjIxO0iucQGI6yKHUzMM=;
        b=ndfYNZlF//+hHEIxD5uzXKaCdHi0oP6hClwb339WbrcT7Oas6ldzCc9naCINuPDzmg
         ZMKa9RJU197g/G5ybNFSglXsLAZfrNR9iDYluLL+Qyf9vVEdzfHL7KVEur5lt0LF2GL2
         NpHtvNCFKffO0D+wV8qcJo2QnOW6zoaHqWnFXH1lTirM4GZwH3Iw617VYf8TnDD9UWPV
         /tKNATmb1sj1nTPKiosVEPouPc7FDbW0VwcBZlEJmp5tinh2rtbq+vX5Qf2Z1pTNKKjS
         3+KoqNME19DCTeR8BcbITk41z7yYlKkS+rM5iqNR7n2eYLLz8sLpx2KvRd+eNx9XuO8v
         YY1A==
In-Reply-To: <20130212071510.GA5460@debian.localdomain>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: horseriver <horserivers@gmail.com>
Cc: linux-assembly@vger.kernel.org

This is related to your assembler macro syntax

_XY_ is an unitialized variable of 16 bits.

2013/2/12 horseriver <horserivers@gmail.com>:
> hi:)
>
>   this define : .word _xy_
>
>   what is this define meaning?
>   what is the  value of _xy_ ?
>   thanks!
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Sofiane AKERMOUN
akersof@gmail.com
