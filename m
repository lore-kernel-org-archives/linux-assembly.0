From: "pei lin" <telent998@gmail.com>
Subject: questions about linux termios
Date: Mon, 14 Jul 2008 23:08:11 +0800
Message-ID: <d6b7c4190807140808p718c7ea9je4269e2f64304d04@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-console-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=MImKrI20ydNC/E9CdcQB7ujq7rDVPAV8VBZHtU17H9E=;
        b=RDuv7+tR2ZuGW+qLj+Gv65Uiraz0LHUhSUYrbiPUnxb1cHph2Rmmg0vuaSZLR1ddaj
         9vraLgPHV41Dbwis3NTmfjQ0aBmaJOgGlD23FVeSvr9lDzdZthP3RYQLpZ2xlfvEloqg
         sRG1E4BgwghDElOeGMo71Lgl27SZtqxdfpwKU=
Content-Disposition: inline
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-console@vger.kernel.org
Cc: linux-assembly@vger.kernel.org

Hi,buddy
  I am puzzled by the linux termios.
   First Question about /dev/tty0 and /dev/tty,this two devices is
the same one?
   When i am in X terminal,as /dev/pts/0 , i do "echo hello >
/dev/pts/0 and echo hello > /dev/tty ", they return the same like that
"hello" on the screen .This means /dev/tty ->/dev/pts/0? But "echo
hello > /dev/tty0",there is nothing on the screen.And when i go to
Init 3 mode ,like /dev/tty1,when i do "echo hello > /dev/tty1 and echo
hello > .dev/tty and echo hello > /dev/tty0" ,They return the same all
print hello on the screen.Do they all point to the /dev/tty1?

   The second Question is that i write a small program to get
keyboard input like below.When i run it in X terminal ,when i press
keyboard it can return but can not get the press and release event.And
in the console,like tty1,it doesn't work .i don't know why.

file : get_keyboard.c

#include <stdio.h>
#include <linux/keyboard.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <linux/kd.h>
#include <termios.h>
#include <unistd.h>
int main()
{
       int fd,len,i;
       struct kbentry entry;
       unsigned char buf[64];
       struct termios  ts,old_ts;
       char * path;
       path = ttyname(0);
       printf("%s!\n",path);
       fd = open(path, O_RDONLY|O_NOCTTY);
       if(fd < 0){
               printf("open the device error!\n");
       }

       printf("fd --- %d!\n",fd);

       if (ioctl( fd, KDSKBMODE, K_RAW ) < 0) {
                       printf("set mode wrong!\n");
       }


       tcgetattr( fd, &old_ts );


          ts = old_ts;
    ts.c_cc[VTIME] = 0;
    ts.c_cc[VMIN] = 1;
    ts.c_lflag &= ~(ICANON|ECHO|ISIG);
    ts.c_iflag = 0;
    tcsetattr( fd, TCSAFLUSH, &ts );

    tcsetpgrp( fd, getpgrp() );


          entry.kb_table = K_NORMTAB;
    entry.kb_value = 0;

       while(1){
               len=read(fd,buf,64);
       printf("len ========= %d!\n",len);
               for(i =0; i < len;i++){
                       entry.kb_index = buf[i];
                       if(ioctl(fd,KDGKBENT,&entry)){
                       printf("struct entry :%d %d
%d\n",entry.kb_table,entry.kb_index,entry.kb_value);
                       if('2' == entry.kb_index){
                               tcsetattr( fd, TCSAFLUSH, &old_ts );
                               exit(0);
                          }
                       }
                                     }
               }
}
