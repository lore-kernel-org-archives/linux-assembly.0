From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: atomic_add_and_test
Date: Fri, 20 Jun 2003 13:51:48 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3EF2F554.56611A01@wp.pl>
References: <Law11-F123JwM21tVHd000a4bf1@hotmail.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Mark Lobo wrote:
> 
> static __inline__ int32_t atomic_add_and_test(atomic_t * p_plValue, int32_t
> p_lAdd)
> {
>     int32_t l_lResult;
>     __asm__ __volatile__ (
>             "push %%EBX;"
>             "movl %1, %%EBX;"
>             "movl %2, %%EAX;"
>             "lock; xadd %%EAX, (%%EBX);"
>             "inc %%EAX;"
>             "mov %%EAX, %0;"
>             "pop %%EBX"
>             : "=g"(l_lResult) : "g"(p_plValue), "g"(p_lAdd):"%eax", "ebx" );
>     return l_lResult;
> }

Can't you just:

inline int add_and_test(int* value, int to_add)
{
   int old_result;

   asm volatile("
      lock
      xadd %%eax,(%%ebx)
   " : "=eax" (old_result) : "a" (to_add), "b" (value) );

   return old_result;
}

? Do you have to push %ebx on stack? Why do you inc %eax after xadd?

Regards,

-- 
Maciej Hrebien

