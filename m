From: xlp <xlp@emtel.net.co>
Subject: shellcode
Date: Mon, 24 Jun 2002 00:18:39 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020624001839.H342@nietzsche>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

hi, i am reading a doc about buffer overflow, and i have some questions, check
+this c code:
char bsdshell[] = "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f"
                  "\x62\x69\x6e\x89\xe3\x50\x53\x50\x54\x53"
                  "\xb0\x3b\x50\xcd\x80";
int main() {
        void (*s)()=(void *)bsdshell;
        s();
}
If i run it, it executes a shell. I'd like to know in what does bsdshell
+contain?, What is it? hexadacimal? how can i get that?, acording to the doc,
+it's the execve for /bin/sh.


