From: "Jason Roberts" <v3ct0r99@hotmail.com>
Subject: ring0 access
Date: Thu, 09 Oct 2003 12:05:28 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Law9-F94Tyj6iZkxUWZ0001a9fb@hotmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

I have a desire: switch cpu context to real mode from pm
I have written really cool music that works through BIOS--
unfortunately, the only way I can get it to work is through
a bootsector,i.e.hook code before OS boots--
is there any way at all possible to use interrupts, set up my own
handlers, or do any real direct hardware access through
32-bit mode,i.e. while in running KDE or Gnome???
Appreciate any advice...what would really be nice is
a cool set of functions like : enter_ring0() ... back_to_pm()
Thankyou,
Paul

_________________________________________________________________
High-speed Internet access as low as $29.95/month (depending on the local 
service providers in your area). Click here.   https://broadband.msn.com

