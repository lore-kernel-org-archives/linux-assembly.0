From: etienne <eyem@lalila.net>
Subject: Re: .intel_syntax
Date: Fri, 17 Jan 2003 01:48:35 +1100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3E26C643.8040303@lalila.net>
References: <20030116011903.21711.qmail@webmail28.rediffmail.com>
Reply-To: eyem@lalila.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

n mishra wrote:

> Hi all,
> Could someone please tell me how the .intel_syntax works.I can't seem 
> to find any reference to it in the man pages or any other 
> documentation on it.I want to compile some code written in the intel 
> syntax using gcc. 

you cant (unless I am wrong)

gcc does at&t syntax only .......... and uses gas to compile assembly

but you can use nasm to compile intel syntax ..... and link nasm object 
files to gcc compiled C or C++

there is heaps of intel syntax docs on Intel's site

etienne

>
> Thanks.
> mishra.
>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>



