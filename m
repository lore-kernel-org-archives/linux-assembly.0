From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Local Symbol Names
Date: Wed, 25 Jun 2003 12:44:03 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <16121.64387.51274.655658@eidolon.muppetlabs.com>
References: <Law14-F6AauNjVuMhvq0002ae10@hotmail.com>
	<03062511461400.00228@linux24>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <03062511461400.00228@linux24>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

>	The call instruction probably was used to empty the
>	the Execution Unit's instruction cache; thereby
>	forcing it to be reloaded from memory. Or, it could
>	be used just to force a time delay.

The pop %eax instruction, however, makes it clear that the purpose of
the code is to get the current PC address into eax. As hpr suggested,
almost certainly for use in writing position-independent code.

b
