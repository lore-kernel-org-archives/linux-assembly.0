From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: variables
Date: Sat, 24 Aug 2002 13:54:42 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D677402.EA49BF30@wp.pl>
References: <20020823102208Z318729-685+36030@vger.kernel.org>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

RCS wrote:
> 
> Hi all,
> 
>   Can anyone explain me how global and local variables from C are treated in
> assembler?
>   Is that write that local variables are storage in the stack?

Global variables are likely to be placed in data segment and all local -
pushed on the stack. But i think it really depends on C compiler how it
handles all Your data. If the program is tiny, a C compiler may all Your
data push on the stack - i don't know that C standard says that all Your
global data must be placed in data segment (i suppose it doesn't say)
but it seems that it works in that way for most of programs (not
hello-like).

-- 
Maciej Hrebien

