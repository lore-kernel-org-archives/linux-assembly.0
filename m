From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: Assmebler Error
Date: Sun, 21 Nov 2004 13:26:52 +0100
Message-ID: <20041121122652.GA24767@mail.13thfloor.at>
References: <20041121065130.87428.qmail@web52907.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20041121065130.87428.qmail@web52907.mail.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: assembly <linux-assembly@vger.kernel.org>

On Sun, Nov 21, 2004 at 06:51:30AM +0000, Ankit Jain wrote:
>  uint64_t csae = 0; /* accummulators for difference */
>      58   uint64_t c1 = 0,*c;
>      59   uint8_t *ip, *rp; /* pointers to appropriate
> rows */
> 
>     asm("movq   (%1), %%mm1 \n\t"
>      70           "psadbw (%2), %%mm1 \n\t"
>      71           "movq   8(%1), %%mm0 \n\t"
>      72           "psadbw 8(%2), %%mm0 \n\t"
>      73           "paddd  %%mm0, %%mm1 \n\t" /* might
> use paddd for 32-bit adding */
>      74           "movq   16(%1), %%mm0 \n\t"
>      75           "psadbw 16(%2), %%mm0 \n\t"
>      76           "paddd  %%mm0, %%mm1 \n\t"
>      77           "movq   24(%1), %%mm0 \n\t"
>      78           "psadbw 24(%2), %%mm0 \n\t"
>      79           "paddd  %%mm0, %%mm1 \n\t"
>      80           "movq   %%mm1,%0 \n\t"
>      82           "emms \n\t"                
>      83           : "=g" (c1)
>      84           : "r" (rp), "r" (ip)
>      85           );
> Well due to this module i am getting the following
> error
> {standard input}: Assembler messages:
> {standard input}:4126: Error: suffix or operands
> invalid for `movq'
> {standard input}:4494: Error: suffix or operands
> invalid for `movq'
> 
> if somebody can help

must be a toolchain issue ... tried the following C file
---------------------

#include <stdint.h>

int     main(void) {

        uint64_t c1 = 0;
        uint8_t *ip, *rp; /* pointers to appropriate rows */

            asm("movq     (%1), %%mm1 \n"
                "psadbw   (%2), %%mm1 \n"
                "movq    8(%1), %%mm0 \n"
                "psadbw  8(%2), %%mm0 \n"
                "paddd   %%mm0, %%mm1 \n"
                "psadbw 16(%2), %%mm0 \n"
                "paddd   %%mm0, %%mm1 \n"
                "movq   24(%1), %%mm0 \n"
                "psadbw 24(%2), %%mm0 \n"
                "paddd   %%mm0, %%mm1 \n"
                "movq    %%mm1, %0    \n"
                "emms                 \n"
                : "=g" (c1)
                : "r" (rp), "r" (ip)
            );

        return 0;
}

------------
and it compiles correctly here (checked with objdump)

# gcc --version
gcc (GCC) 3.3.4 (Mandrake Linux 8.2 3.3.4-1mdk)
# as --version
GNU assembler 2.15.90.0.3 20040415

HTH,
Herbert

> thanks 
> 
> ankit jain
> 
> ________________________________________________________________________
> Yahoo! Messenger - Communicate instantly..."Ping" 
> your friends today! Download Messenger Now 
> http://uk.messenger.yahoo.com/download/index.html
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
