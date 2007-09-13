From: Lukas <blurrpp@yahoo.com>
Subject: Re: getting at raw command line
Date: Thu, 13 Sep 2007 06:50:22 -0700 (PDT)
Message-ID: <422014.8649.qm@web50303.mail.re2.yahoo.com>
References: <2cf50a010709130518m78231c2fla98997a3a7b5c9fc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <2cf50a010709130518m78231c2fla98997a3a7b5c9fc@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

I don't know if i understand your question ... every
command line arguments you pass to program in Linux,
are left on the stack ( actualy they are pointers to
asciz strings )

Lukas

--- Jack Andrews <effbiae@gmail.com> wrote:

> hi there,
> 
> is there a way to get the raw text that eventually
> gets cooked to
> argc/argv?  is there any portable way?
> 
> ta,
> 
> 
> jack
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 



       
____________________________________________________________________________________
Boardwalk for $500? In 2007? Ha! Play Monopoly Here and Now (it's updated for today's economy) at Yahoo! Games.
http://get.games.yahoo.com/proddesc?gamekey=monopolyherenow  
