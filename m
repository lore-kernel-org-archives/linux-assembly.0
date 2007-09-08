From: Lukas <blurrpp@yahoo.com>
Subject: sources of linux 'system call'
Date: Sat, 8 Sep 2007 09:08:54 -0700 (PDT)
Message-ID: <478396.28358.qm@web50305.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi.
I'm looking for sources of system calls. 
I mean ...  what program is exeecute after I call 'int
$0x80' :), for example

	movq $125,%rax  # call sys_mprotect
	movq $smc_address,%rbx
	movq $0x1000,%rcx
	movq $7,%rdx
	int $0x80

        ?????????????????
        ?????????????????

i want to ask if enybody knows where can i find it
(they should be somewhere in kernale source, but i
couldn't find it)

Regards
Lukas




       
____________________________________________________________________________________
Looking for a deal? Find great prices on flights and hotels with Yahoo! FareChase.
http://farechase.yahoo.com/
