From: James Colannino <james@colannino.org>
Subject: More about stacks
Date: Wed, 14 Sep 2005 14:14:53 -0700
Message-ID: <432892CD.3090907@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

First, I just wanted to ask and see if anyone here on the list has any 
reading recommendations to help me understand the stack in detail as 
well as the details about how memory is addressed and interacted with 
via 386 32-bit protected mode.

The question I wanted to ask the list was that I know when you want to 
expand the stack to make room for more data (particularly when you're 
setting up local variables in C) you simply do a sub on %esp, but my 
question is, how do you know when you do this that you aren't violating 
data from some other process, or maybe even data belonging to other 
sections of your code, .data for example.  Thanks :)

James
