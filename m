From: Lope De Vega <lope.vega@yahoo.com>
Subject: how to return a pointer to pointer
Date: Sat, 6 Oct 2007 04:28:15 -0700 (PDT)
Message-ID: <414158.21344.qm@web45509.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi list!

I'm wondering how do you guys use to do when you need
to return a pointer to a pointer from within a
function?

if I use local storage it get's swept out during
function's return.

I've though on pushing $0 onto the stack after or
before such a function's arguments, so I could either
store on it during this function's execution and then
moving it to eax at it's end so it will be visible

Any hints or comments?

Thanks.




       
____________________________________________________________________________________
Be a better Globetrotter. Get better travel answers from someone who knows. Yahoo! Answers - Check it out.
http://answers.yahoo.com/dir/?link=list&sid=396545469

