From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: how to use linux system call in cross compiling environment
Date: Wed, 17 Nov 2004 16:17:19 +0100
Message-ID: <20041117151719.GA26478@mail.13thfloor.at>
References: <419B0E2A.4090003@cbf.chinese2000.net>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <419B0E2A.4090003@cbf.chinese2000.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lawrence <law@cbf.chinese2000.net>
Cc: linux-assembly@vger.kernel.org

On Wed, Nov 17, 2004 at 04:39:06PM +0800, Lawrence wrote:
> Hi all,
> 
> I'm figuring out the linux-arm assembly right now. I use the GNU ARM
> toolchain 3.4.1 provided by www.gnuarm.com on my x86 Linux hosts.
> 
> I've successfully assembled and linked the following code:
> 
> @filename: hello.s
> 
> .text
>         .align  2
>         .global _start
> _start:
>         adr     r1, msg         @ address
>         mov     r0, #1          @ stdout
>         mov     r2, #13         @ length
>         swi     #0x900004       @ sys_write
> 
>         mov     r0, #0
>         swi     #0x900001       @ sys_exit
> 
>         .align  2
> msg:
>         .asciz  "hello, world\n"
> 
> the commands I used are as follows:
> 
> arm-elf-as -gdwarf2 -o hello.o hello.s
> arm-elf-ld -o hello hello.o

hmm, 

static inline long mhelper(uint32_t cmd, uint32_t addr, uint32_t value)
{
        register long _r2 asm("r2")=(long)(value);
        register long _r1 asm("r1")=(long)(addr);
        register long _r0 asm("r0")=(long)(cmd);
        asm volatile(
                "swi %1"
                : "=r"(_r0)
                : "i"(__NR_mhelper), "r"(_r0), "r"(_r1), "r"(_r2)
                : "memory");
        if(_r0 >=(unsigned long) -4095) {
                long err = _r0;
                (*__errno_location())=(-err);
                _r0=(unsigned long) -1;
        }
        return (long) _r0;
}


which looks like this in objdump:

    844c:       e1a0200a        mov     r2, sl
    8450:       e1a0100a        mov     r1, sl
    8454:       e1a0000a        mov     r0, sl
    8458:       ef9000de        swi     0x009000de
    845c:       e3700a01        cmn     r0, #4096       ; 0x1000
    8460:       9a000004        bls     0x8478
    ...


works fine here ...

HTH,
Herbert

> When I run the program as "arm-elf-run hello", I got the reply sim:
> unknown SWI encountered - 900004 - ignoring. I got the same result when
> debugging the program with insight and gdb.
> 
> I would like to know if there is a way to use the arm linux system call
> under such simulation environment. Thanks.
> 
> Regards,
> Lawrence
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
