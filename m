From: m_hrebien@wp.pl
Subject: gas' nop(s)
Date: Sun, 04 Aug 2002 22:28:47 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D4D8E7F.8A393F62@wp.pl>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi there,

did You noticed that GNU as adds some padding nop(s) like:

lea (%esi),%esi
mov %esi,%esi
nop

at the end of .text section? Is this really necessary? The .text section
mustn't be padded to 4 like it seems to be or am i wrong? How can i
avoid this? Is there any gas option to switch this off?

Sorry if this topic is doubled by me but i couldn't find something
similar in the archive :(

-- 
Maciej Hrebien

