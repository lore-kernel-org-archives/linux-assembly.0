From: Stephan Sauerburger <stephan@sauerburger.org>
Subject: math on variables
Date: Sun, 15 Dec 2002 07:29:06 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20021215122906.GB8507@sauerburger.org>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Linux Assembly List <linux-assembly@vger.kernel.org>

Hi, I'm a newbie and trying to perform basic math on variables in memory (not the stack).
I tried this but it gives lots of "error: invalid combination of opcode and
operands" and "error: operation size not specified" messages:

section .bss
     [...]
     totalcoins  	resd	1
     totalvalue		resd	1

section .text

extern scanf
global main
main:
     mov	[totalcoins],0	;This gives an error. I just want to
     				;initialize them to 0 at beginning.
     mov	totalvalue,dword 0	    ;This doesn't work either,
     				;when I give its address with "name"
				;in lieu of "[name]" or specify dword.

     ;;read in nickels
     push   dword	nickels
     push   dword  dformat
     call   scanf
     add     esp,8
     ;;add it to "totalcoins"
     add    [totalcoins],[nickels]	;error: invalid combination of
     	    				;opcode and operands. Tried
					;"add totalcoins,dword [nickels]" too.
     ;add value in centes to "totalvalue"
     ;(nickels are worth 5 cents, so multiply by 5 first.)
     mov    eax,[nickels]
     mul    eax,5	 		;error: invalid combination of
     mov  [nickels],eax			;opcode and operands.


I'm using nasm 0.98.28, on Debian Linux, on a Pentium III 450 mhz, 256 MB of
ram. I find it odd, but I have found no information on such operations on
variables anywhere on the web or my books. Perhaps I'm just dense.
How can one accomplish these things? Thx.

-- 
-Stephan
For PGP Public Key, visit:
http://www.sauerburger.org
