From: "ssams" <ssams@telkom.net>
Subject: looping_code
Date: Mon, 26 Aug 2002 16:19:31 +0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <web-43200817@m1.plasa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

i really new in linux assembly. i want to know how i loop
some code..?
i feel it is different with tasm, i have try tasm way for
looping but
it was not run cleanly in gnu assembly. are there any body
want to help me....?
by this code:

.data
msg: .byte 65,10

.text
   .globl mulai
mulai:
    mov $10,%edx
 
ulang:
  mov $4,%eax
  mov $1,%ebx
  mov $msg,%ecx
  int $0x80
  loop ulang

  mov $1,%eax
  int $0x80
   
---------------------  Yang Mudah dan Menghibur ----------------------------

 

Hosting menjadi mudah dan murah hanya di PlasaCom. Klik http://idc.plasa.com

F1 Mania!! Ikuti F1 Game di Obelix Game Corner di http://www.plasa.com/infotel/f1.html

 

---------------------------------------------------------------------------------------

