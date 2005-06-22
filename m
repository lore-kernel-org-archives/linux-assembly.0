From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: New C++ compiler with inline assembly support
Date: Wed, 22 Jun 2005 14:27:11 +0200
Message-ID: <20050622122711.GB24422@MAIL.13thfloor.at>
References: <42B66A1A.50004@agner.org>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <42B66A1A.50004@agner.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Agner Fog <agner@agner.org>
Cc: linux-assembly@vger.kernel.org

On Mon, Jun 20, 2005 at 09:02:50AM +0200, Agner Fog wrote:
> Intel have just released version 9.0 of their C++ compiler with better 
> support for inline assembly.
> It can compile for the following platforms
> - Linux x86 32 bit
> - Linux x86 64 bit
> - Linux ia64 (Itanium)
> - Windows x86 32 bit
> - Windows x86 64 bit
> - Windows ia64 (Itanium)
> I haven't tested it on FreeBSD yet, but I assume that it works on 32 and 
> 64 bit FreeBSD as well.

great! btw, the FSF released the new GCC 4.0 (recently)
with excellent support for inline assembly ...
It can compile for the following platforms

 - alpha	- mips/64
 - arm		- powerpc/64
 - h8/300	- rs6k
 - hppa/64	- sparc/64
 - ix86 	- sh/4/5
 - ia64 	- s390/x
 - m32r 	- x86_64
 - m68k     	- ...

it works on Linux, *BSD*, Windows, Solaris, ...

best,
Herbert

> In Linux, you now have the choice between MASM syntax and AT&T syntax 
> for inline assembly. MASM syntax is almost the same as NASM. If you 
> choose MASM syntax, you can use the same C++ file with inline assembly 
> in both Linux and Windows. It can even translate MASM syntax assembly to 
> AT&T syntax, and this more reliably than any other translation tools I 
> have seen yet.
> 
> To use MASM syntax under Linux, simply use the command line option  
> -use-msasm
> 
> Example:
> 
> int addnumbers (int a, int b) {
>   return a+b;}
> 
> Same with inline assembly in MASM syntax:
> 
> int addnumbers (int a, int b) {
>   __asm {
>      mov eax, a
>      add eax, b
>   }
> }
> 
> This will work in both Linux and Windows, 32 and 64 bit. So you can use 
> the same C++/asm file on all platforms. It takes care of the differences 
> in calling conventions between the different platforms, and it 
> automatically pushes and pops any non-volatile registers that you use in 
> your code. This makes Linux assembly much easier! You can make the most 
> of your program in C++ and make the critical innermost loop with inline 
> assembly.
> 
> In 64-bit Linux, function parameters are transferred in registers rdi, 
> rsi, rdx, rcx, r8, r9, xmm0-xmm7. If you know this, you can optimize the 
> above example:
> 
> int addnumbers (int a, int b) {
>   __asm {
>      lea eax, [rdi+rsi]
>   }
> }
> 
> But then your code is no longer platform independent, of course.
> 
> The C++ compiler for Linux is available for free for noncommercial 
> users. Download it from http://www.intel.com/software/products/noncom/
> The C++ compiler for Windows is available with a time limited free 
> evaluation license from 
> https://registrationcenter.intel.com/EvalCenter/EvalForm.aspx?ProductID=411
> 
> Agner Fog
> www.agner.org/assem
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
