From: Frederic Marmond <fmarmond@gmail.com>
Subject: Re: 4x4 single-precision matrix product with SSE
Date: Sat, 12 Mar 2011 09:32:54 +0100
Message-ID: <AANLkTimOM=aHEbJj6us4DOX_wYsb0CuvQdqsp4aiYxcE@mail.gmail.com>
References: <4D7AA710.2030303@gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=DltoWqAv3o1ldUft5BBY/Wr+RCSaoj8HEc4T2zxhtzQ=;
        b=B6DEI15bFU/oMdva6ix4hfuZpR5rZU27XvJr+2bM5NtHnSrKxWay+S/dnLwGW1J+oG
         +FZRkOZUTklZx29j0ikiDHbdK25hOKRYN02MXK/C2Tu+YTe4PVV5czclA7R/WY4IKnsA
         RFptut+aTyV0FWb8Cw8fCt2kSp/AX2cuM73ow=
In-Reply-To: <4D7AA710.2030303@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Bock <nicolasbock@gmail.com>
Cc: linux-assembly@vger.kernel.org

Hello Nicolas,
Yes, it's the right place :)
could you please paste your code as well as your benchmark context ?

Fred

2011/3/11 Nicolas Bock <nicolasbock@gmail.com>
>
> Hello list,
>
> I am writing an assembly function that multiplies 2 4x4 single precision
> matrices. I wrote 2 versions, one using SSE the other using SSE4.1. What
> surprised me is that the SSE4.1 version fails to beat the SSE version,
> it is in fact slightly slower.
>
> Is this the right place to ask for help? If anyone is interested I can
> post some code which would maybe clarify the situation a bit.
>
> If this is not the right place, please ignore me...
>
> nick
>
