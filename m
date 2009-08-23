From: Frank Kotler <fbkotler@zytor.com>
Subject: Re: Appendix: multithreating HOWTO ? :)
Date: Sun, 23 Aug 2009 15:18:48 -0400
Message-ID: <4A919618.5020107@zytor.com>
References: <203349.81852.qm@web50309.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <203349.81852.qm@web50309.mail.re2.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?=A3ukasz?= <blurrpp@yahoo.com>
Cc: linux-assembly@vger.kernel.org

=A3ukasz wrote:
> thanks for answer, im experiment with system clone ( actualy fork i f=
ound in many manuals ) but i dont understand Frakns last sentence
> "Well, they *told* us not to do it that way. :)", to program multipro=
ceses with fork ? Any way is there any way to make share memory for pro=
ceses ?

Just a "joke". I meant, using the int 80h (or syscall) interface. We're=
=20
"supposed" to use the C interface.

Like Claudio, I'm a "32-bit guy" - and I don't know how to do=20
multithreading even on 32-bit. But I think if you're going to use 64-bi=
t=20
registers, you'll have to use 64-bit sys_call numbers, put the=20
parameters in regs compatible with the 64-bit ABI, and use "syscall"=20
instead of "int 0x80". I don't think what you're doing will work, but=20
I'm not equipped to try it.

You can share memory between processes by memmapping a region and=20
flagging it MAP_SHARED (sys_fork or even separate executables). I=20
*think* for threads, you'd want sys_clone, and all memory would be=20
shared(?). I think your issue is going to be keeping your threads from=20
read/writing the same memory at the same time. I'm a "single CPU guy",=20
too, but I think multi-CPU is going to be "even worse".

I made an example using pthread_create - not that I want to use it=20
either, but to see what it does for us. Easier to read the source, I'm=20
sure, but no, I ran it in strace. Doing a bunch of "signal related"=20
stuff I don't understand. I'm afraid I'm going to have to learn more=20
about "signals" before I can proceed with this...

=46or those of us who need to learn about 64-bit programming, there's a=
=20
tutorial:

<http://www.vikaskumar.org/wiki/index.php?title=3DX86-64_Tutorial>

Came across this, that looked interesting, too:

<http://milw0rm.org/papers/110>

Best,
=46rank




--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
