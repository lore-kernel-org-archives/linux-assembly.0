From: "STROEBEL NJ" <stroebelnj@hotmail.com>
Subject: Executing memory mapped files
Date: Tue, 02 Aug 2005 16:38:59 +0000
Message-ID: <BAY7-F2808E06858B3CEE096030CDFC20@phx.gbl>
References: <MC6-F34jriLdElsBt8s003595b5@MC6-F34.hotmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <MC6-F34jriLdElsBt8s003595b5@MC6-F34.hotmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org


Is it possible to load an executable binary (8k) into memory using mmap()
function ant then executing the binary program in memory.

I tried something like this in C and it only seemed to load the binary into
memory. I then tried the  exec family  to execute the binary but nothing
happened.Maybe in assmebler there is a better method ?

here is the source:


#include <unistd.h>
#include <stdio.h>
#include <ctype.h>
#include <fcntl.h>
#include <string.h>
#include <malloc.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <signal.h>
#include </usr/include/sys/types.h>
#include </usr/include/sys/stat.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <sys/socket.h>

// gcc -o example1 example1.c

void err_quit(char *msg);

int main(int argc,char *argv[])
  {

    int fdin;
    char *src,**dh;
    struct stat statbuf;
    off_t len;


    if (( fdin = open("prog1",O_RDONLY)) < 0) //prog1 binary executable file
      err_quit("open failed");


    if ((fstat(fdin,&statbuf)) < 0)
           err_quit("fstat failed");

    len = statbuf.st_size;

    if ((src = mmap(0, len,PROT_EXEC,MAP_SHARED,fdin,0)) == (void *)-1)

              err_quit("mmap failed");




if (! fork())
   {
     int rt;

  rt = execve(src,src,0);
sleep(2);

   }

sleep(4);
close(fdin);
munmap(src,len);
exit(0);

  }


void err_quit(char *msg)

{
  perror(msg);
  exit(EXIT_FAILURE);


}


Im using Fedora 3  ,PC: 1MB ram , 3.2 Ghz pentuim.
Any suggestions ?

stroebelnj@hotmail.com

_________________________________________________________________
Upgrade to MSN Hotmail Plus - your e-mail, your way! 
http://join.msn.com/?pgmarket=en-xe&DI=1054&XAPID=1816

