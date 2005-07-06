From: "Martin Fflores" <abebex17@hotmail.com>
Subject: extended assembly
Date: Wed, 06 Jul 2005 19:18:48 +0000
Message-ID: <BAY14-F22DCF1C24E58500B44F404D0D90@phx.gbl>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

hi! everyone, i have a rare problems here, i dont know if i do somethign 
wrong or the compiler have some problems, when i read a value from a port(a 
byte) the first time it's retun to me a byte so i catch and use printf to 
show this value, the secon time its return to me a integer value or a dont 
know, let me give you a example:

char value=0;
__asm__ __volalile__("cli;inb $0x60,%0;sti;":"=r"(value));
printf("%x",value);// the first time usually return 1c
// this is the second time
__asm__ __volalile__("cli;inb $0x60,%0;sti;":"=r"(value));
printf("%x",value);// this print in teh screen ffffffa ainteger value

i'm expecting a ACK response for the keyboard ACK is in the ffffffa the 
first byte buti cant never know ir caouse when i ask for ack it inst ack in 
ffffffa and it is bigger than a byte why iot happend??????????????????''

Take Care Folks.

Martin Flores

_________________________________________________________________
Don't just search. Find. Check out the new MSN Search! 
http://search.msn.com/

