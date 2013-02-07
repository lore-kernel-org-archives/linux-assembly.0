From: Hendrik Visage <hvjunk@gmail.com>
Subject: Re: mov instruction
Date: Thu, 7 Feb 2013 15:57:37 +0200
Message-ID: <CADtGFv=CY+wFMRgzsrp3wcspMEhUYnCKSpQz6vfHJYhTUbVXBQ@mail.gmail.com>
References: <20130207035714.GC2669@debian.localdomain>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=A6oN58JkC0MjVCcZzFtv7+hWPEvESSF6lAj7J8ooreo=;
        b=0c1qShNEoZICBJ9whR9Ps2NgXpaRoT5etXILmTw+WBarPBqcH71BJhZi6lkuiIJa59
         wR/0oUZ4LETDVYVxoXXApuHEjDzc7trssg+y4ojIpl235YW2MGa/3j0KrunyBfUnV/GF
         pP7oQO0I4L/yTv/IygDvLu7ae70m3A9xU8LRB+XzZFFq6Bu8nstpa11PzIYrisj4KtpM
         MUjiU6x2/Mh4kmKONLfIw0flZfUejZ36h/UM02nmBhqMlNi2uuAwRuwlYzyMF7YDO6kX
         y8SYmVqle/rDaO2BpcOnKclogfEjyEcr+0gX7tbGrTqWCdMu+H7f3eJvLOSJeEuQGiuY
         Z3UA==
In-Reply-To: <20130207035714.GC2669@debian.localdomain>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: horseriver <horserivers@gmail.com>
Cc: linux-assembly@vger.kernel.org

On Thu, Feb 7, 2013 at 5:57 AM, horseriver <horserivers@gmail.com> wrote:
> hi:)
>
>   Is here a suitable place to post topics about hardware technology?
>
>   I am curious about how mov work.
>   Why it can not move data from a mem adress to another adress  in one instruction.
>   in this form : mov (eax), (ebx)

That is what the (rep) movs(b/w) etc. operation(s) are designed for
these "string copy" operations. the old 8086 had those running between
es:di and ds:si as the registers for this.
