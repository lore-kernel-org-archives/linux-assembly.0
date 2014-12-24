From: "eric lin" <fsshl@luxmail.com>
Subject: need help on assembly book's example(intel on win/dos 32/16bit)
Date: Tue, 23 Dec 2014 21:26:38 -0800
Message-ID: <20141223212638.2C0A8388@m0005310.ppops.net>
Reply-To: <fsshl@luxmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

hello/dear linux or advanced assembly language proramers:
  I copied a assembly code/program from book
"IBM PC Assembly Language and Programming", 5th ed, Peter Abel
page 350, chapter18, last section's program,
which according to author is
Select and delete files

  I am on window 7 32bit and download/using masm 6.15(or6.14) to compile it to generate obj and exe file

the result, when it run,
it can show the files in my directory and ask me whether I will(delete=Y, Keep=N, <enter>=exit), 
but when I tried to delete(Y), 
after complete,
 
I check the directory which contain files I intend to delete by this exe program, I found they still there, none be
delete or modified.

please help
----------------
TITLE A18SELDL (EXE) Select and delete files
CODESG     SEGMENT PARA 'Code'
           .MODEL SMALL
           .STACK  64
           .DATA   
MSSG_LEN   EQU     32
ROW        DB      00	;Screen row
COL	   DB      10	;  and column
PATHNAME   DB	   'C:\temp\*.*', 00H
DELMSG     DB      'Delete? '
ENDMSG     DB	   'No more directory entries	'
ERRMSG1	   DB      'Invalid path/file		'
ERRMSG2	   DB	   'Write-protected disk	'
PROMPT	   DB	   'Y = Delete, N = Keep, Ent = Exit'
DISKAREA   DB	   43 DUP(20H)
;----------------------------------------------------------
		.CODE
A10MAIN	PROC	NEAR		;Main procedure
	MOV	AX,@data	;Initialize
	MOV	DS,AX		;  segment
	MOV	ES,AX		;  registers
	MOV	AX,0003H	;Set video mode
	INT	10H		;  and clear screen
	CALL	B10FIRST	;  directory entry
	CMP	AX,00H		;If no entries
	JNE	A90		;  exit
	MOV	CX,MSSG_LEN	;Length of prompt
	LEA	BP,PROMPT	;Display initial prompt
	CALL	F10DISPLY
	INC	ROW
A20:
	CALL	D10MESSG	;Display filename
	CALL	E10DELETE	;Delete it requested
	CMP	AL,0FFH		;Request for finish?
	JE	A90		;  yes, exit
	INC	ROW		;Set next row
	CALL	C10NEXT		;Get next directory entry
	CMP	AX,00H		;Any more entries?
	JE	A20		;  yes, continue
A90:	MOV	AX,4C00H	;  no, end processing
	INT	21H
A10MAIN ENDP
;		Find first entry in directory:
;		------------------------------
B10FIRST PROC	NEAR		;Uses AX, BP, CX, DX
	 MOV	AH,1AH		;Get DTA for function
	 LEA	DX,DISKAREA	;  calls
	 INT 	21H
	 MOV	AH,4EH		;Locate first directory
	 MOV	CX,00		;  entry
	 LEA	DX,PATHNAME	;Address of ASCIIZ string
	 INT	21H
	 JNC	B90		;Valid operation?
	 PUSH	AX		;  no,
	 MOV	CX,MSSG_LEN	;  display ending
	 LEA	BP,ERRMSG1
	 CALL	F10DISPLY	;
	 POP	AX
B90:	 RET
B10FIRST ENDP
;		Find succeeeding entries in directory:
;		--------------------------------------
C10NEXT	 PROC	NEAR		;Uses AX, BP, CX
	 MOV	AH,4FH		;Read next
	 INT	21H		;  directory entry
	 CMP	AX,00H		;More entries?
	 JE	C90		;  yes, bypass
	 PUSH	AX		;  no,
	 MOV	CX,MSSG_LEN	;  display ending
	 LEA	BP,ENDMSG	;  message
	 CALL	F10DISPLY
	 POP	AX
C90:	 RET
C10NEXT	 ENDP
;		Calculate length of filename and display:
;		-----------------------------------------
D10MESSG PROC	NEAR		;Uses AL, BP, CX, DI
	 MOV	COL,10
	 MOV	CX,08		;Length of message
	 LEA	BP,DELMSG	;Display delete message
	 CALL	F10DISPLY
	 MOV	COL,18
	 LEA	DI,DISKAREA+30	;Filename in DTA
	 MOV	AL,00H		;Scan for 13 bytes
	 MOV	CX,13		;  for hex 00s
	 REPNE	SCASB		;  in disk area
	 NEG	CX		;Calc. length
	 ADD	CX,13		;  of filename
	 LEA	BP,DISKAREA+1EH	;Display
	 CALL	F10DISPLY	;  filename
	 RET
D10MESSG ENDP
;		Delete record if requested;
;		---------------------------
E10DELETE PROC	NEAR		;Uses AX, BP, CX, DX
	  MOV	AH,10H		;Accept character
	  INT	16H		;  reply (y/n)
	  CMP	AL,0DH		;Enter character?
	  JE	E80		;  yes, exit
	  OR	AL,00100000B	;Force lowercase
	  CMP	AL,'y'		;Delete requested?
	  JNE	E90		;  no, bypass
	  MOV	AH,41H		;
	  LEA	DX,DISKAREA+1EH	;  address of filename
	  INT	21H		;  delete entry
	  JNC	E90		;Valid delete?
	  MOV	CX,MSSG_LEN	;  no, display
	  LEA	BP,ERRMSG2	;  warning message
	  CALL	F10DISPLY	;
E80:	  MOV	AL,0FFH		;End-of-process indicator
E90:	  RET
E10DELETE ENDP
;		Display routine:
;		----------------;Uses AX, BX, DX
F10DISPLY PROC	NEAR		;BP, CX set on entry
	  MOV	AX,1301H	;Reguest display line
	  MOV	BX,0016H	;Page:attribute
	  MOV	DH,ROW
	  MOV	DL,COL
	  INT	10H
	  RET
F10DISPLY ENDP
	  END	A10MAIN

_____________________________________________________________
Luxmail.com
