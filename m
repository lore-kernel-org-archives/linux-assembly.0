From: willy meier <wklux@yahoo.co.uk>
Subject: Re: Orphaned Processes and TCSETSW
Date: Sun, 19 Oct 2003 17:08:09 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F92B6E9.BF7360A8@yahoo.co.uk>
References: <3F902542.705ADCA4@yahoo.co.uk> <oprw7idjuab2epmx@localhost>
Reply-To: ns@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pj@evobsyniva.com
Cc: linux-assembly@vger.kernel.org

Philip Jacob Smith wrote:
> settings under the expectation that it doing so would mess things up. 
> However, that's not the case this time, and in fact not allowing Softer 
> to change the settings messes things up.

my solution, not at all perfect, but at least providing some last
resort, is the aequivalent to <stty sane> coded into the final clean-up
procedure plus, a (sort of) switch by which that part could be
dis-abled, at runtime.
at least, it returns the keyboard in an accessible state and, it's
results are something which can easily be managed w. the standard tools.

works well w. my forth/lesspipe example, but wasn't tested, further.

hp

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
  >> xxxx -at- lxhp -dot- in-berlin -dot- de <<
