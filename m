From: chris@luethy.net
Subject: packed bits question
Date: Tue, 15 Nov 2005 21:21:01 -0800 (PST)
Message-ID: <38657.67.182.183.189.1132118461.squirrel@mail.luethy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hello all,
        I have an assignment that requires me to write a simple database
in assembly using Linux (GNU as, GNU ld, etc.).
        I have to store IDs and their corresponding values, but the
requirement (and this is why I need help) is that the IDs are 8
bits each, followed immediately by 6 bits (six!) for the value,
then, without padding two bits, the next data entry follows (8
bits again for another ID, 6 bits for the next value, and so on).
        I have initialized the DB in a C function (initialize implies the
8 bits for each ID is set to 0xFF (-1)) but now in an assembly
routine I need to search for IDs that are -1. Obviously for the
first ID it is simply the first byte, but how do I access the
second, third, fourth, etc. IDs easily?
        Basically, how can I easily work with something as bastardly as a
14-bit, no-packing data pairs?

Thanks for all your help,
Chris Thielen

