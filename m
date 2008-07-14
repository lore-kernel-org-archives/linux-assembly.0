From: Frederic Marmond <fmdp@free.fr>
Subject: Re: questions about linux termios
Date: Mon, 14 Jul 2008 20:38:36 +0200
Message-ID: <200807142038.36967.fmdp@free.fr>
References: <d6b7c4190807140808p718c7ea9je4269e2f64304d04@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-console-owner@vger.kernel.org>
In-Reply-To: <d6b7c4190807140808p718c7ea9je4269e2f64304d04@mail.gmail.com>
Content-Disposition: inline
Sender: linux-console-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: pei lin <telent998@gmail.com>
Cc: linux-console@vger.kernel.org, linux-assembly@vger.kernel.org

Hi,=20
first question:
/dev/tty is the CURRENT terminal, wherever you are, and tty0 is the fir=
st one.
So, echo "foobar" > /dev/tty will always display "foobar" on your curre=
nt=20
terminal.
second question: no time right now, maybe latter...

=46red

Le Monday 14 July 2008 =E0 17:08, pei lin a =E9crit=A0:
> Hi,buddy
>   I am puzzled by the linux termios.
>    First Question about /dev/tty0 and /dev/tty,this two devices is
> the same one?
>    When i am in X terminal,as /dev/pts/0 , i do "echo hello >
> /dev/pts/0 and echo hello > /dev/tty ", they return the same like tha=
t
> "hello" on the screen .This means /dev/tty ->/dev/pts/0? But "echo
> hello > /dev/tty0",there is nothing on the screen.And when i go to
> Init 3 mode ,like /dev/tty1,when i do "echo hello > /dev/tty1 and ech=
o
> hello > .dev/tty and echo hello > /dev/tty0" ,They return the same al=
l
> print hello on the screen.Do they all point to the /dev/tty1?
>
>    The second Question is that i write a small program to get
> keyboard input like below.When i run it in X terminal ,when i press
> keyboard it can return but can not get the press and release event.An=
d
> in the console,like tty1,it doesn't work .i don't know why.
>
> file : get_keyboard.c
>
> #include <stdio.h>
> #include <linux/keyboard.h>
> #include <sys/ioctl.h>
> #include <fcntl.h>
> #include <linux/kd.h>
> #include <termios.h>
> #include <unistd.h>
> int main()
> {
>        int fd,len,i;
>        struct kbentry entry;
>        unsigned char buf[64];
>        struct termios  ts,old_ts;
>        char * path;
>        path =3D ttyname(0);
>        printf("%s!\n",path);
>        fd =3D open(path, O_RDONLY|O_NOCTTY);
>        if(fd < 0){
>                printf("open the device error!\n");
>        }
>
>        printf("fd --- %d!\n",fd);
>
>        if (ioctl( fd, KDSKBMODE, K_RAW ) < 0) {
>                        printf("set mode wrong!\n");
>        }
>
>
>        tcgetattr( fd, &old_ts );
>
>
>           ts =3D old_ts;
>     ts.c_cc[VTIME] =3D 0;
>     ts.c_cc[VMIN] =3D 1;
>     ts.c_lflag &=3D ~(ICANON|ECHO|ISIG);
>     ts.c_iflag =3D 0;
>     tcsetattr( fd, TCSAFLUSH, &ts );
>
>     tcsetpgrp( fd, getpgrp() );
>
>
>           entry.kb_table =3D K_NORMTAB;
>     entry.kb_value =3D 0;
>
>        while(1){
>                len=3Dread(fd,buf,64);
>        printf("len =3D=3D=3D=3D=3D=3D=3D=3D=3D %d!\n",len);
>                for(i =3D0; i < len;i++){
>                        entry.kb_index =3D buf[i];
>                        if(ioctl(fd,KDGKBENT,&entry)){
>                        printf("struct entry :%d %d
> %d\n",entry.kb_table,entry.kb_index,entry.kb_value);
>                        if('2' =3D=3D entry.kb_index){
>                                tcsetattr( fd, TCSAFLUSH, &old_ts );
>                                exit(0);
>                           }
>                        }
>                                      }
>                }
> }
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assem=
bly"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--
To unsubscribe from this list: send the line "unsubscribe linux-console=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
