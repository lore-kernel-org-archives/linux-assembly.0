From: fmarmond@eprocess.fr
Subject: Re: execve with env..
Date: Thu, 27 May 2004 21:40:21 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <1085686821.40b644254ebbb@intranet.eprocess.fr>
References: <20040527172300.51928.qmail@web90108.mail.scd.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20040527172300.51928.qmail@web90108.mail.scd.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Danett song <danett18@yahoo.com.br>
Cc: linux-assembly@vger.kernel.org

I have no time today, but I'll try to help you tomorow. 
Can you provide a commented version of your code? 
(just the name of the called interrupt's function, the ascii you push on stack 
in clear, ...) 
It would save me time to translate your hexa into ascii... 
 
What I can say very quickly is: 
"Linux ignores the SUID and SGID bits on scripts." (from the execve man page) 
 
 
Fred 
 
 
 
Selon Danett song <danett18@yahoo.com.br>: 
 
> Hi, 
>  
> I'm trying code via asm inline a code that will call 
> setuid the execve() to call /bin/sh but it must pass 
> as last argument (env) the HISTFILE=/dev/null and then 
> call exit, i done this code and it run, but i don't 
> know why it doesn't set the env HISTFILE=/dev/null :( 
>  
> code: 
>  
> #include <stdio.h> 
>  
> int main(){ 
>  
> __asm__( 
>         "xor %eax, %eax   \n" 
>         "xor %ebx, %ebx   \n" 
>         "mov $0x17, %al   \n" 
>         "int $0x80        \n" 
>         "xor  %eax,%eax   \n" 
>         "push %eax        \n" 
>         "push $0x68732F2F \n" 
>         "push $0x6E69622F \n" 
>         "mov  %esp,%ebx   \n" 
>         "push %eax        \n" 
>         "push %ebx        \n" 
>         "mov  %esp, %ecx  \n" 
>         "xor  %edx, %edx  \n" 
>         "push $0x6C6C756E \n" 
>         "push $0x2F2F7665 \n" 
>         "push $0x642F2F3D \n" 
>         "push $0x454C4946 \n" 
>         "push $0x54534948 \n" 
>         "push %eax        \n" 
>         "mov  %esp, %edx  \n" 
>         "mov  $0x0b, %al \n"  
>         "int  $0x80      \n"  
>         "xor  %eax,%eax  \n"  
>         "mov  $0x01,%al  \n"  
>         "int  $0x80      \n" 
>  
>         ); 
>  
> return(0); 
> } 
>  
> Someone know what i'm making wrong ? 
>  
> Thkz. 
>  
>  
> ______________________________________________________________________ 
>  
> Participe da pesquisa global sobre o Yahoo! Mail:  
> http://br.surveys.yahoo.com/global_mail_survey_br 
> - 
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in 
> the body of a message to majordomo@vger.kernel.org 
> More majordomo info at  http://vger.kernel.org/majordomo-info.html 
>  
>  
 
 
 

-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/
