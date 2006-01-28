From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: help with sys_stat
Date: Sat, 28 Jan 2006 05:41:57 -0500
Message-ID: <43DB4A75.2040506@comcast.net>
References: <20060128150139.04fee74e.amerei@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20060128150139.04fee74e.amerei@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Niel A <amerei@gmail.com>
Cc: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

Niel A wrote:
> hey guys! it's me again (with another useless program! hehehehe)

They're *all* useless... until you put the pieces together to do 
something useful. (This is on my to-do list...)

> actually.. i have two problems.. how to use struc in nasm.. and how to determine if a file is a directory...
> 
> i'm totally clueless about this .. so i used struc straightforward in segment. bss based on struct stat in /usr/include/asm/stat.h
> 
> segment .bss
> struc stat

This can go anywhere - like a "%define", it doesn't generate any code. 
It's a "typedef". An instance of your struc would want to go in .data, 
if it's initialized, or in .bss if you just want to reserve space for it 
(this case, I think)... If you "%include 'system.inc'" from asmutils, 
you've *got* the "typedef"...

my_stat_buf resb stat_size


> 	.st_dev	resw		1
> 	-- snip --
...     .??? resw               1
...     .??? resd               1
...     .st_mode resw           1  ; <- this one!
> endstruc
> 
> ? but somehow, i think that i should make a struc somewhere at the beginning .. like a prototype of some sort and use it's name in segment .bss intead.

You probably want both. The "typedef" anyplace, and an instance in .bss.

> so far, i have a filename in edi and i call stat like ..
> 	mov eax, 106	; stat
> 	mov ebx, edi	; file
> 	mov ecx, stat

This may be a problem. You want some memory (stat_size bytes) to point 
this at. Just "struc" doesn't allocate memory - you'd want "istruc", or 
"stat_size" reserved in .bss, or just subtract it from esp...

> 	int 80h
> 
> any suggestions on this one ? i'm reading asmutil's "rm" alongside making my own program.. but i'm only interested in determining if a given filename is a directory or not. do i also have to deal with trailing slashes in directory names?? 

I think not. Once you've got the buffer filled, you can just test "mybuf 
+ stat.st_mode" for the directory bit. Note that C gives these in 
octal!!! "NNNNq" for nasm...

This is pretty crude...

     mov eax, 106  ; sys_stat
     lea ebx, [edi + 10]         ; filename
     sub esp, 64                 ; stat_size
     mov ecx, esp
     int 80h

     test dword [ecx + 8], 40000q
     jz notsubdir
     ...
(don't forget to add stat_size back onto the stack to "free" the buffer, 
if you do it this way!)

Soon, we'll tackle some "time" functions and figure out what in hell 
timezone you're in :)

Best,
Frank

