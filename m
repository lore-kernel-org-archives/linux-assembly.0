From: Jack Dennon <jdennon@seasurf.net>
Subject: Re: int 16 ?
Date: Sat, 15 Feb 2003 13:36:34 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3E4EB2E2.7DA23F1@seasurf.net>
References: <20030215181726.56630.qmail@web11101.mail.yahoo.com>
Reply-To: jdennon@seasurf.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------5371523B96CECBA198829884"
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
To: rodrigobaroni@yahoo.com.br
Cc: linux-assembly@vger.kernel.org

This is a multi-part message in MIME format.
--------------5371523B96CECBA198829884
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit



--------------5371523B96CECBA198829884
Content-Type: text/plain; charset=us-ascii; name="sysread.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="sysread.txt"


Here is an assembly language routine to call
the system read function via int 0x80:

-------------------------------------------------
#/* void asm_sysread(
#	int filedescriptor,
#	char *buffer,
#	int buffer_length)
#
#	invoke syscall __NR_read = 3
# */
	.file	"asm_sysread.s"
.text
.global	asm_sysread
.align	4
SIZE	= 16
BUFF	= 12
FILE	=  8

asm_sysread:
	pushl	%ebp
	movl	%esp,%ebp
	movl	FILE(%ebp),%ebx	#file descriptor
	movl	BUFF(%ebp),%ecx	#buffer fwa
	movl	SIZE(%ebp),%edx	#buffer size
	movl	$3,%eax		# __NR_read
	int	$0x80
	cmpl	$-126,%eax	#check return code
	jbe	.L1		#if no error
#
	negl	%eax		#complement eax
	movl	%eax,%ecx
	movl	$-1,%eax	#on error, return -1
.L1:		
	movl	%ebp,%esp
	popl	%ebp
	ret
	
	.type asm_sysread,@function
	.size asm_sysread,.-asm_sysread
--------------------------------------------------------

And here is a C program to call the above function:

---------------------------------------------------------
/* sysread.c: test the  read  system call
 */
#include <stdio.h>

#define BUFSIZE 16
extern void asm_sysread(int fd, char *buff, int bufsize);

main()
{
	int i;
	int fd = 0;		/* stdin */
	char buff[BUFSIZE];	/* input buffer */
	
	for (i = 0; i < BUFSIZE; i++)
		buff[i] = '\0';
		
	asm_sysread(fd,buff,1);	/* read one char */
	
	for (i = 0; i < BUFSIZE; i++)
		printf("%02x ",buff[i]);
		
	printf("\n");
}
----------------------------------------------------------

If you put these in separate files named, for example,
asm_sysread.s and sysread.c, then you can compile,
assemble, and link with the command

	gcc -o sysread sysread.c asm_sysread.s
	
When called with the command

	sysread

it somewhat works, but it does not do what we want;
the routine asm_sysread does not return after just
one key has been pressed, it returns only after we
hit [Enter]. So the question is, how do we modify
this code to do exactly what we want: fetch the
next keyboard entry and return immediately with it?

Having stalled out on this, I use curses.



--------------5371523B96CECBA198829884--

