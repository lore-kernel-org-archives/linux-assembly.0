From: lynx.abraxas@freenet.de
Subject: Porting MSC-asm to gcc/gas ->  error: can't find a register in class...
Date: Wed, 21 Mar 2007 22:05:09 +0100
Message-ID: <20070321210509.GF5524@drago.uni-regensburg.de>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hallo!


I'm hopelessly lost: I tried to port inline asm from CTP2 code, which is written for MSC.
I think I did quite well but have two problems:

1. One part of asm code uses six references to C-vars and still needs a free register. I don't know how MSC can handel that but gas seems not to be able to. I think, I found a small workaround but when compiling it, gcc complains with:
error: can't find a register in class `BREG' while reloading `asm'

Studying similar questions in the net they never say what this message means or how to prevent it by modifing the code. Using gcc-3.36 instead of 4.1.1 didn't help nor using  -fomit-frame-pointer or -O. I tried two variants, one with static registers and one with dynamic registers. 

What is it gcc can't do and how can I solve it?

2. What exception would I have to catch if asm part fails? (see below the mmx test)


Thanks for any help.
Lynx

Below two parts of code which both don't compile:


#ifdef _MSC_VER
    bool retval = true;
    DWORD RegEDX = 0;

    __try {
            _asm {
                    mov eax, 1      
                                    
                                        _emit 0fh               
                                        _emit 0a2h
                    mov RegEDX, edx 
            }
    } __except(EXCEPTION_EXECUTE_HANDLER) { retval = false; }

    if(retval == false)
       return false;           

    if (RegEDX & 0x800000)          
    {
       __try { _asm emms }          
       __except(EXCEPTION_EXECUTE_HANDLER) { retval = false; }
    }
#else
    bool retval = true;
    DWORD RegEDX = 0;

    try {
        __asm__ (
            "movl $1,%%eax                \n\t"
            "_emit 0fh                   \n\t"
            "_emit 0a2h                  \n\t"
//           "movl %edx, $RegEDX          \n\t"
            : "=d" (RegEDX)
            :
            : "%eax", "%edx", "memory"
            );
        } 
    catch(...) {
        printf("%s L%d: MMX-Test FAILED!\n", __FILE__, __LINE__);       
        retval = false; 
        }

    if(retval == false)
       return false;           

    if (RegEDX & 0x800000)          
    {
    try { __asm__ (" emms            \n\t"); }          
    catch(...) {
        printf("%s L%d: MMX-Test FAILED!\n", __FILE__, __LINE__);       
        retval = false; 
        }
    }
    
    printf("%s L%d: MMX-Test succeded!\n", __FILE__, __LINE__); 
    //bool retval = false;
#endif // _MSC_VER
    
    
    return retval;
}

_____________________________________________________________________________
diffrent file now:
______________________________________________________________________________


    dataPtr = data;

    uint8 *pSurfBase;


    pSurfBase = m_surfBase;
    sint32 surfWidth = m_surfWidth;
    sint32 surfHeight = m_surfHeight;
    sint32 surfPitch = m_surfPitch;

    Pixel16 srcPixel, transPixel = 0;

    uint16 *pDestPixel = (Pixel16 *)(pSurfBase + (y+ypos) * surfPitch + 2 * (x+xpos));

        {
        for (y=0; y<k_TILE_PIXEL_HEIGHT; y++) {
            if (y<=23) {
                startX = (23-y)*2;
                endX = k_TILE_PIXEL_WIDTH - startX;
                } else {
                    startX = (y-24)*2;
                    endX = k_TILE_PIXEL_WIDTH - startX;
                    }
//#ifdef _MSC_VER             //use this if __asm__ is NOT used
            if (transDataPtr)
                {
#ifdef _MSC_VER             //use this if __asm__ is used
                //printf("tiledraw.cpp L4141: assambly used!\n");
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
#else             //use this if __asm__ is used
//this comes from intel2gas -I tiledraw.cpp
                __asm__ __volatile__ (
//                                     "movl $endX, %edx            \n\t"
//                                     "movl $pDestPixel, %edi      \n\t"
//                                     "movl $dataPtr, %esi         \n\t"
//                                     "movl $startX, %ecx          \n\t"
                    "leal (%edi,%edx,2),%edi     \n\t"
                    "subl %edx,%ecx              \n\t"
//                                    "movl $transDataPtr, %ebx    \n\t"

                    ".L0:                        \n\t"
                    "movw (%esi),%dx             \n\t"
//                                    "addl $2,%esi                \n\t"
                    "movl %eax, %esi             \n\t"                      
                    "xorl %eax,%eax              \n\t"
                    "movw %dx,%ax                \n\t"
                    "cmpl $4,%eax                \n\t"
                    "jge .L1                     \n\t"
                    "movl %esi(%eax,4), %edx \n\t"
                    "testl %edx,%edx             \n\t"
                    "jz .L2                      \n\t"
                    "addl $2,%edx             \n\t"
                    "movl %edx, %esi(%eax,4) \n\t"
                    "movw -2(%edx),%dx           \n\t"
                    "jmp .L1                     \n\t"
                    ".L2:                        \n\t"
                    "movw (%ebx),%dx             \n\t"
                    ".L1:                        \n\t"
                    "addl $2,%ebx                \n\t"
                    "movw %dx,(%edi,%ecx,2)      \n\t"
                    "incl %ecx                   \n\t"
                    "jnz .L0                     \n\t"
//                                     "movl %ebx, $transDataPtr    \n\t"
//                                     "movl %esi, $dataPtr         \n\t"

                    : //"=b" (transDataPtr), "=S" (dataPtr)
                    : "D" (pDestPixel), "a" (tileData), "d" (endX), "c" (startX), "b" (transDataPtr), "S" (dataPtr)
                    : "memory" );

// this is adjusted after intel2gas -I tiledraw.cpp
/*                                __asm__ (
//                                "movl $endX, %edx            \n\t" //done by gcc!
//                                "movl $pDestPixel, %edi      \n\t" //done by gcc!
//                                "movl $dataPtr, %esi         \n\t" //done by gcc!
//                                "movl $startX, %ecx          \n\t" //done by gcc!
"leal (%0,%1,2),%0     \n\t" //load value %0 + %1 * s is pointing to %0
"subl %1,%2              \n\t"
//                                        "movl $transDataPtr, %ebx    \n\t" //done by gcc!

".L0:                        \n\t"
"movw (%4),%%dx             \n\t"
"addl $2,%4                \n\t"
"xorl %%eax,%%eax              \n\t" //make %eax = 0, see below
"movw %%dx,%%ax            \n\t" //because of this eax has to be static
"cmpl $4,%%eax             \n\t" //because of above line eax may be != 0
"jge .L1                     \n\t"
"movl %5(%%eax,4), %1 \n\t"  // %1 = (%5 + %eax * 4)
"testl %1,%1             \n\t"  //check if %1 is zero, set Z-bit
"jz .L2                      \n\t"
"addl    $2,%1            \n\t"
"movl %1, %5(%%eax,4) \n\t" // (%5 + %eax * 4) = %1
"movw -2(%1),%%dx           \n\t"
"jmp .L1                     \n\t"
".L2:                        \n\t"
"movw (%3),%%dx             \n\t"
".L1:                        \n\t"
"addl $2,%3                \n\t"
"movw %%dx,(%0,%2,2)      \n\t"
"incl %2                   \n\t"
"jnz .L0                     \n\t"
//                                        "movl %ebx, $transDataPtr    \n\t"
//                                        "movl %esi, $dataPtr         \n\t"

: // FIXASM: output regs/vars go here, e.g.:  "=m" (memory_var)

: "0" (pDestPixel), "1" (endX), "2" (startX), "3" (transDataPtr), "4" (dataPtr), "5" (tileData)

: // FIXASM: clobber list, e.g.:  "%eax", "%ecx", "cc"
);
*/

#endif             //use this if __asm__ is used
                }
            else
                {
                for (x = startX; x<endX; x++) 
                    {
                    srcPixel = *dataPtr++;
                    if (srcPixel < 4)
                        {
                        Pixel16 *tile = tileData[srcPixel];
                        if (tile != NULL)


