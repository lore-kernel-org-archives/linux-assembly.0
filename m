From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Newbie Question
Date: Thu, 24 Oct 2002 16:43:57 -0700 (PDT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <15800.34237.222111.810279@eidolon.muppetlabs.com>
References: <200210241742.35488.davidkedrosky@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200210241742.35488.davidkedrosky@rogers.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> Here's my problem..  NASM only lets me move the string into a 32-bit
> register.

Please note that the register does NOT contain the string -- just a
POINTER to the string (i.e., its memory address).

> BUT I was wondering how it is possible to push BX instead.  Does BX
> also hold the string in this case, considering the size of the
> string it isn't that big?

The size of the POINTER has no relationship to the size of the
string. (If I give you a street address, like 1148 23rd Ave. S, you
have no way of telling from that address if the house is big or
small.)

> If not, is there a way to put the contents of EBX (the string) into
> BX?  For the time being I would like to just deal with 16-bit
> registers because it is easier to follow along with the book I am
> using.

Then perhaps you need a different book.

Imagine an airplane pilot climbing into the cockpit of a 747 and
asking how he can use a propeller instead of a jet engine, because he
doesn't need to fly very far, and the flying instructions he was given
was for an airplane with a propeller. What odds would you give that
that pilot is going to be able to get to the runway, much less off of
it?

b
