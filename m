From: h-peter recktenwald <lx@lxhp.in-berlin.de>
Subject: asmutils - Linux 2.4.18
Date: Thu, 30 May 2002 17:51:11 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020530175111.324ae5e8.lx@lxhp.in-berlin.de>
References: <3CE5049F.5000405@gam.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3CE5049F.5000405@gam.co.za>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-assembly@vger.kernel.org

hi...

found some funny differences w Linux 2.4.18 kernel wrt its predecessors=
=20
where, for instance, the 'umount' system call doesn't work on devices=20
and mountpoints, any more, but, only on the device names.

i.e, some systemcalls' names were silently changed, previously valid=20
names assigned to different(ly operating) new/old syscalls.

I found this when trying the "eject" program from asmutils which was=20
non functional w. 2.4.18. The patch cures the problem:
------
; patch eject.asm for Lx 2.4.18 sys_umount
=2Eeject:
        push ecx                ; mountpoint
        push ebx                ; specialfile
    %ifdef ONLY_CCD
    %else
        test byte[edi],-1
        jnz .opn                ;?; not -ccd, just the syscall
    %endif; <=3D ONLY_CCD
%if __KERNEL__ < 24; new inconsistency in kernel 2.4.18!	<=3D=3D !
        sys_umount              ; eject won't work on a mounted device
%else
        sys_umount dword[esp+4] ; 'oldumount' w/ #mountpoint#, only
        mov ebx,[esp]
%endif
=2Eopn:
------

=46urther, the macro "_xchg" in asmutils' 'system.inc' is not correct=20
(which I didn't recognize earlier because I'm using my own version;):

1) ---
 %macro _xchg 2
-%if __OPTIMIZE__=3D__O_SPEED__
+%if __OPTIMIZE__=3D__O_SIZE__;
 %assign ea 4
2) ---
@@ -721,7 +723,7 @@
 ;  2 clocks w. reg,reg
 ;      (lea variant wasn't faster, may be cpu dependent?)
 ; 33 clocks w. reg,mem or mem,reg - either case
-    xchg %{1},%{3}
+    xchg %{1},%{2};
-----
btw. the attempts to finding out about the actual addressing mode=20
seem useless, "nasm" apparently providing no such means, at all.


regards,
	hp

--=20
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
NO abusive=A0software=A0patents=A0http://petition.eurolinux.org/pr/pr17=
=2Ehtml
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
