From: alter Gonzalez <wgonzalez@persystems.com>
Subject: I have a problem with inline ASM
Date: Thu, 04 Jul 2002 16:18:20 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D24BB9C.E518173C@persystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org, wgonzalez@persystems.com

Good morning first all.

I need to do a encrypt routines for linux asm.

tha call is as:

....

unsigned int xorValue;

xorValue = 0x2030;

for (index = 0; index < 0x20; index ++) {
 xor_word(*(unsignded int *)&fuffer[index],xorValue);

}



...

The problem is that if I want to use WORD (i.e. unsigned int , or int)
values , RHIDE show an error.
I believe that all is fine.

Can you helpme , please?


The .H y .C files are ..

//------------------------------------------------------

//ENCRYPT.H

#ifndef _ENCRYPT_H_
#define _ENCRYPT_H_

...

BYTE  rol_byte(BYTE value  , BYTE bits);
WORD  rol_word(WORD value  , BYTE bits);
......

#endif

//------------------------------------------------------

//ENCRYPT.C


BYTE rol_byte(BYTE value, BYTE bits)
{
  __asm__ __volatile__("movb %1, %%al;
                        movb %2, %%cl;
                        rolb %%cl, %%al;
                        movb %%al, %0;"
                       :"=al"(value)              // output
                       :"al"(value),"cl"(bits)    // input
                       );

  return value;
}

WORD rol_word(WORD value, BYTE bits)
{
  __asm__ __volatile__("movl %1, %%eax;
                        movb %2, %%cl;
                        roll %%cl, %%eax;
                        movl %%eax, %0;"
                       :"=eax"(value)              // output
                       :"eax"(value),"cl"(bits)    // input
                       );

  return value;
}


 with inline ASM

