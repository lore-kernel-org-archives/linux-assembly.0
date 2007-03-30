From: "A D" <a_d_249@hotmail.com>
Subject: Re: Question regarding EIP instruction pointer
Date: Fri, 30 Mar 2007 10:29:48 -0400
Message-ID: <BAY133-F973CAE742E785B38E9E08F5630@phx.gbl>
References: <20070330135823.GA5129@wintermute.farpoint>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20070330135823.GA5129@wintermute.farpoint>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: leslie.polzer@gmx.net
Cc: linux-assembly@vger.kernel.org

leslie.polzer wrote:
>In order to execute the current instruction, the CPU must determine its
>format, which also means finding out how many bytes the command takes.
>
>Next command is at eip+sizeof(command).  Of course, this only holds for
>subsequent execution, branching is another thing.

Thanks for your insight. You mentioned the process is different for 
branching.                     Is it possible to explain a little(I'm a bit 
curious)?

_________________________________________________________________
Your Space. Your Friends. Your Stories. Share your world with Windows Live 
Spaces. http://spaces.live.com/?mkt=en-ca

