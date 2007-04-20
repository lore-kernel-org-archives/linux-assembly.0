From: "A D" <a_d_249@hotmail.com>
Subject: why overflow flag being set?
Date: Fri, 20 Apr 2007 11:58:44 -0400
Message-ID: <BAY133-F63E64A1F0D134EAE6956AF5560@phx.gbl>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

I've a question about the handling of signed and unsigned numbers by GAS. 
When I
write the following:


    movb $128, %bl
    addb $10, %bl

bl register doesn't overflow and overflow flag is not set. But as soon as I 
use
127 instead of 128 like this:

    movb $127, %bl
    addb $10, %bl

overflow flag is set. Does this mean when i move  a value to a register 
smaller
or equal to the maximum signed value that register can contain, gas treats 
it as
signed number? Thanks.

_________________________________________________________________
Check Out Our List Of Trendy Restaurants. You'll Eat It Up! 
http://local.live.com/?mkt=en-ca/?v=2&cid=A6D6BDB4586E357F!378

