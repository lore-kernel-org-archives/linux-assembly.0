From: dAvId KeDrOsKy <davidkedrosky@rogers.com>
Subject: Mixing C and assembly
Date: Wed, 5 Mar 2003 23:50:00 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200303052350.00680.davidkedrosky@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Assembly Programming List <linux-assembly@vger.kernel.org>

Hello, 

Here's what most likely will turn out to be an easy answer to this newbie 
question.

I am trying to get some code running where I am using C and assembly.  The 
just of it is the C program asks the user for an integer, I then pass the 
integer to the assembly function and try to get it to print the integer to 
stdout.

The error I am getting when I try to run the program in KDevelop (which uses 
gcc) is:
main.c: undefined reference to `asm_func' 

----- C function (main.c) --------
#include <stdio.h>

// prototypes
extern void asm_func (int) __attribute__ ((cdecl));

int main(void)
{
    int n;
    
    printf ("Enter an integer 'n': ");
    scanf ("%d", &n);

    asm_func (n);

  return (0);
}

------ Assembly function (asm_func.asm) -------
;; Macro file
%include        "Io.mac"   	;; where the PutInt function comes from

section         .stack  0x100
section         .model  small

section         .text

global _asm_func

_asm_func:

enter   4, 0			;; 4 so that the stack can accomadate the integer 'n'

mov     ax, [esp-4]	;; this is where the integer should reside on the stack
PutInt  ax			;; prints the value of ax to stdout

leave
ret


Any suggestions/comments would be great.

Dave
