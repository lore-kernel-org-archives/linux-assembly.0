From: Stephan Walter <stephan.walter@gmx.ch>
Subject: Re: gunzip
Date: Sat, 31 Aug 2002 17:08:43 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020831170843.549e30f9.stephan.walter@gmx.ch>
References: <1030783657.5588.8.camel@freyr.localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <1030783657.5588.8.camel@freyr.localnet>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

On Sat, 31 Aug 2002 10:47:37 +0200, Ewald Wasscher
<ewald.wasscher@pobox.com> wrote:
> Hello all,
> 
> Does anyone know if a mini implementation of g(un)zip in assembly
> exists?

I do not know of any. Gzip's algorithm is quite complicated. But it
shouldn't be impossible to write one yourself ;-)

There is an LZSS compression algorithm implemented (see asmutils). I can
send you a LZP-compression program if you are interested (but it is not
mature yet)

Cheers,
Stephan
