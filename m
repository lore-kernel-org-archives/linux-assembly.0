From: Rudolf Marek <MAREKR2@cs.felk.cvut.cz>
Subject: Re: Assembly mnemonic
Date: Tue, 28 May 2002 19:05:06 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <ad0das$tbi$2@main.gmane.org>
References: <200205281625.JAA14301@gold.he.net>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200205281625.JAA14301@gold.he.net>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J.S.Souza" <jssouza@pacbell.net>
Cc: linux-assembly@vger.kernel.org

Hello,

google.com found this:

   The Intel-syntax conversion instructions
      * cbw -- sign-extend byte in %al to word in %ax,
      * cwde -- sign-extend word in %ax to long in %eax,
      * cwd -- sign-extend word in %ax to long in %dx:%ax,
      * cdq -- sign-extend dword in %eax to quad in %edx:%eax,
      * cdqe -- sign-extend dword in %eax to quad in %rax (x86-64 only),
      * cdo -- sign-extend quad in %rax to octuple in %rdx:%rax (x86-64 only)

are called cbtw, cwtl, cwtd, cltd, cltq, and cqto in AT&T naming. as  as 
                             ^^^^^
accepts either naming for these instructions.

http://sources.redhat.com/binutils/docs-2.12/as.info/i386-Mnemonics.html


regards
		Rudolf



On Tue, 28 May 2002, J.S.Souza wrote:

> Date: Tue, 28 May 2002 09:25:30 -0700
> From: J.S.Souza <jssouza@pacbell.net>
> To: linux-assembly@vger.kernel.org
> Subject: Assembly mnemonic
> 
> I was looking at the assembly output from a small C program just to see how 
> the compiler dealt with a certain procedure and can't figure out what the 
> mnemonic "cltd" is.  Does anyone know what this is?  There is NO arguments 
> for it, it's just by itself on a line.
> 
> 		Cheers,
> 		Jeff Souza
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 


