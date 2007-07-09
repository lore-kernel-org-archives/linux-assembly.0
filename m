From: Pawel <paulino90@tenbit.pl>
Subject: newbie: why so many sections in elf binary?
Date: Mon, 9 Jul 2007 15:08:00 +0200
Message-ID: <18066.13104.679176.306238@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: assembly linux mailing list <linux-assembly@vger.kernel.org>

Hallo Group Members.

I just issued the command:
prompt$ readelf --section-headers /lib/libc-2.5.so

It shows 74 sections in single library (full listing at the end of mail).
I wonder why there are so many of them. I guess that it is convinient somehow.
Or maybe the answer is in the question: why sections were "invented", what are they for?

Do You know any link that would explain it for me?

Regards,
Pawel.

prompt$ readelf --section-headers /lib/libc-2.5.so
There are 75 section headers, starting at offset 0x180420:

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
  [ 0]                   NULL            00000000 000000 000000 00      0   0  0
  [ 1] .note.ABI-tag     NOTE            00bc2174 000174 000020 00   A  0   0  4
  [ 2] .gnu.hash         GNU_HASH        00bc2194 000194 003a80 04   A  3   0  4
  [ 3] .dynsym           DYNSYM          00bc5c14 003c14 008c50 10   A  4  19  4
  [ 4] .dynstr           STRTAB          00bce864 00c864 0055c9 00   A  0   0  1
  [ 5] .gnu.version      VERSYM          00bd3e2e 011e2e 00118a 02   A  3   0  2
  [ 6] .gnu.version_d    VERDEF          00bd4fb8 012fb8 0002b8 00   A  4  20  4
  [ 7] .gnu.version_r    VERNEED         00bd5270 013270 000040 00   A  4   1  4
  [ 8] .rel.dyn          REL             00bd52b0 0132b0 0029a8 08   A  3   0  4
  [ 9] .rel.plt          REL             00bd7c58 015c58 000038 08   A  3  10  4
  [10] .plt              PROGBITS        00bd7c90 015c90 000080 04  AX  0   0  4
  [11] .text             PROGBITS        00bd7d10 015d10 0f4870 00  AX  0   0 16
  [12] __libc_freeres_fn PROGBITS        00ccc580 10a580 000f87 00  AX  0   0 16
  [13] __libc_thread_fre PROGBITS        00ccd510 10b510 000232 00  AX  0   0 16
  [14] .rodata           PROGBITS        00ccd760 10b760 017ac0 00   A  0   0 32
  [15] .interp           PROGBITS        00ce5220 123220 000013 00   A  0   0  1
  [16] .eh_frame_hdr     PROGBITS        00ce5234 123234 00294c 00   A  0   0  4
  [17] .eh_frame         PROGBITS        00ce7b80 125b80 00de50 00   A  0   0  4
  [18] .gcc_except_table PROGBITS        00cf59d0 1339d0 000251 00   A  0   0  1
  [19] .hash             HASH            00cf5c24 133c24 003318 04   A  3   0  4
  [20] .tdata            PROGBITS        00cf9200 137200 000008 00 WAT  0   0  4
  [21] .tbss             NOBITS          00cf9208 137208 000034 00 WAT  0   0  4
  [22] .fini_array       FINI_ARRAY      00cf9208 137208 000004 00  WA  0   0  4
  [23] .ctors            PROGBITS        00cf920c 13720c 00000c 00  WA  0   0  4
  [24] .dtors            PROGBITS        00cf9218 137218 000008 00   A  0   0  4
  [25] __libc_subfreeres PROGBITS        00cf9220 137220 000060 00  WA  0   0  4
  [26] __libc_atexit     PROGBITS        00cf9280 137280 000004 00  WA  0   0  4
  [27] __libc_thread_sub PROGBITS        00cf9284 137284 000008 00  WA  0   0  4
  [28] .data.rel.ro      PROGBITS        00cf92a0 1372a0 001afc 00  WA  0   0 32
  [29] .dynamic          DYNAMIC         00cfad9c 138d9c 0000f8 08  WA  4   0  4
  [30] .got              PROGBITS        00cfae94 138e94 00015c 04  WA  0   0  4
  [31] .got.plt          PROGBITS        00cfaff4 138ff4 000028 04  WA  0   0  4
  [32] .data             PROGBITS        00cfb020 139020 000958 00  WA  0   0 32
  [33] .bss              NOBITS          00cfb980 139978 002c24 00  WA  0   0 32
  [34] .comment          PROGBITS        00000000 139978 00ce48 00      0   0  1
  [35] .gnu.warning.sigs PROGBITS        00000000 1467c0 00004d 00      0   0 32
  [36] .gnu.warning.sigr PROGBITS        00000000 146820 00003b 00      0   0 32
  [37] .gnu.warning.sigg PROGBITS        00000000 146860 000039 00      0   0 32
  [38] .gnu.warning.tmpn PROGBITS        00000000 1468a0 000037 00      0   0 32
  [39] .gnu.warning.tmpn PROGBITS        00000000 1468e0 000039 00      0   0 32
  [40] .gnu.warning.temp PROGBITS        00000000 146920 000038 00      0   0 32
  [41] .gnu.warning.sys_ PROGBITS        00000000 146960 000044 00      0   0 32
  [42] .gnu.warning.sys_ PROGBITS        00000000 1469c0 000041 00      0   0 32
  [43] .gnu.warning.gets PROGBITS        00000000 146a20 000039 00      0   0 32
  [44] .gnu.warning.__me PROGBITS        00000000 146a59 00005c 00      0   0  1
  [45] .gnu.warning.getp PROGBITS        00000000 146ac0 00003a 00      0   0 32
  [46] .gnu.warning.setl PROGBITS        00000000 146b00 00003a 00      0   0 32
  [47] .gnu.warning.re_m PROGBITS        00000000 146b40 00003d 00      0   0 32
  [48] .gnu.warning.lchm PROGBITS        00000000 146b80 000038 00      0   0 32
  [49] .gnu.warning.getw PROGBITS        00000000 146bc0 00007a 00      0   0 32
  [50] .gnu.warning.sstk PROGBITS        00000000 146c40 000036 00      0   0 32
  [51] .gnu.warning.revo PROGBITS        00000000 146c80 000038 00      0   0 32
  [52] .gnu.warning.mkte PROGBITS        00000000 146cc0 000037 00      0   0 32
  [53] .gnu.warning.gtty PROGBITS        00000000 146d00 000036 00      0   0 32
  [54] .gnu.warning.stty PROGBITS        00000000 146d40 000036 00      0   0 32
  [55] .gnu.warning.luti PROGBITS        00000000 146d80 000039 00      0   0 32
  [56] .gnu.warning.chfl PROGBITS        00000000 146dc0 000039 00      0   0 32
  [57] .gnu.warning.fchf PROGBITS        00000000 146e00 00003a 00      0   0 32
  [58] .gnu.warning.llse PROGBITS        00000000 146e40 00003f 00      0   0 32
  [59] .gnu.warning.__ge PROGBITS        00000000 146e80 000039 00      0   0 32
  [60] .gnu.warning.inet PROGBITS        00000000 146ec0 00003c 00      0   0 32
  [61] .gnu.warning.inet PROGBITS        00000000 146f00 00003b 00      0   0 32
  [62] .gnu.warning.inet PROGBITS        00000000 146f40 00003d 00      0   0 32
  [63] .gnu.warning.inet PROGBITS        00000000 146f80 00003c 00      0   0 32
  [64] .gnu.warning.inet PROGBITS        00000000 146fc0 00003b 00      0   0 32
  [65] .gnu.warning.inet PROGBITS        00000000 147000 00003b 00      0   0 32
  [66] .gnu.warning.fatt PROGBITS        00000000 147040 000039 00      0   0 32
  [67] .gnu.warning.fdet PROGBITS        00000000 147080 000039 00      0   0 32
  [68] .symtab           SYMTAB          00000000 1470bc 01f860 10     69 5844  4
  [69] .strtab           STRTAB          00000000 16691c 018961 00      0   0  1
  [70] .gnu_debuglink    PROGBITS        00000000 17f280 000018 00      0   0  4
  [71] .gnu.liblist      GNU_LIBLIST     00000000 17f298 000014 14     72   0  4
  [72] .gnu.libstr       STRTAB          00000000 17f2ac 000014 00      0   0  1
  [73] .gnu.prelink_undo PROGBITS        00000000 17f2c0 000c8c 01      0   0  4
  [74] .shstrtab         STRTAB          00000000 17ff4c 0004d3 00      0   0  1
Key to Flags:
  W (write), A (alloc), X (execute), M (merge), S (strings)
  I (info), L (link order), G (group), x (unknown)
  O (extra OS processing required) o (OS specific), p (processor specific)
