From: Liam Prange <oasisbhrnw99@yahoo.com>
Subject: Trouble Creating File
Date: Tue, 13 Nov 2007 04:58:04 -0800 (PST)
Message-ID: <394554.37517.qm@web45114.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi all,

I am new to assembly language and I am having trouble
writing a program that creates a file.  The file does
get created, however, the program always causes a
segmentation fault.  The program is called "test" and
you give the name of the file you wish to create as an
argument, like so:  ./test create.txt

..section .data
..section .bss
..lcomm BUFFER, 500
..section .text
..globl _start
_start:
  
  movl %esp, %ebp  #setup for referencing the stack
  
  #Open/Create the file we are writing to
  movl $5, %eax
  movl 8( %ebp ), %ebx
  movl $03101, %ecx
  movl $0666, %edx
  int $0x80
  movl ( %eax ), %ebx    #save the fd

  #close the file
  movl $6, %eax
  int $0x80

Can anyone help me out as to why I am getting the
segmentation fault?

Robert


      ____________________________________________________________________________________
Get easy, one-click access to your favorites. 
Make Yahoo! your homepage.
http://www.yahoo.com/r/hs 

