From: Stephan Walter <stephan.walter@gmx.ch>
Subject: Re: shellcode
Date: Tue, 25 Jun 2002 22:28:25 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020625222825.428828b3.stephan.walter@gmx.ch>
References: <20020624001839.H342@nietzsche>
	<20020625212214.4910d000.stephan.walter@gmx.ch>
	<20020625144651.A430@nietzsche>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20020625144651.A430@nietzsche>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

On Tue, 25 Jun 2002 14:46:51 -0500, xlp <xlp@emtel.net.co> wrote:
> Stephan, it's so complicated, i dont get it, what's objdump for?
> if a buffer is char [10], how is the sfp, ret and shellcode length?

objdump? Why would you want to use that? See "man objdump".

Let's have a look at your code:

char bsdshell[] = "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f"
                  "\x62\x69\x6e\x89\xe3\x50\x53\x50\x54\x53"
                  "\xb0\x3b\x50\xcd\x80";
 int main() {
         void (*s)()=(void *)bsdshell;
         s();
 }

"bsdshell" is an array of char which contains the assembly code. It is 
25 bytes long, but you could make it smaller by optimizing the code.
If you disassemble these bytes, it looks like this:

   xor eax,eax
   push eax
   push dword 0x68732f2f
   push dword 0x6e69622f
   mov ebx,esp
   push eax      
   push ebx
   push eax
   push esp
   push ebx
   mov al,0x3b
   push eax
   int 0x80

The important thing is that it uses "int 0x80" (last line). This
interrupt is used to tell the kernel to do something. In this case, it
is the system call named "execve", which means that the kernel should
execute a program. 

The function "s" is a pointer of type void to bsdshell. On the next line
you execute this "s". It is not a C function, just some lonely bytes in
the memory. But your CPU jumps to this code just as it was a C function,
and now the code listed above gets executed.

What do you mean with sfp and ret? If you mean the ret (return) command,
the answer's short: there is no return. If you type "exit" in the shell,
your program will crash.

I don't know if this answers your questions. Just write to the mailing
list if you have trouble understanding this

Regards,
Stephan
