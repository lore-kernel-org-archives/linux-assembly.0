From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: A question on cat.asm from asmutils-0.17
Date: Tue, 18 Nov 2003 08:38:16 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FB9CC68.9090802@eprocess.fr>
References: <3FB9986D.60709@cbf.chinese2000.net>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3FB9986D.60709@cbf.chinese2000.net>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lawrence <law@cbf.chinese2000.net>
Cc: linux-assembly@vger.kernel.org

Hi,
One of the goal of asmutils is to be as small as possible.
So, any 'non-very-necessary' things are commented out to save place.

In Linux, when you open  file, a file descriptor is stored in the 
process memory.
When you release the process, the system close all its opened files.
So, what is done in cat.asm is *not* a nice thing (every thing that is 
opened must in theory be closed) but it is a good way to reduce code 
size (from few bytes, but it is the power of assembly) without breaking 
anything.

hope it helps
Fred

Lawrence wrote:

>Hi All,
>
>I'm trying to get acquintant with Linux assembly language by studying
>the asm code found in asmutils.
>
>While studying cat.asm, I discover that every time a file is opened
>using sys_open, there is no correspondent sys_close to it. (The codes
>were marked).
>
>I would like to ask if this is an legitimate way to open a file without
>closing it under Linux, or just a convenient way to let the
>shell/kernel(I'm not sure...) to close the file for us when cat is
>finished.  For my experience on MS-DOS assembly, I must close an
>opened-file, or otherwise I'll encounter an out of file handle error.
>
>Thanks and Regards,
>Lawrence
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>


