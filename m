From: Frank Kotler <fbkotler@zytor.com>
Subject: Re: writing a jump table
Date: Wed, 16 Mar 2011 10:26:40 -0400
Message-ID: <4D80C8A0.6090407@zytor.com>
References: <4D7FFFDD.5020103@gmail.com> <19840.863.574550.774103@eidolon.muppetlabs.com> <4D80C56F.4040403@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4D80C56F.4040403@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nicolas Bock <nicolasbock@gmail.com>
Cc: linux-assembly@vger.kernel.org

Nicolas Bock wrote:
> Hi Brian,
> 
> yes, I compiled it and when I run the code it segfaults.

Don't you need 64-bit addresses in your jump-table for 64-bit code?

Best,
Frank


