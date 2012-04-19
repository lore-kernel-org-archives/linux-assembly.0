From: Daniel Hilst <danielhilst@gmail.com>
Subject: Re: Declare strings on stack, gas
Date: Thu, 19 Apr 2012 16:07:31 +0000
Message-ID: <4F903843.5080001@gmail.com>
References: <4F8ED685.2030408@gmail.com> <4F8F174F.3080205@sonoma.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:cc:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=rTxdO81FNLbaFZGyz+efx5Md82Sp/WWFV6l+7Osx0Nk=;
        b=eO2t9+CIyTsH2xgpTPMJmZEPqFq8ulSo3rmKBcuwUrwLRT7RjgjYnUkgG9hsRFnSPK
         vr/aW5X3vkeOMR7BCci2gzGXEkgE0mTgDQuU4WeiG4GlipW/FarJ8bL94LpXI7rAvbyh
         apJr9hdlLTVHmZ7LEFisj2HbToVaEeRezXyAZJDgRKmUYUm4mf59DbgpXiHQzp9Dz5eX
         Q6OMhd+6yMVoRUipiRiIAoppgGh2rEmT5MBzksj09eOipP05/OKkMdpWJCGICHG8Xf/b
         RGVtN+6I4PhME1x1G1+gThcqECRBBX5/nn969e9urZlYbWw7YMmLjm52nBh9kvqbA2Xy
         Ravw==
In-Reply-To: <4F8F174F.3080205@sonoma.edu>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-assembly@vger.kernel.org

On 04/18/2012 07:34 PM, Robert Plantz wrote:
> On 4/18/2012 7:58 AM, Daniel Hilst wrote:
>> Is possible to declare strings on stack? I'm using mov + ebp offsets
>> to do something like that.. Is there an easier way to do it?
>>
>> Here is an sample off how I'm doing it: http://sprunge.us/UUZI
>>
>> The hex numbers are a "Hello World" string..
>> I have tried .assci without success :(
>>
>> Thanks in advance!
>>
>>
> Basically, you're asking if the compiler/assembler can initialize the
> stack to some known value. Since memory on the stack is dynamically
> allocated by the instructions:
>
> doit:
> push %ebp ; Save caller's base pointer
> mov %esp, %ebp ; Establish our base pointer
>
> sub $12, %esp ; Allocate memory on the stack
>
>
>
> the answer is 'no.' After you allocate stack memory (which now has
> garbage values), you need to copy known values there. Write your code in
> C and use the '-S' gcc option to see how the compiler does this. The
> '-S' option will generate the assembly language file foo.s from the C
> source file foo.c.
>
> --Bob
>
>
>

Thanks guys, the closest I got was use .text section and the %esi trick.
Now I know about stack dynamics.

Cheers!
-- 
Follow the white rabbit!
