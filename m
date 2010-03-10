From: Bai Shuwei <baishuwei@gmail.com>
Subject: Re: how to get AMD CPU identification information?
Date: Wed, 10 Mar 2010 11:07:56 +0800
Message-ID: <f3566d61003091907r601ddd4aja59f1c43524d97ff@mail.gmail.com>
References: <f3566d61003090627s7f018511t444fa28bb02b341a@mail.gmail.com>
	 <20100309163646.GE16373@opentech.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=+q8+7cEgrSZGzs9nxOREi/ttgzNPuqtr7PLXP+Lz/e8=;
        b=TVE28Ql96CfoRyJa0Fs5YV/miSIYxHUc605xLqHsaqusjg3+iau4VGLKnR4vJNm/uO
         Be5yqSpsXUrFH+aoKMicjdGEfLvVyFnWznGlaOEsRIGltxcDkYwTvPwoy+rUhgUGVRFR
         F6gt80wugdDxzNld+RQ9A850gHKhhh55xOnhk=
In-Reply-To: <20100309163646.GE16373@opentech.at>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: linux-assembly@vger.kernel.org

On 10 March 2010 00:36, Nicholas Mc Guire <der.herr@hofr.at> wrote:
> On Tue, 09 Mar 2010, Bai Shuwei wrote:
>
>> Hi, ALL:
>> =A0 =A0On the Intel platform, we can use the CPUID instruction to ge=
t the
>> processor serial number which is the identification for the CPU. But
>> on the AMD platform, i find only can get the cpu family,model,
>> stepping. I think those information cannot identify one processor. S=
o
>> how i can get the identification information for AMD processor, or h=
ow
>> i distinguish every AMD processor?
>>
>>
> you can get the values from the "CPUID Specifications April 2008"
> http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_do=
cs/25481.pdf - basically you should be able to get all the infos you ne=
ed to identify
> the specifics of a processor (AMD or Intel).
>
> you also can get the values with rdmsr - on a debian box
>
> rtl26:~# apt-get install msr-tools
> rtl26:~# modprobe msr
> rtl26:~# rdmsr --decimal 16 --hexadecimal =A0(to read the TSC in this=
 case)
> be3163d1778
>
> details in http://www.amd.com/us-en/assets/content_type/white_papers_=
and_tech_docs/41322.PDF =A0(atleast for the phenom)
>
> you also want to grab the AMD "BIOS and Kernel Developers Guide" - th=
ere is one
> for every processor - so it could be a bit painfull to figure this ou=
t for all possible processors. The one for AMD Hammer is at http://www.=
amd.com/us-en/assets/content_type/white_papers_and_tech_docs/26094.PDF
>
> HTH
>
> hofrat
>
>



--=20
Love other people, as same as love yourself!
Don't think all the time, do it by your hands!

E-Mail: baishuwei@gmail.com
--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
