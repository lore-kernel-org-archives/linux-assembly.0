From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4] hwmon: (dell-smm) Improve assembly code
Date: Mon, 20 Jun 2022 08:21:10 -0700
Message-ID: <20220620152110.GA2763893@roeck-us.net>
References: <20220220190851.17965-1-W_Armin@gmx.de>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IVYCXgnk9I7FC9XCv36dSAgZtCs0Nch6WzYcIDnwYsc=;
        b=RGfB4iFgqijRsYxkMmPAp6Yy4zjX/O7WbXtzqQdUPXydPm9cYv4xITbvAd9SwDB7gS
         PtMxaK/hw3sAopmIi1S1oFi+kN4MrAP40DuTtgH9Wo0cGjOYA6uLaUDJZiO9TIKnNRIE
         BOLzTNseGQuQNJjpSoI5yC1yyqIaVT1+sd5JtwC/+N+yYKSTh/5rjwzYmkYlIXcBuVmO
         KK5V5nQAbahIBCrh5DZ4V8XpIfcs5TWADS6jmpJ495GNJSbvsgl2hs7mYsufsnEJbgZu
         Lr7gqmH2preednhNn9U7bv1Nc24QnsCQcequaCZ9rfIrnA8fzqTCm+bruiI6IzJgZoWb
         1pAw==
Sender: Guenter Roeck <groeck7@gmail.com>
Content-Disposition: inline
In-Reply-To: <20220220190851.17965-1-W_Armin@gmx.de>
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Armin Wolf <W_Armin@gmx.de>
Cc: pali@kernel.org, jdelvare@suse.com, David.Laight@ACULAB.COM, linux-hwmon@vger.kernel.org, linux-assembly@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Feb 20, 2022 at 08:08:51PM +0100, Armin Wolf wrote:
> The new assembly code works on both 32 bit and 64 bit
> cpus and allows for more compiler optimisations.
> Since clang runs out of registers on 32 bit x86 when
> using CC_OUT, we need to execute "setc" ourself.
> Also modify the debug message so we can still see
> the result (eax) when the carry flag was set.
> 
> Tested with 32 bit and 64 bit kernels on a Dell Inspiron 3505.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

I still have this patch hanging around, with no one willing to tell
me if there are real problems with it. Given that, I decided to just
go ahead and apply it to linux-next. If there turns out to be problems,
we'll see it soon enough and can always revert it. If not, the change
was worth it, so let's just accept the risk.

Guenter

> ---
> Changes in v4:
> - reword commit message
> 
> Changes in v3:
> - make carry an unsigned char
> - use "+a", ... for output registers
> - drop "cc" from clobbered list
> 
> Changes in v2:
> - fix clang running out of registers on 32 bit x86
> - modify debug message
> ---
>  drivers/hwmon/dell-smm-hwmon.c | 78 ++++++++--------------------------
>  1 file changed, 18 insertions(+), 60 deletions(-)
> 
> --
> 2.30.2
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index c5939e68586d..38d23a8e83f2 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -119,7 +119,7 @@ struct smm_regs {
>  	unsigned int edx;
>  	unsigned int esi;
>  	unsigned int edi;
> -} __packed;
> +};
> 
>  static const char * const temp_labels[] = {
>  	"CPU",
> @@ -164,74 +164,32 @@ static int i8k_smm_func(void *par)
>  	struct smm_regs *regs = par;
>  	int eax = regs->eax;
>  	int ebx = regs->ebx;
> +	unsigned char carry;
>  	long long duration;
> -	int rc;
> 
>  	/* SMM requires CPU 0 */
>  	if (smp_processor_id() != 0)
>  		return -EBUSY;
> 
> -#if defined(CONFIG_X86_64)
> -	asm volatile("pushq %%rax\n\t"
> -		"movl 0(%%rax),%%edx\n\t"
> -		"pushq %%rdx\n\t"
> -		"movl 4(%%rax),%%ebx\n\t"
> -		"movl 8(%%rax),%%ecx\n\t"
> -		"movl 12(%%rax),%%edx\n\t"
> -		"movl 16(%%rax),%%esi\n\t"
> -		"movl 20(%%rax),%%edi\n\t"
> -		"popq %%rax\n\t"
> -		"out %%al,$0xb2\n\t"
> -		"out %%al,$0x84\n\t"
> -		"xchgq %%rax,(%%rsp)\n\t"
> -		"movl %%ebx,4(%%rax)\n\t"
> -		"movl %%ecx,8(%%rax)\n\t"
> -		"movl %%edx,12(%%rax)\n\t"
> -		"movl %%esi,16(%%rax)\n\t"
> -		"movl %%edi,20(%%rax)\n\t"
> -		"popq %%rdx\n\t"
> -		"movl %%edx,0(%%rax)\n\t"
> -		"pushfq\n\t"
> -		"popq %%rax\n\t"
> -		"andl $1,%%eax\n"
> -		: "=a"(rc)
> -		:    "a"(regs)
> -		:    "%ebx", "%ecx", "%edx", "%esi", "%edi", "memory");
> -#else
> -	asm volatile("pushl %%eax\n\t"
> -	    "movl 0(%%eax),%%edx\n\t"
> -	    "push %%edx\n\t"
> -	    "movl 4(%%eax),%%ebx\n\t"
> -	    "movl 8(%%eax),%%ecx\n\t"
> -	    "movl 12(%%eax),%%edx\n\t"
> -	    "movl 16(%%eax),%%esi\n\t"
> -	    "movl 20(%%eax),%%edi\n\t"
> -	    "popl %%eax\n\t"
> -	    "out %%al,$0xb2\n\t"
> -	    "out %%al,$0x84\n\t"
> -	    "xchgl %%eax,(%%esp)\n\t"
> -	    "movl %%ebx,4(%%eax)\n\t"
> -	    "movl %%ecx,8(%%eax)\n\t"
> -	    "movl %%edx,12(%%eax)\n\t"
> -	    "movl %%esi,16(%%eax)\n\t"
> -	    "movl %%edi,20(%%eax)\n\t"
> -	    "popl %%edx\n\t"
> -	    "movl %%edx,0(%%eax)\n\t"
> -	    "lahf\n\t"
> -	    "shrl $8,%%eax\n\t"
> -	    "andl $1,%%eax\n"
> -	    : "=a"(rc)
> -	    :    "a"(regs)
> -	    :    "%ebx", "%ecx", "%edx", "%esi", "%edi", "memory");
> -#endif
> -	if (rc != 0 || (regs->eax & 0xffff) == 0xffff || regs->eax == eax)
> -		rc = -EINVAL;
> +	asm volatile("out %%al,$0xb2\n\t"
> +		     "out %%al,$0x84\n\t"
> +		     "setc %0\n"
> +		     : "=mr" (carry),
> +		       "+a" (regs->eax),
> +		       "+b" (regs->ebx),
> +		       "+c" (regs->ecx),
> +		       "+d" (regs->edx),
> +		       "+S" (regs->esi),
> +		       "+D" (regs->edi));
> 
>  	duration = ktime_us_delta(ktime_get(), calltime);
> -	pr_debug("smm(0x%.4x 0x%.4x) = 0x%.4x  (took %7lld usecs)\n", eax, ebx,
> -		 (rc ? 0xffff : regs->eax & 0xffff), duration);
> +	pr_debug("smm(0x%.4x 0x%.4x) = 0x%.4x carry: %d (took %7lld usecs)\n",
> +		 eax, ebx, regs->eax & 0xffff, carry, duration);
> 
> -	return rc;
> +	if (carry || (regs->eax & 0xffff) == 0xffff || regs->eax == eax)
> +		return -EINVAL;
> +
> +	return 0;
>  }
> 
>  /*
