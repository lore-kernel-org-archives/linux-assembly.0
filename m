From: "Markus Rechberger" <mrechberger@gmail.com>
Subject: Re: Assembly $0f
Date: Fri, 30 Mar 2007 17:01:47 +0200
Message-ID: <d9def9db0703300801t605d1647w8b9312bc805f108@mail.gmail.com>
References: <460D21FE.50909@um.edu.mt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=eCbFPSMXbZaOcL69rZ6xfjtxTAL99+nybEPMAaUWta1CCqK/cDWXfzKH6NK28TvlZhqddVZDq/uxcryKHSRa7QfqX41qWl8SdpCnEvX6hUkBvMsd8dVy3sta8DWIOs5DL+3l3nw3ztEG0Bizkyvqivotti4f6wqJYnoHwDHs2As=
In-Reply-To: <460D21FE.50909@um.edu.mt>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reggie Cushing <reggie.cushing@um.edu.mt>
Cc: linux-assembly@vger.kernel.org

Hi,

On 3/30/07, Reggie Cushing <reggie.cushing@um.edu.mt> wrote:
> Hi All - what does $0f actually stand for in such and expression movl
> $0f , %eax
>

mov hex 0x0f into eax

Markus
> Regards
> R.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
Markus Rechberger
