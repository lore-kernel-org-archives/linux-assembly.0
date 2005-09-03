From: jeff <jko@bsn1.net>
Subject: Re: newbie question
Date: Sat, 3 Sep 2005 10:36:36 -0700
Message-ID: <200509031036.37074.jko@bsn1.net>
References: <7bd86613aa9166680282e502f1d2d11b@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <7bd86613aa9166680282e502f1d2d11b@wanadoo.fr>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: linux-assembly@vger.kernel.org

On 09/03/2005 10:16 am, raphael wrote:
> I would like to know how i can manage to read the entry
> on the keyboard without using C functions like scanf or get.

You can use kernel calls.  The keyboard operates in two
modes and you need to select the mode first.

In raw mode each key press is provided.  In cooked mode
a whole line of data is provided when <enter> key pressed.

There are lots of examples, but the code looks like this:
 1. select mode, save previous mode
 2. wait for key press
 3. restore mode

Here is some code from asmlib.  It shows handling of multi
byte keys and the mouse.  This is probably does more than
you want, but may be useful.

  [section .text]

 extern raw_set2
 extern raw_unset2
 extern kbuf
 extern key_poll
 extern mouse_check
 extern poll_rtn
 extern kbuf_end
 extern key_flush
     

;   read_stdin - read stdin data to "kbuf"
; INPUTS
;   none
; OUTPUT
;   kbuf - contains keys read with zero termination
; NOTES
;    source file: read_stdin.asm
;
;    read_stdin calls raw_set2 to put keyboard in  raw
;    mode.  It then reads data to "kbuf" and calls
;    "raw_unset2 to restore terminal state.
;
  global read_stdin
read_stdin:
  call	raw_set2			;set raw mode and save previous mode
km_10:
  mov	ecx,kbuf
more_keys:
  mov	eax,3			;kernel read call
  mov	edx,1			;read one byte
  mov	ebx,0			;read stdin
  int	80h
  or	eax,eax
  js	km_15
  add	ecx,eax			;advance buffer ptr
  call	key_poll
  test	byte [poll_rtn],8	;check for error
  jz	km_20
km_15:
  call	key_flush
  jmp	short km_10
km_20:
  cmp	ecx,kbuf_end
  je	k_exit			;exit if buffer full
  test	byte [poll_rtn],1
  jnz	more_keys
k_exit:
  mov	byte [ecx],0		;terminate string
  call	mouse_check		;check if mouse data read
  call	raw_unset2
  ret 

