From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: .unset
Date: Sun, 22 Sep 2002 21:50:15 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D8E1EF7.B8B0EA6B@wp.pl>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi there!

The GAS has the .set directive (or .equ if You like) which defines a
value to use during assembly. My question is how to unset this value to
be not seen in code after this operation (like C's undef). Is it
possible? 

.set xyz, 1

.ifdef xyz
.unset xyz
.endif

"xyz" not seen here!

Something like the example above with the proper ".unset" directive
which i can't find. Maybe there is a different way to do this?

Sorry if this is some kind of redundant question but i really can't
figure out how to do this :(

-- 
Maciej Hrebien

