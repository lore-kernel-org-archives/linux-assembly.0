From: michael young <mhyoung@valdosta.edu>
Subject: DOS assembly questions?
Date: Mon, 20 Oct 2003 19:46:33 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F9473D9.8010304@valdosta.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Hi,
   First, is it OK to ask questions about assembly programming in DOS on 
this list?
If so, here is my problem.
I am a real newb at assembly and am still learning the very basics.
I have this bit of code. The way I understand it, this should print out 
"10".
It does not. It prints some strange ASCII chars.

mov cx, 10
mov dx, cx
mov ah, 9
int 21

Where am I going wrong?

thank you for your help,
Michael

