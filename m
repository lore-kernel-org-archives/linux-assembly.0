From: James Colannino <james@colannino.org>
Subject: Question about GCC and stack
Date: Sun, 11 Sep 2005 23:50:43 -0700
Message-ID: <43252543.2060401@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Hey everyone.  First off, I just wanted to say hi as this is the first 
time I've posted to this list.  I've been subscribed for a while and 
have been archiving the messages, but haven't said anything because I 
haven't really begun to get started in Assembly until recently.  Now 
that I'm posting you can expect more messages from me in the future :)  
Hopefully I won't be too annoying ;)

That being said,  I have some questions regarding the way GCC handles 
the stack when it initializes a function.  Consider the following code 
(AT&T syntax; output from gcc -S sourcefile.c):

pushl   %ebp
movl    %esp, %ebp
subl    $8, %esp
andl    $-16, %esp
movl    $0, %eax
subl    %eax, %esp
leave

This was generated from an empty main() function initialized like so:

sourcefile.c:

int main() {
}

I understand that GCC, at least under Linux, has an unusual way of 
entering into a function (which, as I understand, is why it doesn't use 
the enter instruction.)  I'm trying to figure out exactly what's going 
on here in detail.  I can piece together some things but am having 
trouble understanding this conceptually.   I know that esp points to the 
top of the stack.  I also see that first the value in ebp (the first 
instruction) is being pushed onto the stack, which I'm guessing has 
something to do with the program creating an activation record (I know 
very little about activation records however.)  But, I don't know what 
the register ebp is for.  I googled around and found that it is "used on 
intel CPU's to store the Stack Frame Pointer (sometimes called the Base 
Pointer), " but then I have no idea what the stack frame pointer is, so 
that wasn't of much help to me.  I then see that the value esp is being 
copied to ebp.  I'm not quite sure what that does, probably in part 
because I don't know what the stack frame pointer is or what it's for.  
Is it copying the address of the top of the stack ebp?  Why?  I then see 
that the instruction "subl $8, esp" subtracts 8 from the top of the 
stack's address.  I'm not sure however why this is done.  I have no idea 
what the andl instruction is for other than it ANDs the bits (I'm very 
fuzzy on my understanding of bits.)  I know it's used to mask bits out, 
but again, I'm not sure why this would need to be done here.  The last 
two instructions before "leave" looks like they return a default integer 
value of 0, which I'd expect GCC to do.

I hope these questions aren't too stupid or uneducated.  I'm just 
beginning and have a lot to learn.  If you don't mind endulging a 
curious mind's questions I'd be very grateful :)  Thanks very much in 
advance.

James

-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/

"You can only find truth with logic if you have already found truth without it." --G. K. Chesterton

