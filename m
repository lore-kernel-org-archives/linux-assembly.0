From: "Pawel Pustelnik" <pawelpus@wp.pl>
Subject: compiler error
Date: Sat, 24 Jul 2004 22:08:08 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <opsbnrjub8jku7fn@smtp.wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: linux-assembly@vger.kernel.org

Hi,

I used assembler code in my cpp code
( __asm__ __volatile__(...) )
This assembler's syntax is ok but i can not compile my application
because after "g++ my_apps.cpp" I get:

/tmp/ccADrA0k.s: Assembler messages:
/tmp/ccADrA0k.s:3637: Error: too many memory references for `movq'

Maybe I do not know something about inline assembler?

-- 
Using M2, Opera's revolutionary e-mail client: http://www.opera.com/m2/
