From: Scott Lanning <slanning@theworld.com>
Subject: Re: GAS - \@ in macros and labels
Date: Thu, 30 May 2002 13:13:25 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.SGI.4.40.0205301306560.4473325-100000@shell01.TheWorld.com>
References: <004C6F8A.C21188@si.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <004C6F8A.C21188@si.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kieft_brian@si.com
Cc: linux-assembly@vger.kernel.org

On Wed, 29 May 2002 kieft_brian@si.com wrote:
> .MACRO  tableHdr    someArgs
> .SET    CMD_NUM,\@
> A_CMD_NUM:
>      .DC.W  (B_CMD_NUM - A_CMD_NUM)
>     stuff....
>
>  .ENDM
>
>  .MACRO tableEnd    someArgs
> B_CMD_NUM:
>  .ENDM
>
>
> Unfortunately GAS sees this as literal text and throws a bunch of "symbol
> already defined" errors. Any ideas on how to make the CMD_NUM appear as its
> value in a label? Thanks,

Please tell me if you figure it out. :)
In the meantime, I use `cpp`. Then you can use the concatenation
operator '##', like

#define tableHdr(cmd_num) A_ ## cmd_num:\
   and so on..

