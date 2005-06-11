From: "Martin Fflores" <abebex17@hotmail.com>
Subject: inb
Date: Sat, 11 Jun 2005 14:18:25 +0000
Message-ID: <BAY14-F280DE79C5B1BF611CB993BD0FE0@phx.gbl>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

hi! everyone, i have a little problem with the extended assembly, when i try 
to compile this:
__asm__ __volatile__("inb %1,%0;":"=r"(returned):"r"(port));
it makes a error layout, if instead i write :
__asm__ __volatile("inb $0x64,%0;":"=r"(returned));
its work right; So how i can make a macro that recibe a port value or 
argumen like the first example???
i wan to write in any port not a const value;

i hope you can help, i'm so coriosus abpout all this things of linux.
Sorry abour my english

Martin Flores.

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/

