From: etienne deleflie <eyem@lalila.net>
Subject: de- interleaving
Date: Thu, 22 May 2003 10:06:52 +1000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3ECC149C.9030801@lalila.net>
References: <Law14-F41S2TRqf69aZ0002af02@hotmail.com>
Reply-To: eyem@lalila.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Law14-F41S2TRqf69aZ0002af02@hotmail.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Here's an other way to enlarge your penis .... help me with this.

I'm on intel P4.

I have a video stream arranged in YUV422 ....which is [Y U Y V] [Y U Y 
V] [Y U Y V]  ..... ([] = 32 bits)

I want to extract this into 2 streams :
[ Y Y Y Y] [ Y Y Y Y] [ Y Y Y Y]
[ U V U V] [ U V U V] [ U V U V]

which basically means I have do de-interleave the first stream into 2.

I see there is an MMX instruction that does the exact opposite:
PUNPCKHBW ............  "unpack and interleave"

anyone have any idea what the (MMX ?) instruction might be (or if it 
exists .... I cant find it in the intel manual (which is 900 pages 
long...urgh))

etienne
.

