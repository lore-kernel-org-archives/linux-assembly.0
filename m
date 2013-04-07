From: Sofiane Akermoun <akersof@gmail.com>
Subject: Re: how does ld.so call ELF's entry?
Date: Sun, 7 Apr 2013 06:40:30 +0200
Message-ID: <CAN0_x-JpxGb8C=eQqJhrLxJK7WZNmS5z=81eYhTzFXKeEahy-Q@mail.gmail.com>
References: <20130407021921.GA9462@debian.localdomain>
	<CAN0_x-Je1=2mtN8tY2mvBa-X7_P0dBoG9KRh0P63uW91eE5H2Q@mail.gmail.com>
	<20130407033913.GB9617@debian.localdomain>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=JLz6+pE/ZDAMB6akyaiT3OyiY7OIOa6aGTuoGUzBhSk=;
        b=D/MApnM9r9ZGm5y2WmxGy+NeucArH2ncInUu+ULPutgB/w96eCNPHuACnGvEMz6Y6B
         /3uGFEmLdyQ6OY4hfmKS2G6L6xZAoh4GHq5R8jpH2sWy4pjEPDwUL921AlxjxiS0H4eR
         2hOO21QN9WH20oRuNusJfViCEYv+5k0gn61fgbGB500GQ7TAfnOQdE1AsLeJzjzSrFlI
         qgzfZVWQ5g8t1m5MsjZW5V5EgsTqaS0nFhvm92KVGSSa6Pe7NKhUZBPgTyk+Qjwv3Rxs
         O/Kh5MyJfi4jvWTudyt7LpFDcJluwCv3PS+eyBYUadqi/W1qKC/Mybs8vhR3Zpx50nT9
         b0xQ==
In-Reply-To: <20130407033913.GB9617@debian.localdomain>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ishare <june.tune.sea@gmail.com>
Cc: linux-assembly@vger.kernel.org

from 'man exeve':
if the executable is a dynamically linked ELF  executable,  the
interpreter named in the PT_INTERP segment is used to load the needed
shared libraries.  This interpreter is typically /lib/ld-linux.so.1
for  binaries  linked  with the Linux libc 5, or /lib/ld-linux.so.2
for binaries linked with the glibc 2.
If you really want to know what really happens then go to dig the
exec.c source of linux:
http://lxr.linux.no/#linux+v3.8.6/fs/exec.c and binfmt*.c. If you
follow the process you will find how the loader find, parse, and
handle the interpretor.

regards,

Sofiane Akermoun

2013/4/7 ishare <june.tune.sea@gmail.com>:
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
>   How does  the step 4 been  done ?
>
>   thanks!
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
>> >
>> >   For an ELF ,which needs a interpreter , how is it  been called by the
>> > interpreter ?
>> >
>> >   As I know the interpreter is loaded first and do something essential
>> > ,then call the main routine of ELF .
>> >   How is this procedure implemented ?
>> >
>> >   Thanks!
>> > --
>> > To unsubscribe from this list: send the line "unsubscribe linux-assembly"
>> > in
>> > the body of a message to majordomo@vger.kernel.org
>> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> >
>>
>>
>>
>> --
>> Sofiane AKERMOUN
>> akersof@gmail.com



-- 
Sofiane AKERMOUN
akersof@gmail.com
