From: peter <p.willis@telus.net>
Subject: asm statement in C
Date: Sun, 16 Feb 2003 20:04:25 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200302162004.25528.p.willis@telus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hello,

I would like to pass a string pointer from a C string
to an asm(); block.

ie:

function()
{
	static char buff[]={"this is some text\n"};
	asm(
		"pushl mytext
		//morecode...
		"
		:
		:
		);
}

Anyone know what format the parameter section by the second colon
should be in porder to pass 'buff'.

Thanks for any help.

Peter
