From: joy merwin monteiro <joy.merwin@gmail.com>
Subject: Re: printf without '\n'
Date: Tue, 25 Oct 2005 21:14:45 +0530
Message-ID: <4b0d6e0d0510250844v68c74d7dy200772332bdb04ab@mail.gmail.com>
References: <20051025151602.GA2904@jehuty.server01.org>
Reply-To: joy_mm@ieee.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20051025151602.GA2904@jehuty.server01.org>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi,
Did you try running the program twice ? the problem is obviously
buffered I/O, \n is (supposed) to flush the buffer. how about

push $0x0
call fflush

this should flush all output streams, (iff Null is passed)

Joy
--
Girls are like slugs.... You know they are around for a reason, but
you cant imagine what.
                                                                      
                               -- Calvin
