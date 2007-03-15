From: ninjaboy <n0b0dyn1nj4@gmail.com>
Subject: cltq.
Date: Thu, 15 Mar 2007 01:17:36 +0100
Message-ID: <a3399010703141717s6e9568f8qe8ecdae35206a79e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        b=VIe99YScBJrlX/MB7R4OZPvdizu7NeA/yxbZuBDF9iBoNZ+TXwSBafvlDOg8USMOsBir0cOlNWBCei9GUdwEcNSlP44ma8OGz+9yqgVu60lPj3KbpBzlGTMRmo8dJ1dlckInVSpgVU5E6Jw1SmGhTl66nMGsT8uRTSJEzegt70Q=
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

hello,
what does cltq do?

0x0000000000400500 <my_m+4>:    movl   $0x0,0xfffffffffffffffc(%rbp)
0x0000000000400507 <my_m+11>:   jmp    0x40051b <my_m+31>
0x0000000000400509 <my_m+13>:   mov    0xfffffffffffffffc(%rbp),%eax
0x000000000040050c <my_m+16>:   mov    $0x4004e8,%edx
0x0000000000400511 <my_m+21>:   cltq
0x0000000000400513 <my_m+23>:   mov    %rdx,0xffffffffffffffa0(%rbp,%rax,8)
0x0000000000400518 <my_m+28>:   incl   0xfffffffffffffffc(%rbp)
0x000000000040051b <my_m+31>:   cmpl   $0xc,0xfffffffffffffffc(%rbp)
0x000000000040051f <my_m+35>:   jle    0x400509 <my_m+13>

what compares?
Thanks in advance,

-- 
noone is alone.
