From: "Mark Lobo" <ntdeveloper2002@hotmail.com>
Subject: atomic_add_and_test
Date: Mon, 16 Jun 2003 15:40:37 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Law11-F123JwM21tVHd000a4bf1@hotmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Guys
Im trying to implement this function which I absolutely need. The function 
is as follows:
int atomic_add_and_test(atomic_t *value, int addval)
This adds "addval" to "value" and returns the old value of "value" back.
Im not an expert at assembly syntax, Im not even sure how to write this 
function. I had done some 886 assembly and some microcontroller assembly 
stuff, but that was ages back. I would really really appreciate if someone 
can correct the source I have below. I did try to read up and I will 
definitely learn it back:) But I need this right now, so I would really 
appreciate it if  someone can correct this for me:) This might be assembly 
101:) but Im unfortunately its been ages since I did it.

static __inline__ int32_t atomic_add_and_test(atomic_t * p_plValue, int32_t 
p_lAdd)
{
    int32_t l_lResult;
    __asm__ __volatile__ (
	    "push %%EBX;"
	    "movl %1, %%EBX;"
	    "movl %2, %%EAX;"
	    "lock; xadd %%EAX, (%%EBX);"
	    "inc %%EAX;"
	    "mov %%EAX, %0;"
	    "pop %%EBX"
	    : "=g"(l_lResult) : "g"(p_plValue), "g"(p_lAdd):"%eax", "ebx" );
    return l_lResult;
}

Thanks!
Mark

_________________________________________________________________
Protect your PC - get McAfee.com VirusScan Online  
http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963

