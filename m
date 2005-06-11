From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: inb
Date: Sat, 11 Jun 2005 18:38:09 +0200
Message-ID: <20050611163809.GA29844@MAIL.13thfloor.at>
References: <BAY14-F280DE79C5B1BF611CB993BD0FE0@phx.gbl>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BAY14-F280DE79C5B1BF611CB993BD0FE0@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Fflores <abebex17@hotmail.com>
Cc: linux-assembly@vger.kernel.org

On Sat, Jun 11, 2005 at 02:18:25PM +0000, Martin Fflores wrote:
> hi! everyone, i have a little problem with the extended assembly, when i 
> try to compile this:
> __asm__ __volatile__("inb %1,%0;":"=r"(returned):"r"(port));
> it makes a error layout, if instead i write :
> __asm__ __volatile("inb $0x64,%0;":"=r"(returned));
> its work right; So how i can make a macro that recibe a port value or 
> argumen like the first example???
> i wan to write in any port not a const value;
> 
> i hope you can help, i'm so coriosus abpout all this things of linux.
> Sorry abour my english

int     _inb(int port)
{
        unsigned char ret;
        __asm__ __volatile__ ("inb %w1,%0":"=a"(ret):"id"(port));
        return ret;
}

best,
Herbert

> Martin Flores.
> 
> _________________________________________________________________
> Express yourself instantly with MSN Messenger! Download today it's FREE! 
> http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
