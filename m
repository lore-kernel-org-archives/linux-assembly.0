From: peter w krause <wklux@yahoo.co.uk>
Subject: Re: I/O
Date: Thu, 11 Sep 2003 14:21:21 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200309111414.47716.wklux@yahoo.co.uk>
References: <200309110801.37516.rafael.diniz@ic.unicamp.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200309110801.37516.rafael.diniz@ic.unicamp.br>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rafael Diniz <rafael.diniz@ic.unicamp.br>, linux-assembly-admin@mlists.in-berlin.de, linux-assembly@vger.kernel.org

Rafael Diniz am Donnerstag, 11. September 2003 12:01:
> Hello all,
> I'm using the sys_read to read chars from keyboard but I would like to read
> the key as the user type the key, and not wait for the enter command to
> read the char.
> What's the best solution to this problem?
			^^^^^^^^^^^^ -?- 
my solution:

ioctl TCGETS		get and save current state into memory
fcntl F_GETFL		read channel flags to ecx
fcntl F_SETFL		with ecx as just read
ioctl TCSETSW		set non-canonical mode
		....		do the program
fcntl F_SETFL		restore channel flags
ioctl TCSETSW		restore i/o mode
		ret

examples from F4 source, file <inikernel.S>, att syntax,
	http://www.lxhp.in-berlin.de/lhpf4.html
(nasm syntax examples in 'lib4th', file <l4sys.inc>
	http://www.lxhp.in-berlin.de/lhpf8.html )

// set 'stdin' to non-blockin r/w mode
inonbl:	pushal
		pushal
		movl $stdin,ebx
// file descriptor
 		movl $F_GETFL,ecx
// read the i/o flags
// in case of modification of a re-useable device (console, &c)
// some code should now store the i/o flags for later restauration
		sys_ fcntl
		andl $~(O_WRONLY|O_RDONLY|O_RDWR|O_NONBLOCK|O_SYNC),TS
// clr flag-bits
		orl $(O_RDWR|O_NONBLOCK),eax
// modify to non-blocking and r/w
		movl eax,edx
		movl $F_SETFL,ecx
		sys_ fcntl
 // write modified i/o flags
		popal
 		ret 

// get 'stdout' tty description
gettattr:	pushal
		leal tattrv,edx
		movl $TCGETS,ecx
		sys_ ioctl
// fetch stdin vt state for rst on exit
		cmpl $maxerr,eax
// error if ret EAX unsigned greater than 0xfffff000
		jnc 2f
// again, but saved for later restauration of console state
		leal stattv,edx
 		sys_ ioctl
 		cmpl $maxerr,eax
2:		popal
		ret                                                                                                                              

// set 'canonical' i/o mode,  have the default data in memory at <tattrv>
vtini:	pushal
		movl $stdin,ebx
// store the rsp file descriptor to reg EBX
		leal tattrv,edx
		movl $TCSETSW,ecx
 		andl $~(ICANON|ECHO),termios_c_lflag(edx)
// leave sigs enabled, disable erase/fill processing, echo
		orl $ONLCR,termios_c_oflag(edx)
// enabling NL<-CR/NL                                                                   
		andl $~(INPCK|ISTRIP|IXON),termios_c_iflag(edx)
// 8bit chars
 		movb $NVTIME,termios_c_cc+VTIME(edx)
// timeout * 1/10 s (if ~ICANON)
  		movb $NVMIN,termios_c_cc+VMIN(edx)
 // min chars per read opr, EAGAIN from sys_read only if NVMIN=0
		sys_ ioctl
 // set new tty mode                                                                                      
 		popal                                                                                                                            
  		ret                                                                                   

sys_fcntl:		http://www.lxhp.in-berlin.de/lhpsysc1.html#fcntl
				http://www.lxhp.in-berlin.de/lhpfcntl.html
sys_ioctl:		http://www.lxhp.in-berlin.de/lhpsysc1.html#ioctl
				http://www.lxhp.in-berlin.de/lhpioctl.html#tty_ioctl.c
termios structure:	http://www.lxhp.in-berlin.de/lhpstruc.html
manual page:	man 4 console_ioctls
info page:		info libc, node 'Noncanonical Input'

regards,
	hp
-- 
linux,asm,forth: http://www.lxhp.in-berlin.de/index-lx.shtml
pse, reply to  >> hp -at- lxhp -dot- in-berlin -dot- de <<

