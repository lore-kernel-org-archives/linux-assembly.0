From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: OSS ioctls...
Date: Wed, 22 Dec 2004 21:40:20 +0100
Message-ID: <41C9DBB4.C82BDD71@wp.pl>
References: <41C988EB.9CC568EF@comcast.net> <opsje7k0wruqea3r@sucks.airplane.fire>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Richard Cooper wrote:
> 
> I am going to go insane...  Please help...
> 
> Here's my code:
> 
>    section .text
> 
>    %define SNDCTL_DSP_RESET 0x5000
>    %define SNDCTL_DSP_SPEED 0x5002
>    %define SNDCTL_DSP_SETFMT 0x5005
>    %define SNDCTL_DSP_GETFMTS 0x500B
>    %define SNDCTL_DSP_CHANNELS 0x5006
>    %define SNDCTL_DSP_POST 0x5008
>    %define SNDCTL_DSP_SETFRAGMENT 0x500A
>    %define AFMT_S16_LE 0x0010
> 
>    sys sys_open, dev_dsp, O_WRONLY; systrap "opening /dev/dsp"
>    mov [out_desc], eax
> 
>    sys sys_ioctl, [out_desc], SNDCTL_DSP_RESET, 0;               systrap
> "resetting dsp"
>    sys sys_ioctl, [out_desc], SNDCTL_DSP_GETFMTS, formats;       systrap
> "getting dsp formats"
>    sys sys_ioctl, [out_desc], SNDCTL_DSP_CHANNELS, channels;     systrap
> "setting dsp channels"
>    sys sys_ioctl, [out_desc], SNDCTL_DSP_SPEED, speed;           systrap
> "setting dsp speed"
>    sys sys_ioctl, [out_desc], SNDCTL_DSP_SETFMT, format;         systrap
> "setting dsp format"
>    sys sys_ioctl, [out_desc], SNDCTL_DSP_SETFRAGMENT, fragment;  systrap
> "setting dsp fragment size"
> 
>    section .data
> 
>    channels dd 1
>    speed dd 8000
>    format dd AFMT_S16_LE
>    formats dd 0
>    fragment dd $00080006
>    ass dd 0
> 

[cut]

Correct me if i'm wrong but as i remember the ioctl gets an
int (dd) as an argument - not an address. So [] is needed.

-- 
Maciej Hrebien

