From: "Jason Roberts" <v3ct0r99@hotmail.com>
Subject: confused asm newbie
Date: Thu, 23 Oct 2003 12:03:44 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Law9-F40TZiqpJjmH4P000039ed@hotmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

I have a few questions concerning how the stack is used and how memory is 
accessed
and what it looks like.I've read books, which only serve to confuse me, or 
the author tries
to mystify you into believing assembly is dark magic only for the elite.
Thanks in advance for any help and/or suggestions--

   in C  If I code char *p = "hello" then *p will be 'h' and *(p+1) will be 
'e', and likewise
   p[4] will derefrence byte 5 ,which is 'o'.If I  ++p  the value at p  will 
be whatever is at the address        of the next byte,etc

   now, how does this relate to asm registers???
   based on code below  'msg' (line 5) is a pointer or 'label' which 
represents an address which             holds 3              bytes plus 
LF,CF,and NULL.
   based on my current understanding--
    msg = address of first byte
   [msg] = value at base,'a'
   add [msg],4 adds ascii value 4 to 'a' so it's now 'e'
   add msg,3   adds 3 to pointer, so msg is now base+3, so  now [msg] should 
be 'c'
   am I right on this???

    also, when I used edi to store string in _start (line 61)  I mov'ed 
'string' without the brackets
    for some reason the use of brackets is neccessary in the case of
    msg (line 84) ...why so?
    also, the stack issue:
    based on my knowledge the stack grows downward but reads upward, i.e. if 
I push
    edi then I have pushed 4 bytes onto stack- and so sp decrements 4 times 
and points
    at last item pushed.  Sp only points to top of stack and knows nothing 
about memory below
    unless we tell it too by explicityly moving it down,which is allocating 
space basically,malloc()
    for the C gang. Am I getting it?
    My only concern is this:
    what does edi look like after line 84???
    we have 6 bytes going into a 4-byte register...
    my guess is:
    6162630a with the CR and NULL being ignored.
    If I'm right then what does the stack look like after the push?
    From what I see the values in the registers are pushed from the low-byte 
up to high so
    that 61 is on top of stack, or worded differently, esp holds the address 
of where 61 is.

    If I got all this right say Kudos! ,otherwise please point me narrow--
    Thankyou for your time and patience.
     Paul


line 1:  section .data
line 2:
line 3:  string     db "Hello insanity!",10,13,0
line 4:  error_msg  db "Null Pointer!",10,13,0
line 5:  msg        db "abc",10,13,0
line 6:
line 7:
line 8:
line 9:  section .text
line 10:
line 11:  global _start
line 12:
line 13:  jmp _start
line 14:
line 15:  ;routine which puts length of string at es:edi into ecx and 
returns
line 16:  get_len:
line 17:           jmp chk_edi
line 18:
line 19:  _inc:
line 20:           inc ecx
line 21:   jmp scan
line 22:
line 23:   ;check that edi is not null or scasb will fail
line 24:  chk_edi:
line 25:           or edi,edi
line 26:           cmovz eax,edi
line 27:   dec eax
line 28:           ret
line 29:
line 30:
line 31:  scan:
line 32:
line 33:   scasb
line 34:           jne _inc
line 35:           ret ; but what if first byte is null? well when ret we 
will check now wont we!
line 36:
line 37:
line 38:
line 39:  error:
line 40:
line 41:
line 42:   mov  edx,15     ;length of buffer
line 43:   mov  eax,4  ;sys_write
line 44:   mov  ebx,1       ;file descriptor
line 45:   mov  ecx,error_msg  ;buffer
line 46:
line 47:   int  0x80
line 48:
line 49:
line 50:           mov ebx,-1
line 51:   mov eax,1
line 52:   int 0x80
line 53:
line 54:
line 55:
line 56:
line 57:  _start:
line 58:
line 59:   mov eax,0 ;used for scasb
line 60:   mov ecx,0 ;will be the length value of string,init to  0
line 61:   mov edi,string    ;if  given null will produce an exception-- 
which I handle
line 62:   cld
line 63:   call get_len
line 64:   cmp eax,0
line 65:           js error
line 66:
line 67:
line 68:
line 69:  write:
line 70:
line 71:           or ecx,ecx       ;check if string was null
line 72:   jz exit          ; could implement exception handler
line 73:   mov  edx,ecx     ;length of buffer
line 74:   mov  eax,4  ;sys_write
line 75:   mov  ebx,1       ;file descriptor
line 76:   mov  ecx,string  ;buffer
line 77:
line 78:   int  0x80
line 79:
line 80:
line 81:
line 82:
line 83:  _test:
line 84:           mov edi,[msg]
line 85:           push edi
line 86:
line 87:           mov  edx,4         ;length of buffer
line 88:   mov  eax,4    ;sys_write
line 89:   mov  ebx,1         ;file descriptor
line 90:   mov  ecx,esp       ;buffer
line 91:   add  dword [ecx],4 ;ecx should be 'e'
line 92:           int  0x80
line 93:
line 94:   ;will print 'ebc' on stdout
line 95:
line 96:
line 97:  exit:
line 98:
line 99:   mov ebx,eax
line 100:   mov eax,1
line 101:   int 0x80

_________________________________________________________________

_________________________________________________________________
Enjoy MSN 8 patented spam control and more with MSN 8 Dial-up Internet 
Service.  Try it FREE for one month!   http://join.msn.com/?page=dept/dialup

