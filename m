From: "Andrew Haydon" <andrew_s_haydon@hotmail.com>
Subject: Using gcc to compiler assembly
Date: Sat, 02 Nov 2002 23:08:46 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <F31en0bcaQUXPXF2aZc0000966c@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----=_NextPart_000_4f0d_7fff_7f14"
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
To: linux-assembly@vger.kernel.org

This is a multi-part message in MIME format.

------=_NextPart_000_4f0d_7fff_7f14
Content-Type: text/plain; format=flowed

Gurus,

How to use GCC compiling assembly codes? I attached my example code and 
tried gcc -c -o foo.o foo.S. This line "typedef foo_bar_t int;" choked. I 
read the Makefiles for linux kernel and still could not understand how these 
assebmly codes were compiled by GCC.

Thanks in advance,

Andrew




_________________________________________________________________
Unlimited Internet access -- and 2 months free!��� Try MSN. 
http://resourcecenter.msn.com/access/plans/2monthsfree.asp

------=_NextPart_000_4f0d_7fff_7f14
Content-Type: application/octet-stream; name="foo.h"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="foo.h"

I2lmbmRlZiBGT09fSAojZGVmaW5lIEZPT19ICgp0eXBlZGVmIGZvb19iYXJf
dCBpbnQ7CiNkZWZpbmUgRk9PX0JBUiAxMDAKCiNlbmRpZgo=


------=_NextPart_000_4f0d_7fff_7f14
Content-Type: application/octet-stream; name="foo.S"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="foo.S"

I2luY2x1ZGUgImZvby5oIgoKLnRleHQKCW1vdmwJJCBGT09fQkFSLCAlZWF4
Cgo=


------=_NextPart_000_4f0d_7fff_7f14--
