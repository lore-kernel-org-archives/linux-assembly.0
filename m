From: horseriver <horserivers@gmail.com>
Subject: Disassembly  of  00000
Date: Sat, 2 Feb 2013 12:53:39 +0800
Message-ID: <20130202045339.GD2391@debian.localdomain>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:subject:message-id:mime-version
         :content-type:content-disposition:user-agent;
        bh=AMZ2iIFtHLl6f+LZtPuDAy5NPNapaAaPnhnEfpzF/l4=;
        b=CmK/i0P7/CRuHYORuQIb7Uc3MxSNoEtX+Zyk/60fPI9pvZuUeoaB1JX8Mg0KWEIs2x
         o0cei7iyUgoOAyTnyzpam46VqcOAOMwH5gQLrBwb8pxTZy0GZD6q8TeOWe7Ha5MV4RQi
         1TgXd+HEeAZe2BdyXFpMI8ay5theKd7pY5TJoUaiUcV26hImOLcxLtYeXEWrBhQU9pxC
         KyahOvsCfGgZkbxhjxmE7YdX7lGhd0pEDj+SNBSnXHq3t/ZVwMrW3kobfCm0fQ3rYBAp
         MQX3E4PrbjM8I/+4pVEKAMzx7PpPtuFtm0W0R0TTPmAp7dgrY9dkCHOXX8Bq3JCHXKkK
         kKKQ==
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

hi:)

   I have a question about disassemblly utility .
   If I fill an elf's text section with some random data,then 
   how does the disas command work for these data?
   Is there occasion that several sequence of bytes can not be translated
   into legal instructions?

thanks!
   
