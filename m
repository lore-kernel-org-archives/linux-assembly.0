From: Sofiane Akermoun <akersof@gmail.com>
Subject: Re: how does ld.so call ELF's entry?
Date: Sun, 7 Apr 2013 06:45:58 +0200
Message-ID: <CAN0_x-J_7VOhzezQhWBZNAPfbREtoOkk3yMcS3kLzL5XFD5cwg@mail.gmail.com>
References: <20130407021921.GA9462@debian.localdomain>
	<CAN0_x-Je1=2mtN8tY2mvBa-X7_P0dBoG9KRh0P63uW91eE5H2Q@mail.gmail.com>
	<20130407033913.GB9617@debian.localdomain>
	<6107E321-5746-4245-8C42-0C4E589BEE4A@ymail.com>
	<20130407034554.GC9617@debian.localdomain>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=trU2E1n05C5CU2VqYjBzuCpfEOkAKTIi+S4UEUrxqn0=;
        b=ie9BvZaCNpFYfZJsD3KaS77pN7uowXNCv+AdBS6jw3dq/xjgjJExmpnUP9omspUny+
         CCgPyNKgiZcqMRLjwjdRyDCCYjusPwYBp1aVkuULjQ+FOnRx/QWFVsgXxcGehk/W4QJ/
         FJZPIGhhn6ooO7QheBjw9IAOOZ3OXDmHzrj40q7CIBboBL6VqDy/IE8ZX8RPkrhUfQl9
         J/2aiNj8HnZFnqwPc3Ao3Cm7lnLF6QXk9qlrcKMfXMqHoBLPOTEpnxYm/k2WFolF7gVu
         hUN7Wr6nWniOEXiMbpCdfDEyFKuXjkRw6sFArw2br9AyRs2SOPxolU/CpuJqrIH5hkiI
         fPaQ==
In-Reply-To: <20130407034554.GC9617@debian.localdomain>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ishare <june.tune.sea@gmail.com>
Cc: linux-assembly@vger.kernel.org

EntryPoint is set in the ELF Header at assembling/linking time.

2013/4/7 ishare <june.tune.sea@gmail.com>:
> On Sat, Apr 06, 2013 at 08:43:16PM -0700, Chris Evans wrote:
>> With a far jump to entry offset
>
>   How does it know the entry point's address?
>
>>
>>
>> Sent from my iPad
>>
>> On Apr 6, 2013, at 8:39 PM, ishare <june.tune.sea@gmail.com> wrote:
>>
>> > On Sun, Apr 07, 2013 at 05:11:28AM +0200, Sofiane Akermoun wrote:
>> >> Hello,
>> >>
>> >>
>> >> The interpreter is specified during linking process and the program header
>> >> of your binary is filled with good values.
>> >> Then when the operating system load your binary, he finds next the
>> >> interpreter to use.
>> >> The linker ld sets the good values by default but you can overwrite it or
>> >> specify other values if you want.
>> >> The steps are:
>> >> 1)The operating system loads your binary
>> >> 2)The program loader system execute the Interpreter specifiy in the binary
>> >> 3)The interpreter gather all the dynamic libraries needed in memory
>> >
>> >
>> >> 4)The Control is passed to the entry point of your program
>> >
>> >  How does  the step 4 been  done ?
>> >
>> >  thanks!
>> >>
>> >> The entry point is specified in your code source as a "global". And could
>> >> be find in your object file by the linker.
>> >> In theory there are some default tag to specify entry point, like "..start"
>> >> for nasm, but you can also passed it to the linker.
>> >>
>> >> regards,
>> >>
>> >> Sofiane Akermoun
>> >> akersof@gmail.com
>> >>
>> >>
>> >>
>> >>
>> >>
>> >> 2013/4/7 ishare <june.tune.sea@gmail.com>
>> >>
>> >>>
>> >>>  For an ELF ,which needs a interpreter , how is it  been called by the
>> >>> interpreter ?
>> >>>
>> >>>  As I know the interpreter is loaded first and do something essential
>> >>> ,then call the main routine of ELF .
>> >>>  How is this procedure implemented ?
>> >>>
>> >>>  Thanks!
>> >>> --
>> >>> To unsubscribe from this list: send the line "unsubscribe linux-assembly"
>> >>> in
>> >>> the body of a message to majordomo@vger.kernel.org
>> >>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> >>
>> >>
>> >>
>> >> --
>> >> Sofiane AKERMOUN
>> >> akersof@gmail.com
>> > --
>> > To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
>> > the body of a message to majordomo@vger.kernel.org
>> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Sofiane AKERMOUN
akersof@gmail.com
