From: "Rick A. Hohensee" <rickh@capaccess.org>
Subject: Re: switching to real mode
Date: Fri, 25 Jul 2003 15:42:59 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <fc.0010c7b2009d59703b9aca00ee66b88e.9d59aa@capaccess.org>
References: <Pine.LNX.4.33.0307251536460.25632-100000@technix.oeh.uni-linz.ac.at>
 <3F2166D8.65AE79D8@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3F2166D8.65AE79D8@wp.pl>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: m_hrebien@wp.pl
Cc: linux-assembly@vger.kernel.org

Linux has support for V86 mode, which switches to something closely
resembling Real Mode on IRET, and switches to pmode on an interrupt, so
that 8086 code can be run on a pmode paged OS, and the V86 task can be
paged, which allows numerous V86 tasks to think they have the low meg.

Otherwise, switching to Real Mode = Leaving Linux, or any other unix-alike.
You could do that too, and alternate between Linux and Real Mode, maybe.
Doing so would be a more twisted hack than Al Viro's namespaces.

Rick Hohensee


