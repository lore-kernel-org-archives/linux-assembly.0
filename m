From: etienne deleflie <eyem@lalila.net>
Subject: warning: newbie attempting SSE
Date: Thu, 29 May 2003 15:01:39 +1000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3ED59433.4010906@lalila.net>
Reply-To: eyem@lalila.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org


hello,

I'm trying to de-interleave a [Y U Y V] video stream into 2 separate 
streams .... [Y Y Y Y] and [U V U V]. Thanks hp for pointing me to the 
PACKUSWB instruction.

I think my basic logic is correct. my code compiles and runs, but it'ss 
wrong (possibly in multiple places).

The main reason why I need help is because I have no idea how to verify 
what is in my xmm registers (I'm using gdb) .... does anyone know how I 
can view the bits (or bytes) in xmm using gdb ?

I'm not sure if I need to align stuff, or not. Can anyone help me with that?

My code is below: and is called from C using something like:

myFunction(char *dest ,char *src, long size)

any help is greatly appreciated.

etienne

# data defines the things for which we will need memory storage
.data                                   # section declaration

sse2_mask:
     .word    0x00FF,0x00FF,0x00FF,0x00FF
     .word    0x00FF,0x00FF,0x00FF,0x00FF

# this is it. text is the code itself, the machine instructions, it is 
the text the machine reads
.text                                   # section declaration

# this is where to start

.global myFunction

#;######################################################
#;###
#;### myFunction(*dest,    *src,     long)


myFunction:

# shove these existing values into storage so that we can put them back 
in place when we are finished
push %eax
push %ebx
push %ecx
push %edx

#.p2align 4

# find out what is in the stack befo`re we do anything
push    %ebp                       # ebp contains a pointer to the last 
instruction, so by keeping its value on the stack, we can return to 
where we left off when we are finished.
movl    %esp, %ebp        # Now, ebp contains this stack memory position 
(so ebp now contains a pointer to its own old value)...
                 # Right now, ebp contains a pointer to a memory 
location which contains a pointer to the last instruction.
addl    $0x18, %esp        # Subtract 24 from the value of esp (which 
effectively drops the stack pointer down by 3 rows or 3 lots of )

movl    0x00(%esp), %edx     # edx holds a pointer to the destination
movl    0x04(%esp), %ecx     # ecx holds a pointer to the source
movl    0x08(%esp), %eax     # eax holds the size of the loop

movdqu    sse2_mask, %xmm7    # this value will be used to AND the Y (or 
UV) bits into being 0's

movl    $0, %edi        # the index for finding values in the source.

start_loop:            # start loop at 0
cmpl     %edi, %eax        # check if we have reached the size of our array
je     loop_exit        # if so, jump to end
movdqu    (%ecx, %edi,8), %xmm1    # copy the value of (source + 
loopIndex) into xmm1
pand     %xmm7, %xmm1        # get rid of the unwanted every second 
chunk of bytes (the Y values)
movdqu    (%ecx, %edi,8), %xmm2    # copy the value of (source + 
loopIndex +1) into xmm2
pand    %xmm7, %xmm2        # get rid of the unwanted every second chunk 
of bytes (the Y values)

packuswb %xmm1, %xmm2        # call PACKUSWB (page 564 in Intel's 2nd 
manual) packs every secnd byte into xmm1

movdqu    %xmm1, (%edx, %edi,8)    # put value of xmm1 back into the 
destination index
incl    %edi            # increment loopIndex
jmp    start_loop        # go back to loop start

loop_exit:            # loop end
                 # put ebp back.

movl    %ebp, %esp        # put the value in ebp back into esp
pop     %ebp

# pull the original values back into the machine, so it can continue 
what it was doing.
pop %edx
pop %ecx
pop %ebx
pop %eax

ret

