From: Matteo Cortonesi <m_cortonesi@ticino.com>
Subject: jmp instruction
Date: Sun, 2 Feb 2003 14:06:26 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <2338DB4A-36AF-11D7-92D5-000A27B17C58@ticino.com>
Mime-Version: 1.0 (Apple Message framework v551)
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Hi, I'm new here. I'm a newbie...

Well, I need to skip the instruction mov $0x4,%eax with the jmp 
command, here's the code:

(gdb) disas main
Dump of assembler code for function main:
0x8048430 <main>:       push   %ebp
0x8048431 <main+1>:     mov    %esp,%ebp
0x8048433 <main+3>:     mov    $0x1,%eax
0x8048438 <main+8>:     jmp    0xa
0x804843d <main+13>:    mov    $0x4,%eax
0x8048442 <main+18>:    mov    $0x0,%ebx
0x8048447 <main+23>:    int    $0x80
0x8048449 <main+25>:    pop    %ebp
0x804844a <main+26>:    ret

I need to go 10 bytes forward from main+8 (because 18-8=10) to skip mov 
$0x4,%eax, so i wrote jmp 0xa. Unfortunately the program causes a 
segmentation fault (core dumped), and I don't understand why.
Where did I make the mistake? I know that it's banal question, sorry

Thanks


