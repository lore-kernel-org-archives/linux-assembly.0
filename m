From: Fabian Franz <FabianFranz@gmx.de>
Subject: Tiny pivot root for asmutils-collection ...
Date: Mon, 9 Dec 2002 01:23:19 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200212090123.19389.FabianFranz@gmx.de>
Reply-To: FabianFranz@gmx.de
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

I needed it for an initrd-project:

section .text           ; declaring our .text segment
        global  _start  ; telling where program execution should start

        _start:                 ; this is where code starts getting exec'ed
        pop     ebx             ; argc
        pop     ebx             ; argv[0]
        pop     ebx             ; the first real arg, new_root
        pop     ecx             ; the first real arg, put_old


        mov     eax,217         ; the syscall number for pivot_root
                                ; we already have the new_root in ebx and 
put_old in ecx

        int     80h             ; call the kernel

        mov     ebx,eax         ; save the errno in ebx
        mov     eax,1           ; put the exit syscall number in eax
        int     80h             ; bail out

It was pretty easy to program; thx to the great tutorials on 
linuxassembly.org. Perhaps you have a use for it ? Its GPL, so feel free to 
add it ...

cu

Fabian
