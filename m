From: "Richard Cooper" <generic@xersedefixion.com>
Subject: OSS ioctls...
Date: Wed, 22 Dec 2004 12:44:50 -0500
Message-ID: <opsje7k0wruqea3r@sucks.airplane.fire>
References: <41C988EB.9CC568EF@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <41C988EB.9CC568EF@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: linux-assembly@vger.kernel.org

I am going to go insane...  Please help...

Here's my code:

   section .text

   %define SNDCTL_DSP_RESET 0x5000
   %define SNDCTL_DSP_SPEED 0x5002
   %define SNDCTL_DSP_SETFMT 0x5005
   %define SNDCTL_DSP_GETFMTS 0x500B
   %define SNDCTL_DSP_CHANNELS 0x5006
   %define SNDCTL_DSP_POST 0x5008
   %define SNDCTL_DSP_SETFRAGMENT 0x500A
   %define AFMT_S16_LE 0x0010

   sys sys_open, dev_dsp, O_WRONLY; systrap "opening /dev/dsp"
   mov [out_desc], eax

   sys sys_ioctl, [out_desc], SNDCTL_DSP_RESET, 0;               systrap  
"resetting dsp"
   sys sys_ioctl, [out_desc], SNDCTL_DSP_GETFMTS, formats;       systrap  
"getting dsp formats"
   sys sys_ioctl, [out_desc], SNDCTL_DSP_CHANNELS, channels;     systrap  
"setting dsp channels"
   sys sys_ioctl, [out_desc], SNDCTL_DSP_SPEED, speed;           systrap  
"setting dsp speed"
   sys sys_ioctl, [out_desc], SNDCTL_DSP_SETFMT, format;         systrap  
"setting dsp format"
   sys sys_ioctl, [out_desc], SNDCTL_DSP_SETFRAGMENT, fragment;  systrap  
"setting dsp fragment size"

   section .data

   channels dd 1
   speed dd 8000
   format dd AFMT_S16_LE
   formats dd 0
   fragment dd $00080006
   ass dd 0

   section .bss

   out_desc resd 1

Every time I run it I get a error message like this:

   Error getting dsp formats

   EAX Error Code: EINVAL -- Invalid argument
   EAX: FFFFFFEA  EBX: 00000004  ECX: 0000500B  EDX: 0804B3A0
   ESI: 00000000  EDI: 00000000  EBP: 00000000  ESP: BFFFF810
   EIP: 0804822E  EFLAGS: 00000000 00000000 00000010 00000010

I really can't imagine what the invalid argument is.  According to the  
register dump right there the file descriptor is in ebx, the ioctl number  
in ecx, and a memory pointer in edx, yet every ioctl except for  
SNDCTL_DSP_RESET gives that same error.

If I forget the ioctls and go on, I can write to the sound device and get  
sound, but I need to use them because it's not set to the right format by  
default.

I've run strace on sox and I'm using the same ioctls it does, yet they  
work for it and not for me.  This is nuts.

The OSS documentation says not to use SNDCTL_DSP_RESET after opening.   
I've tried it without it and with it (since sox does it) and it's the same  
either way.

The only thing I could think might be wrong is that the ioctl numbers are  
wrong, but I looked in soundcard.h and it says SNDCTL_DSP_GETFMTS is ('P',  
11) which best I can figure has to be $500B.

