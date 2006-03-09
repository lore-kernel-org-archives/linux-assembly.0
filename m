From: "Martin Fflores" <abebex17@hotmail.com>
Subject: PS/2 Mouse
Date: Thu, 09 Mar 2006 22:42:04 +0000
Message-ID: <BAY14-F23AC99099DE8349B422488D0EC0@phx.gbl>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

im just beginner, and im trying to make a PS/2 mouseInterface; my problem 
now is this
int EnabledDataReporting()
	{
          DiseableKeyBoard();
          do
          {
          WriteMouse();
          asm("outb %%al,$0x60;": :"a"(EnabledDataReport));
          }while(!IsCommandAcepted());
    /*      asm("outb %%al,$0x60;"::"a"(0xf4));//forzar datareporting*/
          EnabledKeyBoard();
          return TRUE;
       };
as you see i most to demand with the line between /* */, if i dont include 
this line , my mouse just stop  to sending signals(or what ever it sends :D  
) EnabledDataReport is 0xf4 but when i include the line 9
everything does fine,so my question is what i making wrong??? why if i put 
0xf4 instead ENabledDAtaReport it work.

Take Folks

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/

