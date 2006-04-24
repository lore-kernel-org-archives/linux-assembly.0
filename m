From: Tu Ha <httu@tma.com.vn>
Subject: Re: please help me
Date: 24 Apr 2006 08:09:47 -0400
Message-ID: <1145880587.3994.3.camel@gaucon>
References: <1145873491.3998.17.camel@gaucon> <444C5007.7080203@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <444C5007.7080203@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frank Kotler <fbkotler@comcast.net>
Cc: linux-assembly@vger.kernel.org

Thanks a lot.
I got your point. Wrong assumption problem.
It runnnnnnnnnnnnnnnnnnns


On Mon, 2006-04-24 at 00:11, Frank Kotler wrote:
> Tu Ha wrote:
> 
> ...
> > It seems I cannot reference to the "char" memory location. Why?
> 
> Wrong combination of ".org" and ds register, I think. Either use ".org 
> 0x7C00", and load ds from cs (presumably zero) as you do (you'll have to 
> adjust the .org on the signature, too). Or... leave it at ".org 0" (I 
> assume that's what Gas defaults to), and load ds with 0x7C0. (bios loads 
> us at 0x7C00, which can be represented as either 0000:7C00 or 07C0:0000).
> 
>  > How can I debug the binary?
> 
> Bochs? I've never used it, but I understand it'll debug bootsectors...
> 
> Happy bootin',
> Frank
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

