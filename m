From: "Satendra..." <satendra.pratap@gmail.com>
Subject: Re Linux MIPS DSP-ASE Instructions usage
Date: Sun, 12 Dec 2010 18:13:32 +0530
Message-ID: <AANLkTimDL8OgTUsCAFn1xZ0EM+eAZ4aENGdZPqswLKpT@mail.gmail.com>
References: <AANLkTin1JTDQF7CApgiykQEwKBbeL_E_O77AapbZX+q-@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=C6NZztZUkDrX8MoVFq9vcvYdjr6NdW+pKq6gZbGPNj8=;
        b=xdFzTJ3Z31dRPYpRM140H1m4qbaqIwfIBSzLRRJHKzYPxal6NsjtaLOnqgnX6LXrD8
         6B4zd2LoSh2+Bt4++mQbncuj4ulCCHSVeLFiO2fp/jds9pZhqOabVaI6ShSbd8qGnEnI
         TXw7TA7ZVrTjqKcn6Y4KAP0uEgCPc/ClBCHdI=
In-Reply-To: <AANLkTin1JTDQF7CApgiykQEwKBbeL_E_O77AapbZX+q-@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org
Cc: das.asutosh@gmail.com

Hi ,

We are trying to use the MIPS-DSP-ASE instructions to extract bits
from a bit-stream.
The version is MIPS-32 rev 1. (Little Endian)
The problem is that, the extp and its variants extract the bits from
left-most i.e. MSB.
So each time we have to load to the accumulator, we have to reverse
the stream and then load,
and extract and then reverse. This in-turn is reducing the perfomance
rather than increasing it.

For instance,
Stream -> 111011011
extract 3-bits in C code => 011 (x = (unsigned) stream& ((1<<3 )-1) )
Load this stream to accumulator and extract 3 bits => 111

====
Now reverse the stream and load to accumulator => 110110111
extract 3 bits from accumulator => 110
Now reverse the extracted bits =>011

So we have to reverse the stream before loading to the accumulator and
reverse it again after extracting from
accumulator which reduces the performance drastically.
we guess the MIPS engineers would definitely have thought about it but
we are unable to figure out a way to use these
instructions without reversing the bit-streams.

Please can you let us know a way to use these instructions without reversing.

Here is the link to the patent:-
http://www.google.com/patents/about?id=RcGhAAAAEBAJ&dq=Microprocessor+instructions+for+efficient+bit+stream+extractions

Thanks,
Satendra
