From: "Robert G. Plantz" <plantz@SONOMA.EDU>
Subject: Re: Nasm v/s Gas
Date: Tue, 03 Dec 2002 13:33:16 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <D57E92F8-0706-11D7-B534-0030657C1952@sonoma.edu>
References: <20021203120622.54680.qmail@web41113.mail.yahoo.com>
Mime-Version: 1.0 (Apple Message framework v548)
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <20021203120622.54680.qmail@web41113.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; delsp="yes"; charset="us-ascii"; format="flowed"
To: ruxyz@yahoo.com
Cc: Assembly Linux <linux-assembly@vger.kernel.org>

I thought about this issue a lot when we moved to a linux
platform for teaching assembly language. I chose gas because:

1. It already exists on almost all linux systems.
2. The interface between gas and C/C++ is very good in the gnu
    environment. (The whole point of our class is to teach
    what is going on at the asm level when programming in C/C++.)
2a. One can easily generate assembly language from a C/C++
     source with gcc, which provides a valuable learning tool.
3. Students need to learn the concepts, and the minor syntax
    differences actually reinforce this.

I have not taken the time to learn NASM to see if any of
my arguments also apply to NASM. After using gas for four
years, though, I do not regret my decision. It is working
very well for us.

Please note that my comments apply to a teaching environment.
I can easily imagine that other assemblers would be preferable
in a productions environment.

Bob

On Tuesday, December 3, 2002, at 04:06 AM, Anticipating a Reply wrote:

>    As Linux Inline assembly accepts 'gas'
> syntax , I would like to know which of
> the two to use .
>
>    So I would like to know what are the
> advantages and disadvantages involved in
> using NASM v/s GNU-As ?
>
------------------------------------------------------------------------ 
---------------
Robert G. Plantz, PhD		| http://www.cs.sonoma.edu/~bob
Sonoma State University		| ph: (707) 664-2806
CS Department				| fax: (707) 664-3012
1801 E. Cotati Avenue		| email: plantz@sonoma.edu
Rohnert Park, CA 94928

