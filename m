From: "Jim Watters" <macemu@emuunlim.com>
Subject: RE: asm newbie
Date: Sun, 18 Aug 2002 15:42:03 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <000401c246ef$542564a0$7fea2041@quantumstorm>
References: <1029689537.25873.4.camel@storia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <1029689537.25873.4.camel@storia>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi,

Perhaps the best book (actually the only book) I've run across is called
"Assembly Language Step-by-Step: Programming with DOS and Linux" by Jeff
Dunemann. It starts out with a nice system architecture tutorial that
most anyone can grasp, eventually gets into studying 16-bit DOS assembly
and ends off with a few chapters covering 32-bit Linux assembly. The 2nd
edition of the book has a number of (usually minor) errors in it:
http://www.thelinuxgurus.org/assembly.shtml

The good thing about this book is that it covers using the Open Source
assembler NASM (the Netwide ASseMbler) with both DOS and Linux ports in
it's examples. The CD-ROM also includes NASM-IDE and Alink. NASM uses
Intel syntax assembly which might refresh some of your memory:
http://sourceforge.net/projects/nasm  

Linux has the GAS assembler which uses the AT&T syntax of assembly. More
can be read about GAS here:
http://www.linux.org/docs/ldp/howto/Assembly-HOWTO/gas.html

The Art Of Assembly by Randall Hyde is a free assembly programming
manual you can download for Win32, Linux (32-bit) and DOS (16-bit)
assembly. Many good links on his site too: http://webster.cs.ucr.edu/

Have fun,
Jim

Disclaimer: If there are any errors in the above statements, you can
blame it on my lack of knowledge.


-----Original Message-----
From: linux-assembly-owner@vger.kernel.org
[mailto:linux-assembly-owner@vger.kernel.org] On Behalf Of Benjamin
Michotte
Sent: Sunday, August 18, 2002 12:52 PM
To: linux-assembly@vger.kernel.org
Subject: asm newbie


hello,

first, sorry if this mailing-list is not the right one.

Two years ago, I learned "MS-DOS" assembly (I forget it now) and now, I
would like to learn 32 bits unix assembly.

Where can I find a good doc or is there a good book about assembly under
unix and particulary Linux ?

Yours,
Benjamin


