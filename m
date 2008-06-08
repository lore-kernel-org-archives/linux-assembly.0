From: lynx.abraxas@freenet.de
Subject: Re: precise debugging of inline asm
Date: Sun, 8 Jun 2008 14:36:48 +0200
Message-ID: <20080608123648.GA10823@drago>
References: <20080601150140.GA2832@drago> <4842DBFE.4080404@gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4842DBFE.4080404@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

On 01/06/08 19:27:26, Claudio Fontana wrote:
> On x86, try for example
>
> (gdb) disassemble $eip $eip+20
>
> Also see
> (gdb) info registers


Thanks  Claudio  Fontana. That did the trick. So the first line of output from
disassemble $eip $eip+20 is then the line where the segfault occured? In  this
example "mov    %cx,(%esi,%edx,2)"?

(gdb) disassemble $eip $eip+20
Dump of assembler code from 0x87b29f8 to 0x87b2a0c:
0x087b29f8 <.lable1+3>: mov    %cx,(%esi,%edx,2)
0x087b29fc <.lable1+7>: inc    %edx
0x087b29fd <.lable1+8>: jne    0x87b29ca <.lable0>
0x087b29ff <.lable1+10>:        mov    %ebp,0xffffffd0(%ebp)
0x087b2a02 <.lable1+13>:        pop    %ebx
0x087b2a03 <.lable1+14>:        mov    %eax,0xffffffa8(%ebp)
0x087b2a06 <.lable1+17>:        addl   $0x1,0xffffffb0(%ebp)
0x087b2a0a <.lable1+21>:        cmpl   $0x2f,0xffffffb0(%ebp)
End of assembler dump.


Well  investigating  that  I  think I should be sure of what each line does so
here I have some more questions:

As in the code below, will gcc not  use  registers  in  the  clobber  list  as
registers for %0 - %5 ?
Or asked differently: How would one code an asm swap?

1.
    __asm__("movl %0,%4 \n\t"
            "movl %1,%0 \n\t"
            "movl %4,%1 \n\t"
            : "=r" (a), "=r" (b) : "0"  (a), "1"  (b), "r" (c));

or
2.
    __asm__("movl %0,%%ebx \n\t"
            "movl %1,%0 \n\t"
            "movl %%ebx,%1 \n\t"
            : "=r" (a), "=r" (b) : "0"  (a), "1"  (b) : %ebx);


Well  if  some  one  likes  the challange: Does anybody see the mistakes I mad
translating the intel inline-asm MSC code to at&t inline-asm gcc code?  Did  I
do something wrong with the register lowding or the constrains?


Thanks again
Lynx

                                _asm {
                                        mov edx, endX
                                        mov edi, pDestPixel
                                        mov esi, dataPtr
                                        mov ecx, startX
                                        lea edi, [edi + 2*edx]
                                        sub ecx, edx
                                        mov ebx, transDataPtr
                                
L0:
                                        mov dx, [esi]
                                        add esi, 2
                                        xor eax, eax
                                        mov ax, dx
                                        cmp eax, 4
                                        jge L1
                                        mov edx, tileData[4*eax]
                                        test edx, edx
                                        jz L2
                                        add     edx, 2
                                        mov tileData[4*eax], edx
                                        mov dx, [edx-2]
                                        jmp L1
L2:
                                        mov dx, [ebx]
L1:
                                        add ebx, 2
                                        mov [edi + 2*ecx], dx
                                        inc ecx
                                        jnz L0
                                        mov transDataPtr, ebx
                                        mov dataPtr, esi
                                }
#else       
                 
                                printf("%s L%d: Using __asm__ tile blending!\n", __FILE__, __LINE__);
                                __asm__ (
//                                "movl $endX, %edx            \n\t" //done by gcc! %3
//                                "movl $pDestPixel, %edi      \n\t" //done by gcc! %2
//                                "movl $dataPtr, %esi         \n\t" //done by gcc! %1
//                                "movl $startX, %ecx          \n\t" //done by gcc! %4
                                    "leal (%2,%3,2),%2     \n\t"//load value %2 + 2 * %3 is pointing to
                                    "subl %3,%4              \n\t" //%3 is now reuseable
//                                "movl $transDataPtr, %ebx    \n\t" //done by gcc!

                                    ".lable0:                        \n\t"
                                    "movw (%1),%w3             \n\t" //reusing edx (%3)
                                    "addl $2,%1                \n\t"
//                                    "movl %%eax, %4                  \n\t"
                                    "pushl %%ebx     \n\t"  // save reg for PIC!
//                                    "pushl %%ebp     \n\t"  // save ebp, NEVER! use -fomit-frame-pointer
                                    //even if ebp is in clobberlist gcc uses it here to reference memory!
                                    "movl %0, %%ebp                  \n\t"
                                    "xorl %%ebx,%%ebx              \n\t" //make %ebx = 0, see below, we use ebx
                                    "movw %w3,%%bx            \n\t" //because of this ebx has to be static
                                    "cmpl $4,%%ebx             \n\t" //because of above line eax may be != 0
                                    "jge .lable1                     \n\t"
                                    "movl (%5,%%ebx,4), %3 \n\t"  // ** tileData can't be passed as "m"!
                                    "testl %3,%3             \n\t"  //check if %3 is zero, set Z-bit
                                    "jz .lable2                      \n\t"
                                    "addl $2,%3            \n\t"
                                    "movl %3, (%5,%%ebx,4) \n\t" // (%eax + %ebx * 4) = %3
                                    "movw -2(%3),%w3           \n\t" // %w3 first (or last?) 2 bytes of %3
                                    "jmp .lable1                     \n\t"
                                    ".lable2:                        \n\t"
                                    "movw (%%ebp),%w3             \n\t"//movw (%3),%%dx
                                    ".lable1:                        \n\t"
                                    "addl $2,%%ebp                \n\t"
                                    "movw %w3,(%2,%4,2)      \n\t"
                                    "incl %4                   \n\t"
                                    "jnz .lable0                     \n\t"
                                    "movl %%ebp, %0    \n\t"// this wouldn't work without -fomit-frame-pointer
//                                    "popl %%ebp     \n\t"// restore ebp, NEVER use this!
                                    "popl %%ebx     \n\t"// restore reg for PIC!
//                                        "movl %esi, $dataPtr         \n\t" //does gcc
                                    : "=g" (transDataPtr), "=r" (dataPtr) // "=D" (pDestPixel)

                                    : "r" (pDestPixel), "r" (endX), "r" (startX), "r" (tileData), "0" (transDataPtr), "1" (dataPtr)

                                    : "%ebp", "cc"
#if !defined(PIC) && !defined(__PIC__) //don't tell gcc about what was done to ebx!!!
                                    , "%ebx" //but do, if PIC is not enabled! It might use it else wise!!!
#endif
                                    );



