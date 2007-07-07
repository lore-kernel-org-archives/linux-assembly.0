From: Henio Paszczak <blurrpp@yahoo.com>
Subject: debugging inline assembler
Date: Sat, 7 Jul 2007 02:33:58 -0700 (PDT)
Message-ID: <555427.48306.qm@web50301.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi.
I'm using in line assembler in g++, and i wont to
debug 
lines in 'asm(....)' unfortunately 'gdb' just skip it.
I compile with 'g++ -gstabs -o prog prog.cpp' and in
'gdb' use 'stepi'. For example in program below 'gdb'
skip nolrmaly to function 'func' and than make
'asm(...)' but i can't see it step by step.


void func(short int* );

int main()
{
    shotr int reg[6];
    func(reg);
    return 0;
}

void func(short int* )
{
    asm(
	"movq -8(%rbp),%rax\n\t"
        .
        .
        .

       );
}

what should i do to see 'asm' instructions ?
( I don't want to use 'external' function because it
makes some problems during compilation )

Lukas


       
____________________________________________________________________________________
Pinpoint customers who are looking for what you sell. 
http://searchmarketing.yahoo.com/
