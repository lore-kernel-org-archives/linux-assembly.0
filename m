From: Lorenzo <lollo_c@alice.it>
Subject: Re: Very newbie question...
Date: Sat, 12 Nov 2005 08:35:01 +0100
Message-ID: <43759B25.5030403@alice.it>
References: <437523A4.6080707@alice.it> <200511120029.48097.zebarbuc@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200511120029.48097.zebarbuc@free.fr>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

When i back in office i try to use 64bit registers.
At home i have a linux distribution (slackware, 32bit) installed over a 64bit hardware and i can't try (i think that i can't try but is possible that i don't know how :))
For the gdb is the same thing, when back in office i try.
Thx :)



Frederic Marmond wrote:

>Hi,
>in amd64, registers are different (64bits...) ;)
>So, I think you'd better use the 64 bits name version
>push rbp
>mov rbp,rsp
>...
>
>What do you have as result in your case?
>can you try it with gdb and step your prog?
>
>Fred
>  
>

