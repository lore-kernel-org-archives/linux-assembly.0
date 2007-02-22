From: "Richard Guenther" <richard.guenther@gmail.com>
Subject: Re: "Error: suffix or operands invalid for `push'" on 64bit boxes
Date: Thu, 22 Feb 2007 13:23:51 +0100
Message-ID: <84fc9c000702220423k22066ea1vcc629b74851ae931@mail.gmail.com>
References: <35f686220702220350sa328106v6ad9f4a5e42f1dd7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <gcc-return-134705-gcc=m.gmane.org@gcc.gnu.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;         d=gmail.com; s=beta;         h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;         b=R1uKe/WT8N4LjTjb9fsWs+RXZNISJJKaPu4l+QsfKPoIhw1ksTcGIcIQPHy0BQYYnCF90kQmXsY1MK5dnzw84YIq4TcVbMoXOgbw74c6h7L2lvmZHCCqOoFkWfET8xJCkrmV+oQwQOWn4NLYv4m+sAcCin+MufCa+QfqrjTMero=
In-Reply-To: <35f686220702220350sa328106v6ad9f4a5e42f1dd7@mail.gmail.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alok kataria <alokkataria1@gmail.com>
Cc: gcc@gcc.gnu.org, linux-assembly@vger.kernel.org

On 2/22/07, Alok kataria <alokkataria1@gmail.com> wrote:
> Hi,
>
> I was trying some inline assembly with  gcc.
>
> Running the assembly program on 64 bit system ( with 64bit gcc
> version) gives errors of the form
>
> /tmp/cc28kO9v.s: Assembler messages:
> /tmp/cc28kO9v.s:57: Error: suffix or operands invalid for `push'

This is off topic here, please use gcc-help@gcc.gnu.org for this kind
of questions.
Your assembly statements are not valid 64bit asm but only work on 32bit.

Richard.
