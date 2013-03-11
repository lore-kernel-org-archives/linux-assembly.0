From: Sofiane Akermoun <akersof@gmail.com>
Subject: Re: [NASM] ROR -> error: invalid combination of opcode and operands
Date: Mon, 11 Mar 2013 23:40:05 +0100
Message-ID: <CAN0_x-+Bf2aZt45+QrvnMav-LVejdzKbiKVNT-Qvh1j-CoMkbw@mail.gmail.com>
References: <CAPf=7QaV18vMLRrG6fuApkOpVEE5LmVnDKfxd=S8kWRz8S=qiQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=Mp5IE9ImCydMF9h+ba0mJhlD8skRcIh6MQwv0+4dia8=;
        b=wO0Fsz/8mItbBf2d3c4GTFrZVMXLR3NUlhYaYXDZwNaW0VF1YRvawSAg4S3IkHt8jj
         j7QegFxFW4lDJtuLRppVUve4srBFSEMxmpDt+VQcWPxJbPOzHCTSHh+vWvEyWEreywsa
         M9yp/ZKf9FLrlVEEiuV+3GH/JpDhL/ze9SMLQ3qjGOy/frKiSpzaUNKdjU0p1fzAHS8C
         zGfHHchiuaLDIihCaQF3oDy4Vxqjk902xsmV47XZMRojk2L0yIFfyCtFrBtrPm7HxLPU
         /6sbW8z5ddlsc6t74tNaNTdnc1wjMUDVvppl4GjjVPLioA6SyPoJgouTp9j0bDA79tIi
         AVbg==
In-Reply-To: <CAPf=7QaV18vMLRrG6fuApkOpVEE5LmVnDKfxd=S8kWRz8S=qiQ@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Meher Assel <asselmeher@gmail.com>
Cc: linux-assembly@vger.kernel.org

As mentioned in your error the combination of opcode 'ror' and
operands 'al' and 'bl" is bad.
If you read the documentation you will see that ror just support the
following expressions:

ror r/m8,1
ror r/m8,CL
ror r/m8,imm8
ror r/m16,1
ror r/m16,CL
ror r/m16,imm8
ror r/m32,1 D3  /1
ror r/m32,CL
ror r/m32,imm8

It means that unless your second operand is the CL register, you need
an immediate value for your second operand.

kinds regards,

Sofiane Akermoun

2013/3/11 Meher Assel <asselmeher@gmail.com>:
> Hello all,
> why i can't do ' ror al,bl' ?
> i'am using nasm in 16bits mode ( [BITS 16] )
> i get this error when compiling:
> error: invalid combination of opcode and operands
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Sofiane AKERMOUN
akersof@gmail.com
