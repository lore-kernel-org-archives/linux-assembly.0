From: "Joseph D. Wagner" <wagnerjd@prodigy.net>
Subject: RE: sys_read/write called from kernel space in a process
Date: Sat, 30 Nov 2002 11:46:45 -0600
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <000001c29898$747f5cb0$66435aa6@joe>
References: <3DE8F8783B0.CE65WINTRMUTE@smtp.iddeo.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3DE8F8783B0.CE65WINTRMUTE@smtp.iddeo.es>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Wintermute' <wintrmute@retemail.es>, linux-assembly@vger.kernel.org

You may be interested in this project:
http://sourceforge.net/projects/biosdiskiolib

Joseph Wagner

-----Original Message-----
From: linux-assembly-owner@vger.kernel.org
[mailto:linux-assembly-owner@vger.kernel.org] On Behalf Of Wintermute
Sent: Saturday, November 30, 2002 11:42 AM
To: linux-assembly@vger.kernel.org
Subject: sys_read/write called from kernel space in a process


	I've been working on asm IA32 code to perform a series of
things,
until I reached a point where I don't really know how to continue, so I
write here wishing someone can shed a bit light on this path - not code,
the problem is the concept -... I'll try to explain it:

	* I handled sys_exec function on int 080h, so every time (every
process) this function is requested, int080h first goes to my code
installed at kernel, then goes to the real exec function (my code is
intalled via __get_free_pages kernel internal function and the OS
continues working without any problem)

	* When a file is executed via int 080h sys_exec, EBX points to
the filename (ending with a @ which has to be changed to a "0" to
perform a sys_open on it). 

	* Now, the problem arises when trying to read or write to that
file. Code like this doesn't work (it's just an example, not what I'm
actually trying to do):

	mov eax,03h	; read (ebx holds file descriptor)
	lea ecx,[buffer+ebp]    ; base pointer as code must be
realocatable
	mov edx,100h	; read 256 bytes
	int 080h
	[...]
	mov eax,04h	;sys_write
	mov ecx,[buffer+ebp]
	mov edx,100h
	int 080h

	* When executing this code, the buffer isn't written to file
(even if it's modified or not there's no change, writing operation fails
miserably). Anyway, if for example I do something like:

	mov eax,04h
	xor ecx,ecx ; ecx = 0
	mov edx, 100h
	int 080h

	* Then, that part of memory gets written into the file (the
write operation works). Also, reading at my buffer fails when reading.
My hypothesis is that there's some problems with segments: as I call int
080h to read or write, probably Linux thinks that it's called from the
user part of the process and not from the kernel, so it tries to reach
the [buffer+ebp] within the user-space and not kernel-space: so it
fails, though it doesn't give any warning and everything seems to work 
(except that nothing is read/written). That is, int080h is called from
kernel-space in the process (when an exec function is requested) and
probably it thinks my buffer at kernel is in user space using an
user-segment (as I say, this is just an hypothesis, but I don't really
know what's happening, that's why I wrote this email)... other syscalls
are called from kernel space without any problem (such as sys_open, as
EBX points to the file-name but, I think, at user-space, so it doesn't
give any problems... other functions like sys_write also work perfectly)

	* In any case, I'm somewhat lost on what to do... I thought on
malloc'ing some space at the actual process and using it as a buffer,
though
I don't know which internal functions manage heap dynamic changing on
asm and I'm still unsure on this... not asking for code, just if anyone
knows what the problem can be, could you shed some light about this
problem and what can be failing here x)

	Thanks



... just some flesh caught in this big broken machine
* Origin: http://pagina.de/wintermute
-
To unsubscribe from this list: send the line "unsubscribe
linux-assembly" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

