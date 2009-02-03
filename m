From: pei lin <telent998@gmail.com>
Subject: why linux ELF base address is 0x8048000?
Date: Tue, 3 Feb 2009 17:25:59 +0800
Message-ID: <d6b7c4190902030125w235bca7tdd86b8c94b727e06@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=Xws9kj1wb1lesP1ir/vYct7n+8Tm5beW5SU/HISeCU4=;
        b=iiiglCbIgOhBlEtpUDuH9pjq3kxVA1bn/9u51F6pfLh6Y7GukzjRXCtpw3JhOibCbY
         P/Wo3nZnRRovDbA7GmbAQPHDN/Lq1yXxPx+/A/iNufjlqf3N1VWuFL+5DPvgQr8WGzYi
         TmtaX+mQRzmB4kEFwvvgUU/osW4nwLc6Tz15c=
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

hi,
   why linux ELF base address is 0x8048000? we can use ld to change
the base address or linker script.BUT why default is 0x8048000? There
must be some reasons or history i don't know. Could u give me an
advice? Thx.


Best Regards.

P.L
