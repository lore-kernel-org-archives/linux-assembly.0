From: Emanuele Altieri <ealtieri@hampshire.edu>
Subject: Re: flat binary
Date: 24 Oct 2003 08:47:32 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <1066999465.2234.8.camel@italia>
References: <3F97F5B5.4010108@sh.cvut.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3F97F5B5.4010108@sh.cvut.cz>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mirek Dobsicek <m.dobsicek@sh.cvut.cz>
Cc: linux-assembly@vger.kernel.org

You should use GAS to generate an object file, then LD to generate the
flat binary file:

    $ as -o example.o example.s
    $ ld -Ttext 0x0 -s --oformat binary -o example.bin example.o

--Emanuele

On Thu, 2003-10-23 at 11:37, Mirek Dobsicek wrote:
> Hi,
> 
> I've my asm code in AT&T syntax a want to get flat binary file.
> But gas seems cant produce flat file and nasm dont understand at&t syntax.
> 
> Sure I can use some syntax convertor a use nasm, but that's not what I 
> want. Is there any suitable tool which understand at&t and produce flat 
> binary?
> 
> 
> Best regards, Elfi
> 
> ps: please CC me, I'm not it list
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

