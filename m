From: Jack Dennon <jdennon@seasurf.net>
Subject: Re: 2 questions on bootsect.S
Date: Mon, 13 Jan 2003 13:25:11 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3E232EB7.4841F0F5@seasurf.net>
References: <3E21EB31.3080709@curvesoft.com>
Reply-To: jdennon@seasurf.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------57CC523519048CABC5034B24"
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
To: ram <ram@curvesoft.com>
Cc: linux-assembly@vger.kernel.org

This is a multi-part message in MIME format.
--------------57CC523519048CABC5034B24
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Sorry, that was supposed to
attach in the clear as plain text.
Try one more time:



--------------57CC523519048CABC5034B24
Content-Type: text/plain; charset=us-ascii; name="boot.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="boot.txt"



#! /bin/bash
# asmboot.sh: assemble bootsect.S
cpp -traditional bootsect.S -o bootsect.ss
removebl < bootsect.ss > bootsect.s
as -aln=bootsect.lst -o bootsect.o bootsect.s

--------------------------------------------------------------
/* removebl.c: filter to remove blank lines
   ...well, most of them, leaves single blank lines in place
 */
#include <stdio.h>
#include <string.h>

#define MAXLINE 256
char line[MAXLINE];

/* getline: get line into s, return length */
int getline(char s[], int lim)
{
	int c, i;
	
	i = 0;
	while (--lim > 0 && (c = getchar()) != EOF
			 && c != '\n')
		s[i++] = c;
	if (c == '\n')
		s[i++] = c;
	s[i] = '\0';
	return i;
}

main()
{
	int c, i, length;
	int plength = 0;  /* previous line length */

	while ( (length = getline(line,MAXLINE)) > 0) {
		if (length > 1 || plength > 1) {
			for (i = 0; i < length; i++)
			putchar(line[i]);
		}
		plength = length;
	}
}


--------------57CC523519048CABC5034B24--

