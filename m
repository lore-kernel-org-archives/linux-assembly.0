From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: How to move the cursor
Date: Tue, 23 Sep 2003 10:02:12 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F6FFE04.518EB744@wp.pl>
References: <20030923014209.GA2978@frajola.lab.ic.unicamp.br>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

"R@f@el D1n1z" wrote:
> 
> Hi all,
> I would like to know how to change the position of cursor on the screen.
> I'm looking at this howto:
> http://www.linuxassembly.org/articles/rawkb.html
> But I could not find anything about this subject.

Try escape sequences, ie:

char c[]="\x1b[2B";
write(STDOUT_FILENO,c,sizeof(c));

will move cursor down 2 rows. See man console_codes for more.

-- 
Maciej Hrebien

