From: Renuka Prasad <msua_ts@yahoo.com>
Subject: Info On Error
Date: Wed, 20 Apr 2005 00:04:04 -0700 (PDT)
Message-ID: <20050420070404.27344.qmail@web61209.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hi All,
 
    I found the following Error messages while
installing  
planet-lab(based on linux os).Information on the error
is  needed.

ISOLINUX 2.11 2004-08-16 Copyright(C) 1994-2004 H.
Peter Arvin
PlanetLab BootCD 3.0-beta0.1
Loading Kernel.....................
Loading initrd.gz..............................
..............................................
..........isolinux : Disk error 10,AX = 4280, drive EF

Boot failed : Press a key to retry

Action : Pressing a key

ISOLINUX 2.11 2004-08-16 Copyright(C) 1994-2004 H.
Peter Arvin
isolinux : Disk Error 20, AX=4210, drive EF

Boot failed : Press a key to retry

Action : Pressing a Key

ISOLINUX 2.11 2004-08-16 Copyright(C) 1994-2004 H.
Peter Arvin
PlanetLab BootCD 3.0-beta0.1
Loading Kernel.....................
Loading initrd.gz..............................
. 
.
.
.
Buffer i/o error on device device hda, logical block
70677
70678
70679  
 { Incriment interms of 1 }
The following set of lines repeatedly displayed
{
  hda : media error(bad sector) : status=0x51{Drive
Ready SeekComplete Error} 
  hda : media error(bad sector) : error = 0x34
                                          0x55
  end_request : i/o error, dev hda , sector 282776
                                            282780
                                            282784
                                       { Increment
interms of 4 }      
}
The following lines were also displayed without
repeatition

/etc/init.d/pl_sysinit : line 45: 184 bus error
/bin/mount -o ro -t iso9660 /dev/$device /usr 2>&1 >
/dev/null

pl_sysinit : Checking for /usr Contents

Unable to find boot Cdrom 

Pl_sysinit : Bringing network Online

Thanking You,
Renuka Prasad T.G


		
__________________________________ 
Do you Yahoo!? 
Plan great trips with Yahoo! Travel: Now over 17,000 guides!
http://travel.yahoo.com/p-travelguide
