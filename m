From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: question on assembly on SH4 (linux portage)
Date: Thu, 11 Dec 2003 08:43:37 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FD82029.3070806@eprocess.fr>
References: <3FD48669.9030203@eprocess.fr>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3FD48669.9030203@eprocess.fr>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: fmarmond@eprocess.fr
Cc: linux-assembly@vger.kernel.org

Well, it seems nobody works on SH4 here? ;)
For information in the archives, opcodes for SH4/SH5 can be found here.
http://www.superh.com/documentation/documents.php?id=17

For self-answering (if anybody wants to switch from x86 to sh4 one day):
BSR and BSRF are for relative jumps, we can use JSR for absolute jumps.
Integration in a C/C++ prog is pretty easy, just have to know that a JSR 
needs a indirection (mov.l function_to_call_ptr,rx; jsr @rx) (instead 
of: bsr function_to_call)

After few hours working on SH4 assembly, it is not too complexe and 
powerfull enough to make it fun to code!

Fred

Frederic Marmond wrote:

> Hi,
> I'm working on a SH4 portage, and I have a problem in a function.
> Using a BSR, we seems to be limited to a 12bits jump.
> How may I call a far subroutine?
>
> thanks for help...
>
> Fred
>
>


