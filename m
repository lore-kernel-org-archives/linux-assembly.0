From: peter w krause <wklux@yahoo.co.uk>
Subject: Re: smc-help
Date: Tue, 4 Nov 2003 21:40:10 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200311042108.34154.wklux@yahoo.co.uk>
References: <Law9-F88milcMPyp4cS0001780b@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Law9-F88milcMPyp4cS0001780b@hotmail.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jason Roberts <v3ct0r99@hotmail.com>, linux-assembly@vger.kernel.org

the fault in your particular example might be due to read-only '.text'  
section standard permissions which is handled incorrectly by the  debugger, 
permitting code modification while debugging, but not while running the 
program, independently.

best,
	hp
================
Jason Roberts am Tuesday 04 November 2003 14:12:
> I've read enough about smc that I figured it'd be a cool thing to
> learn...The basic concept is simple; implementation,however , is not!
> Here's my code(using nasm) and following a session with gdb.
> Thankyou for any insight
>
>        BTW-- I decided to include only the output from objdump rather than
> bloat this
>        already bloated post with nasm src. I'll assume most can read gas
> syntax--
>         I'm new to asm and had no prob differentiating the two styles.
>
>
> <self modifying code>
>
>
> ./smc:     file format elf32-i386
>
> Disassembly of section .text:
>
> 08048080 <.text>:
> 8048080:	e9 1b 00 00 00       	jmp    0x80480a0
> 8048085:	ba 11 00 00 00       	mov    $0x11,%edx
> 804808a:	b8 04 00 00 00       	mov    $0x4,%eax
> 804808f:	bb 01 00 00 00       	mov    $0x1,%ebx
> 8048094:	b9 eb 90 04 08       	mov    $0x80490eb,%ecx
> 8048099:	cd 80                	int    $0x80
> 804809b:	e9 2e 00 00 00       	jmp    0x80480ce
> 80480a0:	e8 18 00 00 00       	call   0x80480bd
> 80480a5:	31 c0                	xor    %eax,%eax
> 80480a7:	ba 13 00 00 00       	mov    $0x13,%edx
> 80480ac:	b8 04 00 00 00       	mov    $0x4,%eax
> 80480b1:	bb 01 00 00 00       	mov    $0x1,%ebx
> 80480b6:	b9 d8 90 04 08       	mov    $0x80490d8,%ecx <------ buffer
> 80480bb:	cd 80                	int    $0x80
> 80480bd:	bf c9 80 04 08       	mov    $0x80480c9,%edi <------- our jmp
> 80480c2:	89 3d a7 80 04 08    	mov    %edi,0x80480a7   <--- modify!
> 80480c8:	c3                   	ret
> 80480c9:	e9 b7 ff ff ff       	jmp    0x8048085
> 80480ce:	89 c3                	mov    %eax,%ebx
> 80480d0:	b8 01 00 00 00       	mov    $0x1,%eax
> 80480d5:	cd 80                	int    $0x80
> Disassembly of section .data:
>
> 080490d8 <.data>:
> 80490d8:	6e                   	outsb  %ds:(%esi),(%dx)
> 80490d9:	6f                   	outsl  %ds:(%esi),(%dx)
> 80490da:	72 6d                	jb     0x8049149
> 80490dc:	61                   	popa
> 80490dd:	6c                   	insb   (%dx),%es:(%edi)
> 80490de:	20 65 78             	and    %ah,0x78(%ebp)
> 80490e1:	65 63 75 74          	arpl   %si,%gs:0x74(%ebp)
> 80490e5:	69 6f 6e 0a 0d 00 49 	imul   $0x49000d0a,0x6e(%edi),%ebp
> 80490ec:	20 61 6d             	and    %ah,0x6d(%ecx)
> 80490ef:	20 6d 6f             	and    %ch,0x6f(%ebp)
> 80490f2:	64 69 66 69 65 64 21 	imul   $0xa216465,%fs:0x69(%esi),%esp
> 80490f9:	0a
> 80490fa:	0d                   	.byte 0xd
>
> [L4@weirdo L4]$ gdb ./smc
> (gdb) r
> Starting program: /home/L4/./smc
> warning: shared library handler failed to enable breakpoint
>
> Program received signal SIGSEGV, Segmentation fault.
> 0x080480c2 in ?? ()
> ok...now test trampoline...
> (gdb) j *0x80480c9
> Continuing at 0x80480c9.
> I am modified!
> Program exited with code 021.
> ok...good...
> lets check that edi holds jmp addy...
> Breakpoint 1, 0x080480c2 in ?? ()
> edi   =   0x80480c9    yep,good
> ok now lets see if addy was modified(thats at 0x80480a7)
> (gdb) x/i *0x80480a7
> 0x80480c9:      jmp    0x8048085  <-------- and there it is!
> sweet!!! well, not quite...why does it segfault???
>
> _________________________________________________________________

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
  >> xxxx -at- lxhp -dot- in-berlin -dot- de <<

