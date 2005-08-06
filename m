From: Mohammad Badr <badrpayam@yahoo.com>
Subject: I have a problem with kernel
Date: Fri, 5 Aug 2005 22:09:10 -0700 (PDT)
Message-ID: <20050806050910.53830.qmail@web60518.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi

I had added an assembly program to the networking
section of kernel linux 2.2.16 without any problem.
But when I add it to kerenel 2.4.1 I could build that
kernel, but I faced with kernel panic when I boot
system with new builded image. I use the following
Make file to build It in the 2.4.1 kernel. 

/*--------------------------------*/
L_TARGET := libtest.a

obj-$(CONFIG_TEST)		+= test.o

override CFLAGS += -Wpointer-arith
override CFLAGS += -Wbad-function-cast
override CFLAGS += -DTERMIO


#-----------------------------------------------------------------------------
# Section 3 - Conversion routines from new style to
old style for Rules.make

#-----------------------------------------------------------------------------
# Section 4 - Rules.make section
include $(TOPDIR)/Rules.make
#-----------------------------------------------------------------------------
# Section 5

$(obj-y):  $(TOPDIR)/include/linux/config.h\
                       
$(TOPDIR)/include/linux/autoconf.h

clean:
	-rm -f *.o
tags:
	ctags libtest.a

tar:
	tar -cvf /dev/f1 .

test.o: test1.o test2.o test3.o 
	$(LD) -r -o $@ test1.o test2.o test3.o 

test3.o: test3.s
	$(AS) -o $@ $<
#-----------------------------------------------------------------------------
As you can see test3.s is an assembly file.
I guess this problem is related to this Makefile.
Is this Make file true?
How can I win over this problem?

thanks


		
____________________________________________________
Start your day with Yahoo! - make it your home page 
http://www.yahoo.com/r/hs 
 
