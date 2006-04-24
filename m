From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: please help me
Date: Mon, 24 Apr 2006 00:11:51 -0400
Message-ID: <444C5007.7080203@comcast.net>
References: <1145873491.3998.17.camel@gaucon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <1145873491.3998.17.camel@gaucon>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tu Ha <httu@tma.com.vn>
Cc: linux-assembly@vger.kernel.org

Tu Ha wrote:

...
> It seems I cannot reference to the "char" memory location. Why?

Wrong combination of ".org" and ds register, I think. Either use ".org 
0x7C00", and load ds from cs (presumably zero) as you do (you'll have to 
adjust the .org on the signature, too). Or... leave it at ".org 0" (I 
assume that's what Gas defaults to), and load ds with 0x7C0. (bios loads 
us at 0x7C00, which can be represented as either 0000:7C00 or 07C0:0000).

 > How can I debug the binary?

Bochs? I've never used it, but I understand it'll debug bootsectors...

Happy bootin',
Frank


