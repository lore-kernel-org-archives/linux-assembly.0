From: Konstantin Boldyshev <konst@linuxassembly.org>
Subject: Re: GCC Register Usage
Date: Thu, 27 Jun 2002 09:46:54 +0400 (MSD)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.43L.0206262011290.963-100000@alpha.linuxassembly.org>
References: <4EEA533B.72B7DC09.0257E4BA@aol.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4EEA533B.72B7DC09.0257E4BA@aol.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

On Wed, 26 Jun 2002 RHYDEMSCS@aol.com wrote:

> I'm calling some assembly code from GCC
> and I need to know which registers I'm supposed
> to preserve and which can be trashed.
> I believe I can trash EAX (function return result),
> ECX and EDX, but I want to make sure.

Yes, you are right (for a common case).
I guess that you can trash everything in GCC inline asm
statements (of course then you need to tell GCC to save
registers it needs), though I'm not sure.

-- 
Regards,
Konstantin



