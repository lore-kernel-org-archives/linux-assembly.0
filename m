From: "ssams" <ssams@telkom.net>
Subject: calculating byte
Date: Thu, 24 Jul 2003 05:15:53 +0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <web-3860654@b1.c.plasa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; 
To: linux-assembly@vger.kernel.org

hi all
if u have time, please answer my following question
i try to learn more about assembly. in a time i'found some 
article that explain about exploit, and i get this 
following code. My question is.. how to calculate byte at 
each line..?
thnaks before
regard
ssams
            .....
            ..... 
            movl %esi,array-offset(%esi) # 3 bytes
            movb $0x0,nullbyteoffset(%esi)# 4 bytes
            movl $0x0,null-offset(%esi) # 7 bytes
            movl $0xb,%eax # 5 bytes
            movl %esi,%ebx # 2 bytes
            leal array-offset,(%esi),%ecx # 3 bytes
            leal null-offset(%esi),%edx # 3 bytes
            int $0x80 # 2 bytes
            ....
            ....
===========================================================================================
"TELKOMNet Instan Divre VI Kalimantan memberikan DISKON PROGRESSIVE kepada para pengguna 
TELKOMNet-Instan hingga 50% mulai bulan Juli hingga September 2003." 
===========================================================================================
