From: copyandpaste@gmx.de
Subject: Stacklayout GCC 4.1.2. - EBP differs?
Date: Fri, 23 Nov 2007 17:19:44 +0100
Message-ID: <20071123161944.238650@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="========GMX238651195834784848398"
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
To: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

--========GMX238651195834784848398
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

sorry for the spam. 
Again... read a book about buffer overflows and format string vulns.
In my attachment is the vulnerable code. 
I compiled it with gcc -g -o stack_bof stack_bof.c and ran it with gdb 6.7.1.
In gdb I made a breakpoint at the end of the function 'funktion' (line 11) and ran it with the input of 11 times 'A'. 

When the program interrupts at the breakpoint, I examined the stack frame of the function by doing 
(gdb) x/6x buff2 
which gave the following result:
0xbfa39a08:0x00434241   0x41414141  0x41414141   0x00414141
0xbfa39a18:0xbfa39a38   0x0804843d

So the stack contains the "ABC" from buff2 and all the 11 "A"s from buff1.
After that comes the saved frame pointer from main() and the RIP from main().
So here the register EBP was 0xbfa39a38.

_But_ if let gdb show me the frames by typing 

(gdb) bt
#0  funktion (args=0xbfa3b247 'A' <repeats 11 times>) at stack_bof.c:11
#1  0x0804843d in main (argc=2, argv=0xbfa39ad4) at stack_bof.c:19
and 
(gdb) info frame 0
Stack frame at 0xbfa39a20:
 eip = 0x8048400 in funktion (stack_bof.c:11); saved eip 0x804843d
 called by frame at 0xbfa39a40
 source language c.
 Arglist at 0xbfa39a18, args: args=0xbfa3b247 'A' <repeats 11 times>
 Locals at 0xbfa39a18, Previous frame's sp is 0xbfa39a20
 Saved registers:
  ebp at 0xbfa39a18, eip at 0xbfa39a1c

I dont understand the output anymore. Because it says the saved EBP is at adress 0xbfa39a18 (like some lines ago), _but_ it has a different value: 0xbfa39a40. 

Why? Why is it one time 0xbfa39a40 and one time 0xbfa39a38?

Thanks for your help!



-- 
Ist Ihr Browser Vista-kompatibel? Jetzt die neuesten 
Browser-Versionen downloaden: http://www.gmx.net/de/go/browser

--========GMX238651195834784848398
Content-Type: text/x-csrc; charset="iso-8859-15"; name="stack_bof.c"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="stack_bof.c"

#include <stdio.h>
#include <string.h>

void
funktion (char *args)
{
	char buff1[12];
	char buff2[4] = "ABC";

	strcpy (buff1, args);
}

int
main (int argc, char *argv[])
{
	printf ("Eingabe: ");

	if (argc > 1) {
		funktion (argv[1]);
		printf ("%s\n", argv[1]);
	}
	else
		printf ("Kein Argument!\n");

	return 0;
}

--========GMX238651195834784848398--
