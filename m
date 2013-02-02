From: horseriver <horserivers@gmail.com>
Subject: Re: Disassembly  of  00000
Date: Sun, 3 Feb 2013 02:54:40 +0800
Message-ID: <20130202185440.GA2519@debian.localdomain>
References: <20130202045339.GD2391@debian.localdomain>
 <20749.23788.343335.87280@eidolon.muppetlabs.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=gg//7fVXfoW3oI/jAe3JjErFGLfwnUwLuxf2Yo1nbt8=;
        b=sFFKyX5xhyEU+mtUBiLjYe8NTaIKEwWjvacuMcgBYhrYpYKlwguoOQ1+4FjgNzdzMG
         6cL095xY6thRFQYNJ5OCgy7yKsiyPDTQJAQXsq3TGwj7ZTjOwU0NzkILXNexFxAZe/fv
         MizoHt2NStAfDQFy8CX4NIdxODJBBEX2xrPM2KWdLijlf89SADOCwPMsbsmTgyubK/Hb
         Vzs/EzalXVo10D5j7Id2HRX82ntaZrTjKBz1L8OFeWr30W38Sf16jizwep6+FMu6Geoz
         mDwedB+sLGDGkpPjmmwteR+PQqC+4qWAUPBJd/8KQ1gnFndthI80vILnFKpgmwJMWyzp
         /FyQ==
Content-Disposition: inline
In-Reply-To: <20749.23788.343335.87280@eidolon.muppetlabs.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

On Sat, Feb 02, 2013 at 10:37:32AM -0800, Brian Raiter wrote:
> >    I have a question about disassemblly utility .
> >    If I fill an elf's text section with some random data,then 
> >    how does the disas command work for these data?
> >    Is there occasion that several sequence of bytes can not be translated
> >    into legal instructions?
> 
> Yes, definitely. In those cases a typical disassembler will just mark
> the first byte as being literally emitted and try to resume
> disassembly at the next byte. For example, using ndisasm v2.07:
 
  Thanks!
  What is "literally emitted" meaning here? 
  I guess you mean a const value definition.
  How does disassembler check the number of bytes which consist an instruction  ? 
  Can only noe byte tell the instruction's length?
  
> 
> $ echo -e '\017zz' | ndisasm -
> 00000000  0F                db 0x0f
> 00000001  7A7A              jpe 0x7d
> 00000003  0A                db 0x0a
> 
> b
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
