From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: Writing Linux Device drivers with NASM
Date: Mon, 13 Mar 2006 11:56:27 -0500
Message-ID: <4415A43B.8030804@comcast.net>
References: <BAY102-F10A22842764940C4627CBAA3E00@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <BAY102-F10A22842764940C4627CBAA3E00@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ALberto Andres <betorumbero@hotmail.com>
Cc: linux-assembly@vger.kernel.org

ALberto Andres wrote:
> Hi everybody, I'm writing a guide about device drivers in assembly under 
> linux. I'm using NASM.  If anybody is interested here is the URL:
> 
> http://albertoandreotti.5000megs.com/

Great, Alberto! Couple thing seems strange to me. I don't know anything 
about device drivers, so perhaps it really *is* that strange...

You say:

    2.      Stack cleanup is performed by the called function.
    3.      Function name is decorated by prepending an underscore character

But that doesn't seem to be what you show...

And... your strings have got CRs in 'em. Is that normal/required for 
device drivers?

I'm sure I'll have more questions... Great resource. Thanks!

Best,
Frank

