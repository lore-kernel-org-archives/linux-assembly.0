From: joy merwin monteiro <joy.merwin@gmail.com>
Subject: Re: packed bits question
Date: Wed, 16 Nov 2005 21:50:11 +0530
Message-ID: <4b0d6e0d0511160820i688ddaa6y1290df9fe20b49f@mail.gmail.com>
References: <38657.67.182.183.189.1132118461.squirrel@mail.luethy.net>
Reply-To: joy_mm@ieee.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <38657.67.182.183.189.1132118461.squirrel@mail.luethy.net>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "chris@luethy.net" <chris@luethy.net>
Cc: linux-assembly@vger.kernel.org

Hi,

as Robert said, you could do the assembly equivalent of this macro:

#define GET_BIT(ptr,bitnum)  ptr[(bitnum>>3)]>>(7-(bitnum%8))

Joy

--
Girls are like slugs.... You know they are around for a reason, but
you cant imagine what.
                                                                      
                               -- Calvin
