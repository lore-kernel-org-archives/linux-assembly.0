From: Chris Evans <axiomfinity@ymail.com>
Subject: Re: how does ld.so call ELF's entry?
Date: Sat, 6 Apr 2013 20:43:16 -0700
Message-ID: <6107E321-5746-4245-8C42-0C4E589BEE4A@ymail.com>
References: <20130407021921.GA9462@debian.localdomain> <CAN0_x-Je1=2mtN8tY2mvBa-X7_P0dBoG9KRh0P63uW91eE5H2Q@mail.gmail.com> <20130407033913.GB9617@debian.localdomain>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ymail.com; s=s1024; t=1365306195; bh=mhJ/2agSzYDlTzjkhnzq1qxGB0MJAv3mRJYCAEqhuiE=; h=X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:X-Rocket-Received:References:Mime-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Cc:X-Mailer:From:Subject:Date:To; b=5FVQtFxJCwvoN6juIxXZ89RK4P4RiuWCBY8ZMNVz1oNcIjrgeuHpPyxtVSZYnPVdzAGZSnQYvfetFwXIrW2HJlnzaKbnYEldUtOU6y4xB8jSoKzhMFuCEd7KZ6lWKEdwXytPKmPgAUSlDg38c1TdpYOXtIbSpqEyKsl4NBiI9RE=
In-Reply-To: <20130407033913.GB9617@debian.localdomain>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ishare <june.tune.sea@gmail.com>
Cc: Sofiane Akermoun <akersof@gmail.com>, "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

With a far jump to entry offset 


Sent from my iPad

On Apr 6, 2013, at 8:39 PM, ishare <june.tune.sea@gmail.com> wrote:

> On Sun, Apr 07, 2013 at 05:11:28AM +0200, Sofiane Akermoun wrote:
>> Hello,
>> 
>> 
>> The interpreter is specified during linking process and the program header
>> of your binary is filled with good values.
>> Then when the operating system load your binary, he finds next the
>> interpreter to use.
>> The linker ld sets the good values by default but you can overwrite it or
>> specify other values if you want.
>> The steps are:
>> 1)The operating system loads your binary
>> 2)The program loader system execute the Interpreter specifiy in the binary
>> 3)The interpreter gather all the dynamic libraries needed in memory
> 
> 
>> 4)The Control is passed to the entry point of your program
> 
>  How does  the step 4 been  done ?
> 
>  thanks!
>> 
>> The entry point is specified in your code source as a "global". And could
>> be find in your object file by the linker.
>> In theory there are some default tag to specify entry point, like "..start"
>> for nasm, but you can also passed it to the linker.
>> 
>> regards,
>> 
>> Sofiane Akermoun
>> akersof@gmail.com
>> 
>> 
>> 
>> 
>> 
>> 2013/4/7 ishare <june.tune.sea@gmail.com>
>> 
>>> 
>>>  For an ELF ,which needs a interpreter , how is it  been called by the
>>> interpreter ?
>>> 
>>>  As I know the interpreter is loaded first and do something essential
>>> ,then call the main routine of ELF .
>>>  How is this procedure implemented ?
>>> 
>>>  Thanks!
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-assembly"
>>> in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> 
>> 
>> 
>> -- 
>> Sofiane AKERMOUN
>> akersof@gmail.com
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
