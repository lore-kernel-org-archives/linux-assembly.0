From: Stephan Walter <stephan.walter@gmx.ch>
Subject: Re: shellcode
Date: Tue, 25 Jun 2002 21:22:14 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020625212214.4910d000.stephan.walter@gmx.ch>
References: <20020624001839.H342@nietzsche>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20020624001839.H342@nietzsche>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

This is my 5-minute analyzing:

$ echo -n \
$'\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\
x50\x54\x53\xb0\x3b\x50\xcd\x80' >> shell.asm

$ ndisasm -u shell.asm

00000000  31C0              xor eax,eax
00000002  50                push eax
00000003  682F2F7368        push dword 0x68732f2f   ; "//sh"
00000008  682F62696E        push dword 0x6e69622f   ; "/bin" 
						    ; -> execute /bin/sh
0000000D  89E3              mov ebx,esp   ; ebx points to the string
0000000F  50                push eax      
00000010  53                push ebx
00000011  50                push eax
00000012  54                push esp
00000013  53                push ebx
00000014  B03B              mov al,0x3b   ; 0x3b = SYS_execve
00000016  50                push eax
00000017  CD80              int 0x80      ; system call "execve"
					  ; -> execute the shell


Regards,
Stephan
