From: sandeep <sandeep@codito.com>
Subject: Re: Directory contents
Date: Mon, 29 Nov 2004 12:55:17 +0530
Message-ID: <41AACEDD.4080509@codito.com>
References: <200411271900.48627.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200411271900.48627.hitoc_mail@yahoo.it>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: HIToC <hitoc_mail@yahoo.it>
Cc: Linux C programming <linux-c-programming@vger.kernel.org>, Linux Assembly <linux-assembly@vger.kernel.org>

> I want to write a function that can read the contents of a specified directory
> in order to find a certain type of file or to copy a directory-tree or
> something else.
> Neverthless I need of some system functions that find the files that are
> contained in that directory (like FINDFIRST and FINDNEXT under ms-dos).
> 
> Who can help me?
"man scandir" and man on functions mentioned at the end of that manpage.

--
regards
sandeep
--------------------------------------------------------------------------
You probably wouldn't worry about what people think of you if you could
know how seldom they do.
		-- Olin Miller.
--------------------------------------------------------------------------

