From: dAvId KeDrOsKy <davidkedrosky@rogers.com>
Subject: system_read() question
Date: Mon, 3 Feb 2003 17:00:40 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200302031700.40580.davidkedrosky@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Say I do something like this:

        mov     eax, 3          ;setup for system read()
        mov     ebx, 0          ;receive input from stdin (keyboard)
	mov     ecx, foo_input     ;input will act as a storage place for data
        int     0x80			;syscall interrupt

Does anything get added to the storage array (foo_input) after my input. Like 
the null or CR character?

Thanks, 

dave



