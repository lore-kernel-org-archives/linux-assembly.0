From: theguest <theguest@ono.com>
Subject: Basic assembly
Date: Mon, 11 Nov 2002 01:01:31 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20021111000131.GA9775@theguest.homelinux.net>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hi!
First of all, I'm spanish so sorry for my bad english.
I'm new on the list and I'm a novice in assembly. I'm interested in
linux assembly because I'm interested in linux security, buffer
overflows...
So, I'm reading the "Smash the stack for fun and profit" and the results
that Aleph get are different from mine.
For example he has this code in C:
-------------
void function(int a, int b, int c){
	char buffer1[5];
	char buffer2[10];
}
void main(){
	function (1,2,3);
}
-------------
He gets linux assembly code using gcc:
$ gcc -S -o example1.s example1.c

He says his assembly code has a line like:
subl $20,%esp
He says the memory is reserved multiples of "word". He says word=4bytes.
So our 5 bytes buffer needs 2 words = 8 bytes and buffer2[10]->12bytes.
That's why uses subl to get 20 bytes from esp. That seems correct for
me but when I compile it in assembly using gcc I don't get the same
assembly code...
For example:
	subl $8,%esp
	addl $-4,%esp
in the main function 
and in the function <function>:			
	subl $40,%esp
Why are my code reserving other quantity of space for variables?
It's something related with optimizated compilation in gcc?
Thanks in advance and sorry if something isn't correct in my first email
to the list.
