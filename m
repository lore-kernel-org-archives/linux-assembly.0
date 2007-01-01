From: Claudio Fontana <sick_soul@yahoo.it>
Subject: Re: GAS colorr pixel problem
Date: Sun, 31 Dec 2006 18:36:41 -0800 (PST)
Message-ID: <604042.9933.qm@web26005.mail.ukl.yahoo.com>
References: <d93f04c70612311043m566927f5n37123b480668837c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <d93f04c70612311043m566927f5n37123b480668837c@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hendrik Visage <hvjunk@gmail.com>
Cc: linux-assembly@vger.kernel.org


Hello,

--- Hendrik Visage <hvjunk@gmail.com> wrote:

> I believe you'll
> find code snippets etc. on using it inside Linux in
> both SVGAlib and X, but
> sometimes the "problem" might be that you'll need to
> do a realmode BIOS call
> (yuck) to get things initialized... correct me if
> I'm wrong here...

Source code of SVGAlib shows how it is done.

>  SDL:
> I'm sometimes surprised on how long this has
> survived!! 

I am not. SDL is likely to stay.
OpenGL is not a replacement for SDL, they are
different things.
You can use both, and typically this is what happens
for graphic-intensive 3D games (for example
Neverwinter Nights, or UT-200x).

> However, X consists of a protocol (There is/was an
> O'Reilly book out
> in a series of X that described that protocol fairly
> in depth...) 

http://www.sbin.org/doc/Xlib/

Happy new year,

Claudio


__________________________________________________
Do You Yahoo!?
Poco spazio e tanto spam? Yahoo! Mail ti protegge dallo spam e ti da tanto spazio gratuito per i tuoi file e i messaggi 
http://mail.yahoo.it 
