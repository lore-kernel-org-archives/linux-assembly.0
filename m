From: "Guilherme Romao" <gui_slack@linuxmail.org>
Subject: RE: Make a Calculator! Help-me
Date: Fri, 18 Apr 2003 10:47:21 +0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030418024721.11219.qmail@linuxmail.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi, this is my source of my calculator:
 How I can to make the addition?  Thank You!

 .file "calculator.s"
.version "01"
gcc2_compiled.:
.section	.data
.msg:
	.string "\t\tCalculator in Assembly\n"
	tam: .long .- .msg
.pede1:
	.string "1 number: "
	tpede1: .long .- .pede1
.pede2:
	.string "2 number: "
	tpede2: .long .- .pede2
.result:
	.string "The result is"
	tresult: .long .- .result
.text
	.align 4
.globl main
	.type main,@function
main:

pushl %ebp		
movl %esp,%ebp		
movl $0x4,%eax		
movl $0x1,%ebx		
movl $.msg,%ecx		
movl tam, %edx		
int $0x80		

movl $0x4,%eax		
movl $0x1,%ebx
movl $.pede1,%ecx
movl tpede1,%edx
int $0x80

movl %esp,%ecx
subl $0xb,%esp

movl $0x3,%eax
movl $0xa,%edx
int $0x80

movl %eax,%edx
pushl %edx
movl %esp,%ebp
movl $0x4,%eax
movl $0x1,%ebx
int $0x80

movl $0x4,%eax
movl $0x1,%ebx
movl $.pede2, %ecx
movl tpede2, %edx
int $0x80


movl %esp,%ecx
subl $0xb,%esp

movl $0x3,%eax
movl $0xa,%edx
int $0x80

movl %eax, %edx
pushl %edx
movl $0x4,%eax
movl $0x1,%ebx
int $0x80

movl $0x4,%eax
movl $0x1,%ebx
movl $.result,%ecx
movl tresult,%edx
int $0x80

subl %ebp,%edx
movl $0x4,%eax
movl $0x1,%ebx

int $0x80

movl $0x1,%eax
movl $0x0,%ebx
int $0x80

.L1:
	leave
	ret
.Lfe1:
	.size main,.Lef1-main
	.ident "my"
	

-- 
______________________________________________
http://www.linuxmail.org/
Now with e-mail forwarding for only US$5.95/yr

Powered by Outblaze
