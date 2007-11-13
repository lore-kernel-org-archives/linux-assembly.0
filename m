From: "LaPoint, Adam W" <Adam.W.LaPoint@usa-spaceops.com>
Subject: RE: Trouble Creating File
Date: Tue, 13 Nov 2007 11:33:19 -0500
Message-ID: <67BAE09A2D3D814E8F23BE11A200140E3A7B21@usaflcms06.usa-spaceops.ksc.nasa.gov>
References: <394554.37517.qm@web45114.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <394554.37517.qm@web45114.mail.sp1.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Liam Prange <oasisbhrnw99@yahoo.com>, linux-assembly@vger.kernel.org

Change
  movl ( %eax ), %ebx    #save the fd
to
  movl %eax, %ebx


-----Original Message-----
From: linux-assembly-owner@vger.kernel.org
[mailto:linux-assembly-owner@vger.kernel.org]On Behalf Of Liam Prange
Sent: Tuesday, November 13, 2007 7:58 AM
To: linux-assembly@vger.kernel.org
Subject: Trouble Creating File


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

-
To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
