From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: execve with env..
Date: Tue, 01 Jun 2004 10:29:29 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <40BC3E69.2060900@eprocess.fr>
References: <20040531183245.68583.qmail@web90104.mail.scd.yahoo.com>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20040531183245.68583.qmail@web90104.mail.scd.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Danett song <danett18@yahoo.com.br>
Cc: linux-assembly@vger.kernel.org

Danett song wrote:

>>2nd : have a look at 
>>htttp://www.linuxfocus.org/English/March2001/article183.shtml
>>    
>>
>
>Wonderful this file!! This Frederic who wrote it, is
>you ? 
>
>  
>
nope, I just found it with google, when I searched educationnal stuff 
for you.

>
>>But the most important is that you have to pass 3rd
>>argument to execve 
>>exactly as for its 2nd. (char* []).
>>    
>>
>
>Perfect! With a zero after and a zero before strings..
>
>  
>
? heu, what do you mean? Are you sure you've all understood about 
passing parameters to execve?
execve needs 3 params:
       int execve(const char *filename, char *const argv [], char *const 
envp[]);

- 1 is a filename (ptr to char , null terminated)
       "push %eax        \n"  // put zero at stack
       "push $0x68732F2F \n"  // FMD~: hs//
       "push $0x6E69622F \n"  // FMD~: nib/
       "mov  %esp,%ebx   \n"  // Copy 1arg execve
    as stack is 'reversed order', the first 'push %eax' (which is 
zeroed)  is the 'null' that will terminate the string.
    the 'mov %esp,%ebx' back up the pointer to the string into %ebx, 
which is the 1rst arg for execve system call

- 2 and 3 are null terminated arrays of null terminated strings
    the 'null terminated' string (same scheme as above):
       "push %eax      \n"    //FMD+: you've forgot this line
       "push $0x6C6C756E \n"  // FMD~:    llun
       "push $0x2F2F7665 \n"  // FMD~:    //ve
       "push $0x642F2F3D \n"  // FMD~:    d//=
       "push $0x454C4946 \n"  // FMD~:    ELIF  
       "push $0x54534948 \n"    // FMD+:    TSIH

    back up the pointer of this string
       "mov  %esp, %edx  \n"  // FMD+: back up the string pointer

    the 'null terminated' array:
        last row of the array (null)
           "push %eax        \n"  // put zero at stack
       first row of the array (pointer to the string)
       "push %edx      \n"    // FMD+: put the env string here in stack

    pointer to the array
       "mov  %esp, %edx  \n"  // copy 3arg execve

    here, stack only contains strings and and array of pointer to strings.
    parameters are passed to execve syscall with ebx, ecx and edx


do you get it?
if a particular point is unclear, just ask about, i'll detail it for you 
(i've some free time those days...)    

>  
>
>>I hope your intention is not to hack someone else
>>system, and that you 
>>play with that only for learning purpose...
>>    
>>
>
>Yes, only for learning how exploits, overflow,
>shellcode works. If i went hack someone i will use the
>leeto shellcodes avaible at internet :)
>
>  
>
I had played with it (pirating) when I was young, but I find it very 
much more exiting to create strong security softs rather than pirating 
baddly wrote ones.
If you want to be 'well-known', recognized and famous, you'd better try 
to improve soft security instead of trying to break them.
And I can tell you there is a lot of fun with that!

>  
>
>>If you have another question, feel free to ask! ;)
>>    
>>
>
>Thkz a lot again.
>  
>
you're welcome!

Fred

>Regards.
>
>______________________________________________________________________
>
>Participe da pesquisa global sobre o Yahoo! Mail: 
>http://br.surveys.yahoo.com/global_mail_survey_br
>
>  
>

