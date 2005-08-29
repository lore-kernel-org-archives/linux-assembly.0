From: Fernando Ibanez <fibanez@access.k12.wv.us>
Subject: Re: Graphics for Assembly Language Program
Date: Mon, 29 Aug 2005 14:11:47 -0400
Message-ID: <20050829141147.R21454@access.k12.wv.us>
References: <0D544207876CDA428F17DD7EA448C192088AAF@bailey.DOMAIN.KSNINC.PVT>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0D544207876CDA428F17DD7EA448C192088AAF@bailey.DOMAIN.KSNINC.PVT>; from lblake@ksninc.com on Thu, Aug 25, 2005 at 12:59:49PM -0700
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

On Thu, Aug 25, 2005 at 12:59:49PM -0700, Landon Blake wrote:
> I'm think about creating a simple computer language that I will write
> with assembly language and I was curious about something.
> Is it possible to access the X-Window System from assembly language? Is
> there a way to call c functions from Assembly language? What is the
> other alternatives to providing graphics functions to a computer
> language written in assembly? Working directly with the graphics card
> and keyboard/mouse sounds kind of nasty. Is that the other route? Has
> anyone successfully used a graphics library like GTK from assembly?

Hi, 
Another option would be to use assembly to access SDL.  I know some 
4K demos use this.  I believe you can get the source code of a
4K demo called "Yellow Rose of Texas" where they use this technique.
Just google for "4K demo yellow rose of texas"




