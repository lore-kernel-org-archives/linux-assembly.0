From: Mateusz Srebrny <ms189442@students.mimuw.edu.pl>
Subject: interupts...
Date: Mon, 23 Sep 2002 15:04:42 +0200 (CEST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0209231456470.21172-100000@zodiac.mimuw.edu.pl>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hi!

This question is out of concern of this group (I think).
But...

Does proccessor (somehow) know if an interrupt it gets was hard- or soft- 
ware generated? I mean if hard disk finishes for example his asynchronous 
IO operation it generates the disk interrupt. But if I want something from 
the disk I do it all the same... 

Is there the same int-handler for hardware and for software, but the 
execution differs by means of some parameters? Or there are two separate 
interrupt accidentally called by the same number?

Thanks for any help...
	Mateusz Srebrny

