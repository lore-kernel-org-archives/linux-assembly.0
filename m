From: Chris Evans <axiomfinity@ymail.com>
Subject: Re: [NASM] ROR -> error: invalid combination of opcode and operands
Date: Mon, 11 Mar 2013 15:22:30 -0700
Message-ID: <EAFC33F5-9688-4C33-8DDB-7CA07DC04D3F@ymail.com>
References: <CAPf=7QaV18vMLRrG6fuApkOpVEE5LmVnDKfxd=S8kWRz8S=qiQ@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ymail.com; s=s1024; t=1363040552; bh=TYkiSYSFnT6oERXlsEDj9ZP3+IiE829+sHwy60D8Vuc=; h=X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:Received:References:Mime-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Cc:X-Mailer:From:Subject:Date:To; b=k9BGGCrKIzAH+4VADmX/LrmF0MMiPtSNTurSJ3fiZGyjlTZ5nVkX/Y6q6y48XqDMPTPfXyyx0m8PIXrAXlE/KWXcdy969GzMbJwG15EJZw5X/Ak1vDTyTtQRF7TaJ943xLKrlewct1IcXPxDs9CVEVeJs2L6RMUzm/qHiIEtvOw=
In-Reply-To: <CAPf=7QaV18vMLRrG6fuApkOpVEE5LmVnDKfxd=S8kWRz8S=qiQ@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Meher Assel <asselmeher@gmail.com>
Cc: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

You may need to use a immediate value for src or dest argument 

-Chris
Http://nxdos.com/ 


Sent from my iPad

On Mar 11, 2013, at 3:09 PM, Meher Assel <asselmeher@gmail.com> wrote:

> Hello all,
> why i can't do ' ror al,bl' ?
> i'am using nasm in 16bits mode ( [BITS 16] )
> i get this error when compiling:
> error: invalid combination of opcode and operands
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
