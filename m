From: "john david gray" <johndgray2003@tiscali.co.uk>
Subject: argc argv  example included
Date: Sun, 3 Sep 2006 17:39:56 +0100
Message-ID: <000701c6cf77$b1f7c220$6ca2e150@gary>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org
Cc: majordomo@vger.kernel.org


 <linux-assembly@vger.kernel.org>

to <majordomo@vger.kernel.org>

subscribe linux-assembly

Hi,

I am doing a bit of assembly - for conversion of a Pascal compiler
I'm doing {PQC 68000} . I did some work on it in it's original
Pascal, and have since converted it into C , though it still
currently produces 68k assembler. I have it running in linux {gcc}.
I started doing some x86 assembler using nasm , and then swapped
to as {gas} for its att mode.
There seems to be a problem with argc {or is it just me?}
where an offset has to be manually adjusted to give the correct
number {length of args}.
I'm using Slackware9.1 with gcc 3.2.3

'bye John Gray

p.s.
Here's a program that exhibits this behaviour:
save ascii
cut, save as kat09.s and assemble :

as -o kat09.o  kat09.s
ld -o kat09    kat09.o
echo  "kat09 OK"

# test: kat09 abcdefghijklmnopqrst uvwxyz asdfghjkl

#  -  -  -  -  -  -  -  -
#  katXX.asm for as gas - file_open_read_writestr_close - tabs 3

#  Copyright (C) 2006 J D Gray

#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation (version 2 of the License).

#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS foR A PARTICULAR PURPOSE.
#  See the GNU General Public License for more details.

#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#  Is this current ?

#  file_open_read_writestr_close
#  with subroutines, .globl_vars
#  push args, eax = return val
#  as gas  uses att style     mov   $456,%eax >>
#  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
  -

#  script to build

#rm    kat09      kat09.o
#as -o kat09.o    kat09.s
##ld -o kat09     kat09.o
#ld -o kat09 -s   kat09.o
#echo  "kat09 OK"

##objdump -d -Matt kat09 >kat09.d
##objdump -D -Matt kat09 >kat09.da  # find data rodata bss
##ob2asm kat09 asm
#I wrote ob2asm {in c} to convert objdump output to
#an assembl-able form {though this is just a 'hack'}
#it chops out the machine code,and converts 0x804s to L804

#%include "/usr/include/asm/fcntl.h"   #O_RDONLY
      .equ O_RDONLY,0x00

      .section .text

#  -  -  -  -  -  -  -  -
.globl _fopen        #&name %eax=<0 or fd
.globl _fclose       #fd
.globl _fgetc        #fd %eax=<0 or ch
.globl _fgets        #fd &buf %eax=<0 or len
.globl __putc        #ch to stdout
.globl __eputc       #ch to stderr
.globl _writestr     #&str string to stdout
.globl _ewritestr    #&str string to stderr
.globl _writelong    # nnn
.globl _writehex     # nnn
.globl _nl           #lf to stdout
.globl _cls          #nn lfs to stderr
.globl _strlen       #&str %eax=length 0..255
.globl _strcpy       #&str1 &str2 strcpy &str1->&str2 %eax=len 255_max
.globl _start        #do stuff
#  -  -  -  -  -  -  -  -

_fopen:                 #fopen &name eax=<0 or fd
      push  %ebp
      mov   %esp,%ebp
      push  %ebx
      push  %ecx
      push  %edx
      mov   $0,%edx           #0 permission
      mov   $O_RDONLY,%ecx    #flag rw ro wo O_RDONLY O_WRONLY O_RDwr
##    mov   $file_nm,%ebx     #&file name buf
      mov   8(%ebp),%ebx      # = name_buf
      mov   $5,%eax           #sys-open
      int   $0x80             #call system
      pop   %edx
      pop   %ecx
      pop   %ebx
      leave
      ret
      .align 16

_fclose:                #fclose fd
      push  %ebp
      mov   %esp,%ebp
      push  %ebx
      mov   8(%ebp),%ebx      # = fd
      mov   $6,%eax           #sys-close
      int   $0x80             #call system
      pop   %ebx
      leave
      ret
      .align 16

_fgetc:                 #fgetc fd eax=<0 or ch
      push  %ebp
      mov   %esp,%ebp
      push  %ebx
      push  %ecx
      push  %edx
      mov   $1,%edx           #one byte
      mov   $chbuf,%ecx       #to &buf i do 68k assembler usually
##    mov   $0,%ebx           #fd 0=stdin x86 is a couche_mar
      mov   8(%ebp),%ebx      # = fd
      mov   $3,%eax           #sys-read
      int   $0x80             #call system
      cmp   $1,%eax
      jnz   .fgetc3
      mov   $chbuf,%ecx
      movb  (%ecx),%al
      jmp   .fgetc4
.fgetc3:
      xor   %eax,%eax
      dec   %eax
.fgetc4:
      pop   %edx
      pop   %ecx
      pop   %ebx
      leave
      ret
      .align 16

_fgets:                 #fgets fd &buf eax=<0 or len
      push  %ebp
      mov   %esp,%ebp
      push  %ebx
      push  %ecx
      push  %edx

      mov   12(%ebp),%ebx     # = fd
      mov   8(%ebp),%edx      # &buffer
      dec   %edx
      xor   %ecx,%ecx
      dec   %ecx              #count=len
.fgtts1:                      #loop
      incl  %edx
      incl  %ecx
      cmp   $255,%ecx
      jge   .fgtts3
##    mov   12(%ebp),%ebx     # = fd
      push  %ebx
      call  _fgetc
      add   $4,%esp           #clean stack
      movb  %al,(%edx)
      cmp   $-1,%eax
      jle   .fgtts2
      cmp   $0x0a,%eax        #lf
      jz    .fgtts3
      or    %eax,%eax
      jnz   .fgtts1
.fgtts2:
      or    %ecx,%ecx
      jnz   .fgtts3
      mov   %eax,%ecx         #-1
.fgtts3:
      movb  $0x0,(%edx)       #byte
.fgtts4:
      mov   %ecx,%eax
      pop   %edx
      pop   %ecx
      pop   %ebx
      leave
      ret
      .align 16

_strlen:                #count chars up to terminating 0 ,or 255 max
      push  %ebp
      mov   %esp,%ebp
      push  %ecx
      push  %esi

      mov   8(%ebp),%esi      # = address of string
      dec   %esi
      xor   %eax,%eax
      dec   %eax
.strlen1:
      incl  %esi
      incl  %eax
      cmp   $255,%eax         #0xff
      jge   .strlen2
      movb  (%esi),%cl        #byte
      orb   %cl,%cl           #look for 0
      jnz   .strlen1
.strlen2:
      pop   %esi
      pop   %ecx
      leave                   #eax holds 0..255
      ret                     #str_len
      .align 16

_strcpy:                #&str1 &str2 strcpy &str1->&str2 %eax=len 255_max
      push  %ebp
      mov   %esp,%ebp
      push  %esi
      push  %edi
      push  %ecx

      mov   12(%ebp),%esi     #str1 |
      mov   8(%ebp),%edi      #str2 v
      dec   %esi
      dec   %edi
      xor   %eax,%eax
      dec   %eax
.strcpy1:
      inc   %esi
      inc   %edi
      inc   %eax
      movb  (%esi),%cl
      movb  %cl,(%edi)
      cmp   $255,%eax
#     cmp   $77,%eax       #test
      jge   .strcpy2
      orb   %cl,%cl
      jnz   .strcpy1
.strcpy2:
      movb  $0,(%edi)
      pop   %ecx
      pop   %edi
      pop   %esi
      leave
      ret
      .align 16

__putc:                 #write char to stdout
      push  %ebp
      mov   %esp,%ebp
      push  %ebx
      push  %ecx
      push  %edx
      mov   $1,%edx           #message length
      mov   $chbuf,%ecx       #address of string
      mov   8(%ebp),%eax      #ch
      mov   %eax,(%ecx)       #
      mov   $1,%ebx           #file handle (stdout)
      mov   $4,%eax           #sys-write
      int   $0x80             #call system
      pop   %edx
      pop   %ecx
      pop   %ebx
      leave
      ret
      .align 16
__eputc:                #write char to stderr
      push  %ebp
      mov   %esp,%ebp
      push  %ebx
      push  %ecx
      push  %edx
      mov   $1,%edx           #message length
      mov   $chbuf,%ecx       #address of string
      mov   8(%ebp),%eax      #ch
      mov   %eax,(%ecx)       #
      mov   $2,%ebx           #file handle (stderr)
      mov   $4,%eax           #sys-write
      int   $0x80             #call system
      pop   %edx
      pop   %ecx
      pop   %ebx
      leave
      ret
      .align 16

_writestr:              #write string to stdout
      push  %ebp
      mov   %esp,%ebp
      push  %ebx
      push  %ecx
      push  %edx
      mov   8(%ebp),%eax      # = address of string
      push  %eax              ##
      call  _strlen           ##eax=len
      pop   %ecx              ## = address of string
      or    %eax,%eax
      jz    .writestr1
      mov   %eax,%edx         #message length
##    mov   8(%ebp),%ecx      # = address of string
      mov   $1,%ebx           #file handle (stdout)
      mov   $4,%eax           #sys-write
      int   $0x80             #call system
.writestr1:
      pop   %edx
      pop   %ecx
      pop   %ebx
      leave
      ret
      .align 16
_ewritestr:             #write string to stderr
      push  %ebp
      mov   %esp,%ebp
      push  %ebx
      push  %ecx
      push  %edx
      mov   8(%ebp),%eax      # = address of string
      push  %eax              ##
      call  _strlen           ##eax=len
      pop   %ecx              ## = address of string
      or    %eax,%eax
      jz    .ewritestr1
      mov   %eax,%edx         #message length
##    mov   8(%ebp),%ecx      #address of string
      mov   $2,%ebx           #file handle (stderr)
      mov   $4,%eax           #sys-write
      int   $0x80             #call system
.ewritestr1:
      pop   %edx
      pop   %ecx
      pop   %ebx
      leave
      ret
      .align 16

_nl:                    #write crlf to stdout
      push  %ebp
      mov   %esp,%ebp
      movl  $10,%eax
      push  %eax
      call  __putc            #to stdout
      add   $4,%esp           #clean stack
      leave
      ret
      .align 16

_cls:                   #NN write crlfs to stderr
      push  %ebp
      mov   %esp,%ebp
      push  %ebx

      mov   8(%ebp),%ebx      #NN
      cmp   $202,%ebx         #max
      jle   .cls1
      mov   $202,%ebx
.cls1:                        #loop
      movl  $10,%eax
      push  %eax
      call  __eputc           #to stderr
      add   $4,%esp           #clean stack
      dec   %ebx
      jnz   .cls1
      pop   %ebx
      leave
      ret
      .align 16

#  -  -  -  -  -  -  -  -  -
_writelong:
      push  %ebp
      mov   %esp,%ebp
      push  %ebx
      push  %ecx
      push  %edx
      push  %edi
      sub   $20,%esp                #vars
      movl  $0,-12(%ebp)            #sign
      movl  $Nstr+32,%edi           #nm
      movb  $0,(%edi)               #0,(nm)
      cmp   $0,8(%ebp)              # nnn
      jge   .wrlng27
      negl  8(%ebp)                 # nnn
      movl  $1,-12(%ebp)            #sign
.wrlng27:
      mov   8(%ebp),%eax            # nnn
      mov   %eax,%edx
      mov   $10,%ebx
      cltd
      idivl %ebx                    #edx=rem
      lea   48(%edx),%eax           # edx+'0'->al
      decl  %edi                    #&nm
      movb  %al,(%edi)              # (nm)

      mov   8(%ebp),%ecx            # nnn
      mov   $1717986919,%eax
      imull %ecx                    # nnn
      sar   $2,%edx
      mov   %ecx,%eax
      sar   $31,%eax
      sub   %eax,%edx
      mov   %edx,8(%ebp)            # nnn
      cmp   $1,%edx                 # nnn
      jge   .wrlng27
.wrlng28:
      cmp   $1,-12(%ebp)            #sign
      jne   .wrlng32
      decl  %edi
      movb  $45,(%edi)              #'-'
.wrlng32:
      push  %edi              #&nm
      call  _writestr         #str to stdout
      add   $4,%esp

      pop   %edi
      pop   %edx
      pop   %ecx
      pop   %ebx        #mov  -4(%ebp),%ebx
      leave
      ret
      .align 16
tstwrlong:
      push  %ebp
      mov   %esp,%ebp
      push  $11
      call  _writehex
      call  _writelong
      add   $4,%esp
      call  _nl
      push  $-21
      call  _writehex
      call  _writelong
      add   $4,%esp
      call  _nl

      push  $-21345678
      call  _writehex
      call  _writelong
      add   $4,%esp
      call  _nl
      push  $-213456789
      call  _writehex
      call  _writelong
      add   $4,%esp
      call  _nl
      push  $-2134567890
      call  _writehex
      call  _writelong
      add   $4,%esp
      call  _nl
      push  $-2147065500   #800..
      call  _writehex
      call  _writelong
      add   $4,%esp
      call  _nl
      leave
      ret
      .align 16
_writehex:
      push  %ebp
      mov   %esp,%ebp
      push  %edx
      push  %edi
      sub   $20,%esp          #vars
      movl  $Nstr+32,%edi     #*nm
      movb  $0,(%edi)         #0,(nm)
      movl  8(%ebp),%edx      # nnn
.wrhex27:
      movl  %edx,%eax
      sarl  $4,%edx           #/ 16
      andl  $15,%eax          #% 16
      andl  $0x0fffffff,%edx  #
      addl  $'0',%eax
      cmpl  $57,%eax          #0..9
      jle   .wrhex28
      addl  $'A'-'9'-1,%eax   #A..F
.wrhex28:
      decl  %edi
      movb  %al,(%edi)
      cmpl  $1,%edx
      jge   .wrhex27
      decl  %edi
      movb  $'x',(%edi)
      decl  %edi
      movb  $'O',(%edi)

      push  %edi              #&nm
      call  _writestr         #str to stdout
      add   $4,%esp
   push  $32
   call  __putc
   add   $4,%esp

      pop   %edi
      pop   %edx        #mov  -4(%ebp),%ebx
      leave
      ret
#  -  -  -  -  -  -  -  -

#  -  -  -  -  -  -  -  -
#  _start included below
#  -  -  -  -  -  -  -  -
__getarg:               #convert 0bytes to ' ' copy to srcbuf rdbuf 255_max
      push  %ebp
      movl  %esp,%ebp
      push  %esi
      push  %edi
      push  %ebx
      push  %ecx
      push  %edx

      movl  8(%ebp),%esi      #address of string
      decl  %esi
      mov   $srcbuf,%edi      #srcbuf first argstr
      decl  %edi
      movl  12(%ebp),%edx     #length of string(s)
      cmpl  $255,%edx
      jle   .gtarg18
      movl  $255,%edx
.gtarg18:
      xor   %ebx,%ebx
      xor   %eax,%eax
      decl  %eax
.gtarg19:
      incl  %esi
      incl  %edi
      incl  %eax
      cmpl  %edx,%eax         #same as get,not bigger than bufsz
      jge   .gtarg25
      movb  (%esi),%cl
      orb   %cl,%cl
      jnz   .gtarg21
      or    %ebx,%ebx
      jnz   .gtarg20
      orl   $42,%ebx
      movb  $0,(%edi)
      mov   $rdbuf,%edi       #rdbuf second arg(s)
      decl  %edi
      jmp   .gtarg19
.gtarg20:
#     movb  $9,%cl            #tab
      movb  $32,%cl           #' '
.gtarg21:
      movb  %cl,(%edi)
      jmp   .gtarg19
.gtarg25:
      movb  $0,(%edi)
      pop   %edx
      pop   %ecx
      pop   %ebx
      pop   %edi
      pop   %esi
      leave
      ret
      .align 16

_start:                 # get argc args
      push  %ebp
      mov   %esp,%ebp

      mov   $emsg3,%eax
#emsg3: .ascii "name abcdefghijklmnopqrstuvwxyz ,count missing\n\0"
      push  %eax              #
      call  _ewritestr        #
      add   $4,%esp           #
      call  _nl               #and adjust 0xb5c
                              #
#     movl  $0xb59,%eax       # qwertyuio
#     movl  $0xb5c,%eax       # qwertyui
#     movl  $0xb5e,%eax       # qwertyu
#     movl  $0xb61,%eax       # args08 rand10
#     movl  $0xb64,%eax       # kat09
#     movl  $0xb6a,%eax       # qwe
#     movl  $0xb6d,%eax       # qw
#     movl  $0xb70,%eax       # q
      movl  $0xb5c,%eax       #
      movl  $0xb5c,%eax       # B73 - (namelen *3)
      movl  8(%ebp),%ebx      # so where can I get namelength? jdg.
      andl  $0xfff,%ebx
      subl  %ebx,%eax
      cmpl  $1,%eax           #strlen args
      jl    .strt7   #less
      push  %eax
      mov   12(%ebp),%eax     # argstr
      push  %eax
      call  __getarg          #srcbuf rdbuf ...
      add   $4,%esp           #pop
      add   $4,%esp           #pop
.strt7:

      mov   $srcbuf,%eax      #&buf
      push  %eax
      call  _writestr         #str to stdout
      add   $4,%esp
      call  _nl

      mov   $rdbuf,%eax       #&buf
      push  %eax
      call  _writestr         #str to stdout
      add   $4,%esp
      call  _nl
#  -  -  -  -  -  -  -  -

#  -  -  -  -  -  -  -  -
      mov   $msg2,%eax        #'ok'
      push  %eax
      call  _ewritestr
      add   $4,%esp

      mov   $0,%ebx           #exit code zero
      mov   $1,%eax           #sys-exit
      int   $0x80             #call system
      leave
      ret
      .align 8
#     end

      .section .rodata

         .align 16
emsg3:   .ascii "kat09 abcdefghijklkmnopq count missing\n\0"
         .align 16
#ile_nm: .ascii "/root/src/kat09.s\0"  #file name,0
#ile_nm: .ascii "/dev/random\0"        #file name,0
file_nm: .ascii "kat09.s\0"            #file name,0
         .align 16
emsg2:   .ascii "fclose err \n\0"      #
         .align 16
emsg1:   .ascii "fopen err \n\0"       #
         .align 16
msg2: .ascii "With no crash!"          #
lf:      .byte    0x0A,0               #does cr+lf in linux
         .align 16

      .section .data

chbuf:   .byte    0,0,0,0,0,0,0,0,0,0,0,0 #fgetc
         .align 16
fides:   .byte    0,0,0,0,0,0,0,0,0,0,0,0 #fd
         .align 16
rdbuf:   .ascii "0123456789ABCDEF0123456789ABCDEF" #256
         .ascii "0123456789ABCDEF0123456789ABCDEF"
         .ascii "0123456789ABCDEF0123456789ABCDEF"
         .ascii "0123456789ABCDEF0123456789ABCDEF"
         .ascii "0123456789ABCDEF0123456789ABCDEF"
         .ascii "0123456789ABCDEF0123456789ABCDEF"
         .ascii "0123456789ABCDEF0123456789ABCDEF"
         .ascii "0123456789ABCDEF0123456789ABCDEF"
         .byte    0,0,0,0,0,0,0,0,0,0,0,0
         .align 16
Nstr:    .ascii "0123456789ABCDEF0123456789ABCDEF" #80
         .ascii "0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF"
         .byte    0,0,0,0,0,0,0,0,0,0,0,0
         .align 16
srcbuf:  .ascii "This program is free software; you can redistribute it
and/or modify\n"
         .ascii "it under the terms of the GNU General Public License as
published by\n"
         .ascii "the Free Software Foundation (version 2 of the License).\n"
         .ascii "   \n"   # there are no 0s here, so we test 255 limit.
         .ascii "This program is distributed in the hope that it will be
useful,\n"
         .ascii "but WITHOUT ANY WARRANTY; without even the implied warranty
of\n"
         .ascii "MERCHANTABILITY or FITNESS foR A PARTICULAR PURPOSE.\n"
         .ascii "See the GNU General Public License for more details.\n"
         .byte    0,0,0,0,0,0,0,0,0,0,0,0
#  -  -  -  -  -  -  -  -
#  end jdg



-- 
VGER BF report: U 0.989331
