From: wintah <wintrmute@retemail.es>
Subject: Re: question about variables
Date: Thu, 15 May 2003 18:30:58 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030515183058.4044accb.wintrmute@retemail.es>
References: <3EC3C544.8050307@sdf-eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3EC3C544.8050307@sdf-eu.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geiregat Jonas <kemu@sdf-eu.org>, linux-assembly@vger.kernel.org

On Thu, 15 May 2003 16:50:12 +0000
Geiregat Jonas <kemu@sdf-eu.org> wrote:

> Hey, I have 2question about linux assembly
> I have written a basic programme
> It's really simple I use the open, read and write syscall
> To open a file (/etc/passwd) read it and print it out to the screen.
> Now when reading the file I read it into a buffer declared like this 
> (using nasm)
> section .bss
>     buffer  resd 1
> so I reserve one double word of space. so that is 4bytes. /etc/passwd >is much bigger then that but still I see the whole file printed I find >this strange (I'm also not sure about the 1 behind resd I think it's >stands for reserve 1 doubleword of space)

 Yep, it seems strange. Anyway, if you want to print the whole file (even manipulate it), the sys_mmap syscall would be a lot better (open the file, then with mmap project it on memory, it dinamically creates a zone for the file and loads it, so you can access it withouth having to deal with pointers & stuff).

> My other question is how can I accept,  command line arguments in asm 
> using nasm

 Check out the stack, the pointers for arguments the user provides are stacked there when the program begins ;)


-- 
* Origin: http://pagina.de/wintermute
... learn to swim
