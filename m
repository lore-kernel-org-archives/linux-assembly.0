From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4] hwmon: (dell-smm) Improve assembly code
Date: Wed, 2 Mar 2022 10:07:39 -0800
Message-ID: <20220302180739.GA2523230@roeck-us.net>
References: <20220220190851.17965-1-W_Armin@gmx.de>
Mime-Version: 1.0
Return-path: <linux-hwmon-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J/s4xqCRoWiFmWXpzdAOAxlkHW471J5Hy/uYDHz0d/w=;
        b=JGo4WaorBbqcjTp++mSkoEhTIVI9A4GY6eRo+ydHC3Ijjg633y9/PwTqXe9nGmy4eY
         ZAYBWBwJ75GuA3NvGRfKn1gMonZO5Z5mFWIYvPSSZy+/d1Pl2gKyKKV5w/lhS3Sz8mPG
         jyjjswc6Q6C5jqcQO274YdbbAKy2cDPN5ve5dC44/Vn7KPNsXTP5mcQKXH6qoyzu0+eT
         TYlwuONO+bkgqqDSgeTs4d8JJQToUUk3+rt3z+pT6E5TewVGmGX+H1/AP7fPat+hAAzv
         kxwNPLOo/O3N5C/7hGGiB7bqD9c3TEHT3iQUOXsyBj1WyFhIgMSDXIz97B+4aY+zTXE3
         D7oQ==
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

I still did not get any Reviewed-by: or Tested-by: tags for this patch.
There was a suggested change (to either set or clear the carry flag
before executing the out instructions) but that would actually change
the behavior of the code and should be implemented as separate patch
to make it easy to revert without impact on this patch if needed.

Unless someone steps up, that leaves this patch (unfortunately) in limbo.

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
