From: Scott Lanning <slanning@theworld.com>
Subject: Re: NAMS-%d=%c...?
Date: Sat, 31 Aug 2002 06:16:09 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.SGI.4.40.0208310609300.119305212-100000@shell01.TheWorld.com>
References: <web-44696903@m1.plasa.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <web-44696903@m1.plasa.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

On Sat, 31 Aug 2002, ssams wrote:
> pesan     db 9," %d=%c ",0
>
> from pice of code above whats mean " %d=%c "
> it come from a code to print ascii code with their value
> output from the program is, ex:
>  A=65

It's a format string, `man 3 printf`.
%c prints the character for whatever number is given,
%d just prints the number.
printf("%c=%d", 'A', 'A')
    => A=65

