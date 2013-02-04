From: horseriver <horserivers@gmail.com>
Subject: Re: Disassembly of 00000
Date: Mon, 4 Feb 2013 14:24:58 +0800
Message-ID: <20130204062426.GD2612@debian.localdomain>
References: <20130202045339.GD2391@debian.localdomain>
 <20749.23788.343335.87280@eidolon.muppetlabs.com>
 <20130202185440.GA2519@debian.localdomain>
 <CAN0_x-Kw9TxbD4EHmD1Ns5BJtBXToW_qsXSZWRzEtKxObXMhSQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=pOt8FCsgVJcUnTiG3j/5c7NGAA7S1xxwmNr63ok6jLo=;
        b=HLBll1UF3ky7SkVwRbsmcImw423UrGyGalWr0lAednDeqT55rbqUNsdRnPDsNx63Df
         8dk3mPHt6uqvjtwzfrNV3ucUmmDrAUKGYa5fhsXF1fKEDCtG54QEVB7uk0ZM6ouSK5yV
         Ovi4itCtyEjgGby/L0FsXO80nUeaMD2WYTfh7t/YpGa1Y1krZyNT0rc1OX9UvKOa2VrI
         +sBBfiw6inX8yCyufSH1GPrtiLVGV1bAAr/ML3z6i1ccLS5Edw123Qr7BWTZD2JS+K70
         3/UXT0WOSb5tQ4sXpl5iuU1VOAoo8l1Zac/CqiHO/OhMGjiwslhR46exljtK41TXEkfF
         J6bg==
Content-Disposition: inline
In-Reply-To: <CAN0_x-Kw9TxbD4EHmD1Ns5BJtBXToW_qsXSZWRzEtKxObXMhSQ@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sofiane Akermoun <akersof@gmail.com>
Cc: linux-assembly@vger.kernel.org


>A disassembler just uses a table. The intel documentation describes all
>the instruction, with the method on how do decode it (not really the method
>you have to write it of course).
>A disassembler should know where to start to disassemble, else he will
>start by disassembling bad data.. and probably fail on an unknown or
>unlogical instruction, or the worst case everything will be ok.
  
  Thanks!

  What is the condition that decide one byte is or not a legal instruction's start ?

  Are there some occasions that disassembler need scan more than one byte to detect

  its logic ?




 

