From: Scott Lanning <slanning@theworld.com>
Subject: Re: shellcode
Date: Mon, 24 Jun 2002 02:01:47 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.SGI.4.40.0206240154500.2849138-100000@shell01.TheWorld.com>
References: <20020624001839.H342@nietzsche>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20020624001839.H342@nietzsche>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xlp <xlp@emtel.net.co>
Cc: linux-assembly@vger.kernel.org

On Mon, 24 Jun 2002, xlp wrote:
> hi, i am reading a doc about buffer overflow, and i have some questions,
> check this c code:
> char bsdshell[] = "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f"
>                   "\x62\x69\x6e\x89\xe3\x50\x53\x50\x54\x53"
>                   "\xb0\x3b\x50\xcd\x80";
> int main() {
>         void (*s)()=(void *)bsdshell;
>         s();
> }
> If i run it, it executes a shell. I'd like to know in what does bsdshell
> +contain?, What is it? hexadacimal? how can i get that?, acording to the
> doc, it's the execve for /bin/sh.

Yes, hexadecimal. For example, "\xcd\x80" at the end is "int 0x80".
The numbers are machine code run by the processor.
Here are some more tutorials: http://julianor.tripod.com/bufo.html

