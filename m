From: Sofiane Akermoun <akersof@gmail.com>
Subject: Re: varibles define
Date: Fri, 15 Feb 2013 02:21:51 +0100
Message-ID: <CAN0_x-+7VX83L19-oFXXut-YFQOFjCiUv4-QdnGVp+OrJavNaw@mail.gmail.com>
References: <20130213043445.GA20051@debian.localdomain>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=WWWTucDL9pOX5BmvFT3DW9/iuV9+zYu5MV9dAeRIlTo=;
        b=Qgs7CE+CUQFAoqFW5cnnsAfIos7NURy9qSHLVY+enj7ZY6xCXiPq88waq7jetBicsF
         GP+BpOk1EWZygE42qWpjRfU7ch5vVbSxUzrRR0cW0t8s9+6tND5SR4Vzww1dcg3Yt6mL
         csZKImgktNlYh4yKZrd2eqOE52CeQFwth5ox5bbi/yS7CulwhvG2Xey2l7M29Dgsxb7H
         Ts2/YvjDt+t77q5agKjN08r6qcOQsMKo1w1S1YX9jVvnIDTGqSYf+UvHWkzg3+k/lOtZ
         KhC6kotT24bDj9OIVG4y/iGYi+XvGHSfI6js3Feos+HLY5vts5zuDZQKmAqyXv6pufwv
         6DNg==
In-Reply-To: <20130213043445.GA20051@debian.localdomain>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: horseriver <horserivers@gmail.com>
Cc: linux-assembly@vger.kernel.org

Definition in .text will stay in .text at the same position you defined it.
Of course when the code is executed the cpu doesn't know at all that
he is reading a string for example or an executable code

You can do this:

...execution flow started...
jmp lb1:                                    // jump to avoid the cpu
to interpret the variable definition as code
mystrind db "hello world!", 0h      // definition of a variable here
lb1:
....execution flow continues here

else the best is to store you data after the exit of the program

Never do something like this below:

some instruction
some instruction
mystring db "Hello world!", 0h  // definition here
some instruction

In the example above the hexa version of "hello world!",0h will be
read and executed by the cpu and it is not what we want

regards,

Sofiane Akermoun
sofiane.akermoun@datalabsecurity.com
akersof@gmail.com

2013/2/13 horseriver <horserivers@gmail.com>:
> hi:)
>
>    If define a byte in .text. then ,does this byte located into .data section in object file?
>
> thanks!
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Sofiane AKERMOUN
akersof@gmail.com
