From: Daniel Souza <thehazard@gmail.com>
Subject: Re: __asm__
Date: Tue, 29 Mar 2005 21:29:28 -0800
Message-ID: <e1e1d5f40503292129c39c2c3@mail.gmail.com>
References: <20050328044442.52470.qmail@web52909.mail.yahoo.com>
Reply-To: Daniel Souza <thehazard@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20050328044442.52470.qmail@web52909.mail.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: linux-assembly@vger.kernel.org

Yes, it means that the compiler will consider the asm instructions as
literal, and they will not be changed by compiler (either
instructions, optimization or bytecodes orders)

-- 
# (perl -e "while (1) { print "\x90"; }") | dd of=/dev/evil
