From: Daniel Hilst Selli <danielhilst@gmail.com>
Subject: Re: Translating nasm boot strap to as
Date: Sun, 20 Mar 2011 23:28:15 -0300
Message-ID: <4D86B7BF.3060802@gmail.com>
References: <4D84C23A.2020504@gmail.com>	<4D854D5E.6060402@zytor.com> <19845.21397.696278.116060@eidolon.muppetlabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=b2ex8eHoWoR3AoNNldLrv103iPMf1glssWxKGMU3fMY=;
        b=Zv4o5MgEv2HyXV0gqnGMaQ4qP8tMAqE2oMQlgnEh8sK6TpthczzUbxK3HqHzvzJiuJ
         koiqSd9y84jkKQ1rODZiJETx3xXGzA8ml7vzjyAJDcf3aFPxiuxaso6NPHPPbbkGQKCx
         p9amPfoJjFvth42Now21lp20im/dpNNlHHMHc=
In-Reply-To: <19845.21397.696278.116060@eidolon.muppetlabs.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brian Raiter <breadbox@muppetlabs.com>
Cc: Frank Kotler <fbkotler@zytor.com>, linux-assembly@vger.kernel.org

Thanks for all, now it works!

On 03/19/11 22:08, Brian Raiter wrote:
>>> times510-($-$$)  db  0
>> .org 510
> Even better!
>
> b


-- 
"Do or do not... there is no try" Yoda Master
