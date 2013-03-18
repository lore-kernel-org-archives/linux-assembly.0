From: Sofiane Akermoun <akersof@gmail.com>
Subject: Re: how to disassembly a specified section
Date: Mon, 18 Mar 2013 16:31:58 +0100
Message-ID: <CAN0_x-Lv2376KCHXQHOeHXZAdLj8sH8VXTdP+HPtGTWs78ty9w@mail.gmail.com>
References: <20130318145223.GA25403@debian.localdomain>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=yXuet6I1aFZb5K+1tIhcdLfchb40a6s1pLje7xP8PaI=;
        b=KL5eUY9k0CqUgEe/zdewIPOxjRqtiOqjcgKT6gTIv53w1j5us44mqF6gFA4H7Un7W5
         z8O5CnHv/8PxUSFvwoLqMA78fCqE8lVyivKChpiyuqKSZodYAvk6w3n8l4SNUWcv6oSp
         7s2EPquwow2zE5YmDqoIWnubgY+5Y/RwihOaMotbCiWfNXf++QwFuK2monIEVzsGLKd/
         t6GfrHqcg1C0SAzeWMIHqR99/3uhWXpDfXg3Av8E8kLs4nbhsb4njTy84qzkO2db67ae
         oNcoaCHBMwpVEpcOvFOt0lIKki7+M4np1Hs6XXn4AQDXphmRUACP8sv8BLC8O+U7sy1q
         +CLg==
In-Reply-To: <20130318145223.GA25403@debian.localdomain>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ishare <june.tune.sea@gmail.com>
Cc: linux-assembly@vger.kernel.org

Hello,

"readelf" is a tool for reading elf structure.
use "man readelf" or google it for full options.. there are a lots
(section headers, etc..)
For disassembling a specific section you can use objdump with the "-d"
for disassemble and "-j nameofthesection"
Else use a GUI tools like IDA.

regards,

Sofiane Akermoun
akersof@gmail.com


2013/3/18 ishare <june.tune.sea@gmail.com>:
>
>   I need to look up the disassembly  content of a section in an elf ?
>   how to type that command ?
>
>   thanks!
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Sofiane AKERMOUN
akersof@gmail.com
