From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: looping_code
Date: Sat, 31 Aug 2002 10:10:02 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <7D0EEAE2-BD04-11D6-B059-003065A88832@sonoma.edu>
References: <3D70E61F.39C1CA6B@wp.pl>
Mime-Version: 1.0 (Apple Message framework v482)
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3D70E61F.39C1CA6B@wp.pl>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: m_hrebien@wp.pl
Cc: linux-assembly@vger.kernel.org

On Saturday, August 31, 2002, at 08:51  AM, Maciej Hrebien wrote:

>> On Mon, 26 Aug 2002, ssams wrote:
>>> .data
>>> msg: .byte 65,10
>>>
>>> .text
>>>    .globl mulai
>>> mulai:
>>>     mov $10,%edx
>>>
>>> ulang:
>>>   mov $4,%eax
>>>   mov $1,%ebx
>>>   mov $msg,%ecx
>
> "mov $msg,%ecx" and "lea msg,%ecx" does the same thing in this example -
> moves ptr to 'msg' to the ecx register. The only difference is that the
> first one is coded one byte shorter.
>

which can be seen if you do:
mov $msg,%ecx
leal msg,%edx

and look in the debugger ---
(gdb) i r
eax            0x4      4
ecx            0x80494c8        134517960
edx            0x80494c8        134517960
ebx            0x1      1

Furthermore, if you look at the listing --
   12 000f B9000000      mov $msg,%ecx
   12      00
   13 0014 8D150000      leal msg,%edx
   13      0000


--- Bob Plantz

