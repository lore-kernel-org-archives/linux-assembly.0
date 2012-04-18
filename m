From: JIA Zhongye <jia.zhongye@gmail.com>
Subject: Re: Declare strings on stack, gas
Date: Thu, 19 Apr 2012 02:14:36 +0800
Message-ID: <4F8F048C.8010302@gmail.com>
References: <4F8ED685.2030408@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=6akyiGJt/TjBpWayxZEkbxM0HESH/9kE980fG4QhC3Q=;
        b=1Czm9NlWRjh6ewzg9KVM35IfVLutSXohrF3vbHV+dz0KTa/Dmv1ak6sjdpBiISYbxH
         yuGkw3QLfOQmthr0R6iCGG0rlCoOKwfQI6wh+LGDnpBeqHzvgKXYdIgZBtA6beSR7JBs
         bFdWQs+F2qSJCZIs4zA0MfggJ6PTmnAXcu+lSez5r6O6tZSo51kdNaVZZ//4ecfN4+Ca
         Q/if6xlvibLkTrJUxCNMUJZV2R0vB8Zs1ohqpb0YV0pr87214kDcthzZaa/vD8sXgrgy
         NLW+i9axRhdmKxOu9H4h/x4/jky3rkIldMlObXPxJ2jF1mkIAFegsGIFwDCcq1NsDlWG
         ausA==
In-Reply-To: <4F8ED685.2030408@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Hilst <danielhilst@gmail.com>
Cc: linux-assembly@vger.kernel.org

Since the stack could be any arbitrary place in memory, I'm afraid you 
don't got too many choice but set-up the content by yourself.

When a local array of char is declared in C, i.e. something like:
void foo()
{
   char s[] = "hello world";
}
The compiler does just the same thing as you by MOVL, and when the 
string is rather long, the compiler would place the string in .data and 
call memcpy() to copy it to stack.

On 04/18/2012 10:58 PM, Daniel Hilst wrote:
> Is possible to declare strings on stack? I'm using mov + ebp offsets to
> do something like that.. Is there an easier way to do it?
>
> Here is an sample off how I'm doing it: http://sprunge.us/UUZI
>
> The hex numbers are a "Hello World" string..
> I have tried .assci without success :(
>
> Thanks in advance!
>
>

-- 
Regards,
Zhongye
