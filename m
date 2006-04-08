From: Thiago Silva <thiago.silva@kdemail.net>
Subject: Re: nasm / code distance
Date: Sat, 08 Apr 2006 11:09:52 +0000
Message-ID: <200604081109.52115.thiago.silva@kdemail.net>
References: <200604071847.32559.thiago.silva@kdemail.net>
 <20060408094752.GA5931@wintermute>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <20060408094752.GA5931@wintermute>
Content-disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Well...the code is really a big one.
To clarify, I made simple test:
On the entry point, I read some data in the .data section (such as "mov eax, 
dword [_r]"). Running valgrind, this read is not shown on the error 
reporting.

Then, I copied this same read code and pasted it on a function in the end of 
the file (is a pretty big source file). Then, valgrind complained that this 
was an invalid read!!

So I though there might be something I'm missing...
The same goes for the jmp instructions getting the "short jump out of range".

On Saturday 08 April 2006 09:47, you wrote:
> On Fri, Apr 07, 2006 at 06:47:32PM +0000, Thiago Silva wrote:
> > Hello, I'm having some troubles with an asm application.
>
> It's hard to say anything specific without you showing the problematic
> parts of your code.
>
>   Leslie

-- 
+Thiago Silva
