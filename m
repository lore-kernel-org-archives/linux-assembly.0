From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: how to get AMD CPU identification information?
Date: Tue, 9 Mar 2010 17:36:46 +0100
Message-ID: <20100309163646.GE16373@opentech.at>
References: <f3566d61003090627s7f018511t444fa28bb02b341a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f3566d61003090627s7f018511t444fa28bb02b341a@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bai Shuwei <baishuwei@gmail.com>
Cc: linux-assembly@vger.kernel.org

On Tue, 09 Mar 2010, Bai Shuwei wrote:

> Hi, ALL:
>    On the Intel platform, we can use the CPUID instruction to get the
> processor serial number which is the identification for the CPU. But
> on the AMD platform, i find only can get the cpu family,model,
> stepping. I think those information cannot identify one processor. So
> how i can get the identification information for AMD processor, or how
> i distinguish every AMD processor?
> 
>
you can get the values from the "CPUID Specifications April 2008"
http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/25481.pdf - basically you should be able to get all the infos you need to identify
the specifics of a processor (AMD or Intel).

you also can get the values with rdmsr - on a debian box

rtl26:~# apt-get install msr-tools
rtl26:~# modprobe msr
rtl26:~# rdmsr --decimal 16 --hexadecimal  (to read the TSC in this case)
be3163d1778

details in http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/41322.PDF  (atleast for the phenom)

you also want to grab the AMD "BIOS and Kernel Developers Guide" - there is one
for every processor - so it could be a bit painfull to figure this out for all possible processors. The one for AMD Hammer is at http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/26094.PDF

HTH

hofrat
 
