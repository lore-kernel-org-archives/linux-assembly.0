From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: how can I have access to the memory as in flat mode?
Date: Sun, 23 Jun 2002 17:13:51 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D15E5AF.5010706@eprocess.fr>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org


Hi,

few days ago, i posted mails to try to know better about linear memory 
in linux.
perhapse you've already answer me, but I could'nt see mails from the list...
So, I managed to make my prog work by using /dev/mem
it's very ugly, but it worked.

Is there any other way to access somewhere?
In fact the exact problem is:

on a embeded system, the mac-adress of  eth0 and eth1 are stored in a 
flash memory, mapped somewhere.
The 'standard' driver (natsemi) doesn't know this, and try to access to 
the 'normal' pci network card.
So, i have to read the mac adress by hand, and modify the value returned 
by the 'standard' driver.

I know the adress, but I've got seg-faults when trying to access it from 
the driver (readb, (unsigned char*)0xf8000, ...)

any help?

Fred

