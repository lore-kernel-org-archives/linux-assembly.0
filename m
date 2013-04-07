From: ishare <june.tune.sea@gmail.com>
Subject: Re: how does ld.so call ELF's entry?
Date: Sun, 7 Apr 2013 11:39:13 +0800
Message-ID: <20130407033913.GB9617@debian.localdomain>
References: <20130407021921.GA9462@debian.localdomain>
 <CAN0_x-Je1=2mtN8tY2mvBa-X7_P0dBoG9KRh0P63uW91eE5H2Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=Rrf6aA9pmO7XdTd8TicDUDiCGqCNYXy9IVgeg5fFswA=;
        b=SBiUh59OddEJ7qHGuUcYxtCsGdnhM8eHW4SRJkzYMMeJXKda/nhUWZp8kZNukhg1a9
         ztPFNDuZXTvwN+spS66IGQllabFhWSXSHPbuZJ6sLKtUp5RsCh+82VhWKm4id0gsgqoW
         500iyEQp6UE6sRplp5OYZ1txWJfShAtN0D7Q0rUm66lg6f408TiO/osKjBl+TogsZg5k
         R2kwTP95Y8PXLlqEZchsZp9sDbo1UPkTXl0NeoO30eq9NMyGpCS4/tIXmGTDqU/66F8q
         v492Smhu1tqpirH/YfBMb5kMwf/3IVOYroM7qRbpTY0btafwvGfq1qQ1lVwvzz2nLslA
         MW4A==
Content-Disposition: inline
In-Reply-To: <CAN0_x-Je1=2mtN8tY2mvBa-X7_P0dBoG9KRh0P63uW91eE5H2Q@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sofiane Akermoun <akersof@gmail.com>
Cc: linux-assembly@vger.kernel.org

On Sun, Apr 07, 2013 at 05:11:28AM +0200, Sofiane Akermoun wrote:
> Hello,
> 
> 
> The interpreter is specified during linking process and the program header
> of your binary is filled with good values.
> Then when the operating system load your binary, he finds next the
> interpreter to use.
> The linker ld sets the good values by default but you can overwrite it or
> specify other values if you want.
> The steps are:
> 1)The operating system loads your binary
> 2)The program loader system execute the Interpreter specifiy in the binary
> 3)The interpreter gather all the dynamic libraries needed in memory


> 4)The Control is passed to the entry point of your program

  How does  the step 4 been  done ?
  
  thanks!
> 
> The entry point is specified in your code source as a "global". And could
> be find in your object file by the linker.
> In theory there are some default tag to specify entry point, like "..start"
> for nasm, but you can also passed it to the linker.
> 
> regards,
> 
> Sofiane Akermoun
> akersof@gmail.com
> 
> 
> 
> 
> 
> 2013/4/7 ishare <june.tune.sea@gmail.com>
> 
> >
> >   For an ELF ,which needs a interpreter , how is it  been called by the
> > interpreter ?
> >
> >   As I know the interpreter is loaded first and do something essential
> > ,then call the main routine of ELF .
> >   How is this procedure implemented ?
> >
> >   Thanks!
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-assembly"
> > in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> 
> 
> 
> -- 
> Sofiane AKERMOUN
> akersof@gmail.com
