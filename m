From: TheReader06@comcast.net
Subject: Re: Unable to access memory address.
Date: Fri, 25 Mar 2005 12:00:38 +0000
Message-ID: <032520051200.14186.4243FD66000C6DB00000376A2205884484C0CF9D0A0B0E0AAD0A08AB@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

You don't need to use gcc to link

gcc will try to add it's own _start label, so use ld instead

ld -o prog prog.o

Joshua Roys
