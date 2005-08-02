From: TheReader06@comcast.net
Subject: Re: Executing memory mapped files
Date: Tue, 02 Aug 2005 18:11:30 +0000
Message-ID: <080220051811.22540.42EFB751000E44690000580C2202888744C0CF9D0A0B0E0AAD0A08AB@comcast.net>
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: STROEBEL NJ <stroebelnj@hotmail.com>, linux-assembly@vger.kernel.org

Here's a piece of a program I wrote to do that..  (So if it doesn't compile, that's why ;)

Also note that it's a flat binary it runs, not an ELF or aout format executable..

test5.c:
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

int
main(int argc, char *argv[])
{
        int inf, infLen;
        void *code;
        void (*func)();

        if (argc != 2)
        {
                printf("Usage: %s <input file>\n", argv[0]);
                exit(-1);
        }

        if ( (inf = open(argv[1], O_RDONLY)) == -1)
        {
                printf("Failed to open '%s'..\n", argv[1]);
                exit(-1);
        }

        infLen = lseek(inf, 0, SEEK_END);
        lseek(inf, 0, SEEK_SET);

        code = malloc(infLen);

        if (read(inf, code, infLen) != infLen)
        {
                printf("Failed to read entire file..\n");
                exit(-1);
        }

        close(inf);

        printf("Executing code..\n");
        fflush(stdout);
        func = (void (*)()) code;
        (*func)();

        return (0);
}

Good luck,

Joshua Roys


> 
> Is it possible to load an executable binary (8k) into memory using mmap()
> function ant then executing the binary program in memory.
> 
> I tried something like this in C and it only seemed to load the binary into
> memory. I then tried the  exec family  to execute the binary but nothing
> happened.Maybe in assmebler there is a better method ?
> 
> here is the source:
> 
> 
> #include <unistd.h>
> #include <stdio.h>
> #include <ctype.h>
> #include <fcntl.h>
> #include <string.h>
> #include <malloc.h>
> #include <sys/mman.h>
> #include <sys/stat.h>
> #include <stdlib.h>
> #include <signal.h>
> #include </usr/include/sys/types.h>
> #include </usr/include/sys/stat.h>
> #include <arpa/inet.h>
> #include <netdb.h>
> #include <netinet/in.h>
> #include <sys/types.h>
> #include <sys/socket.h>
> 
> // gcc -o example1 example1.c
> 
> void err_quit(char *msg);
> 
> int main(int argc,char *argv[])
>   {
> 
>     int fdin;
>     char *src,**dh;
>     struct stat statbuf;
>     off_t len;
> 
> 
>     if (( fdin = open("prog1",O_RDONLY)) < 0) //prog1 binary executable file
>       err_quit("open failed");
> 
> 
>     if ((fstat(fdin,&statbuf)) < 0)
>            err_quit("fstat failed");
> 
>     len = statbuf.st_size;
> 
>     if ((src = mmap(0, len,PROT_EXEC,MAP_SHARED,fdin,0)) == (void *)-1)
> 
>               err_quit("mmap failed");
> 
> 
> 
> 
> if (! fork())
>    {
>      int rt;
> 
>   rt = execve(src,src,0);
> sleep(2);
> 
>    }
> 
> sleep(4);
> close(fdin);
> munmap(src,len);
> exit(0);
> 
>   }
> 
> 
> void err_quit(char *msg)
> 
> {
>   perror(msg);
>   exit(EXIT_FAILURE);
> 
> 
> }
> 
> 
> Im using Fedora 3  ,PC: 1MB ram , 3.2 Ghz pentuim.
> Any suggestions ?
> 
> stroebelnj@hotmail.com
> 
> _________________________________________________________________
> Upgrade to MSN Hotmail Plus - your e-mail, your way! 
> http://join.msn.com/?pgmarket=en-xe&DI=1054&XAPID=1816
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
