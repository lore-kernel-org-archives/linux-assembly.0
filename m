From: "Joseph D. Wagner" <wagnerjd@prodigy.net>
Subject: RE: Basic assembly
Date: Sun, 10 Nov 2002 22:27:35 -0600
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <000001c2893a$aa911ae0$ac231c43@joe>
References: <20021111000131.GA9775@theguest.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20021111000131.GA9775@theguest.homelinux.net>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'theguest' <theguest@ono.com>, linux-assembly@vger.kernel.org

> First of all, I'm spanish so sorry for my bad english.

Your English is better than some other people's English.

> He says the memory is reserved multiples of "word".

No.  In Linux, memory is allocated in "page frames", where 1 page frame
= 4 Kbytes.

> He says word=4bytes.

No.  A Word is 2 bytes.

WORD (Word) = 2 bytes (16 bits)
DWORD (Double Word) = 4 bytes (32 bits)
QWORD (Quad Word) = 8 bytes (64 bits)

> So our 5 bytes buffer needs = 8 bytes ...
> ...
> Why are my code reserving other quantity of space for variables?

All variables must be DWORD "aligned" except for variables smaller than
1 DWORD.

"DWORD Alignment" means that the amount of memory required for all
variables will be rounded up to the nearest DWORD (4 bytes).

For example, given the user defined class:
class Pentagon {
unsigned char Side1;
unsigned char Side2;
unsigned char Side3;
unsigned char Side4;
unsigned char Side5;
};
while the size of Pentagon is 5 bytes, the compiler rounds up allocation
to 8 bytes so that Pentagon is DWORD Aligned.

DWORD Alignment occurs with each instance of the variable.  In other
words, an array of Pentagon, for example: Pentagon myPentagon[5];, is 25
bytes but would round up to 40 bytes (not 28 bytes) because each
instance of Pentagon is 8 bytes, so an array of 5 Pentagons would be 40
bytes (8 byte alignment * 5 occurrences = 40 bytes).

DWORD Alignment has nothing to do with Linux, the compiler, or any
computer language.  DWORD Alignment is part of the x86 processor
specification.  (A DWORD is 32 bits, and today's processors are 32 bit
processors; that is not a coincidence.)

I am not sure if this helps you.  Your specific problem was unclear to
me.

By the way, whoever is giving you your information is really
misinformed.

