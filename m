From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: Question regarding EIP instruction pointer
Date: Fri, 30 Mar 2007 09:14:08 -0700
Message-ID: <1175271248.10936.22.camel@localhost>
References: <BAY133-F973CAE742E785B38E9E08F5630@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <BAY133-F973CAE742E785B38E9E08F5630@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: A D <a_d_249@hotmail.com>
Cc: leslie.polzer@gmx.net, linux-assembly@vger.kernel.org

On Fri, 2007-03-30 at 10:29 -0400, A D wrote:
> leslie.polzer wrote:
> >In order to execute the current instruction, the CPU must determine its
> >format, which also means finding out how many bytes the command takes.
> >
> >Next command is at eip+sizeof(command).  Of course, this only holds for
> >subsequent execution, branching is another thing.
> 
> Thanks for your insight. You mentioned the process is different for 
> branching.                     Is it possible to explain a little(I'm a bit 
> curious)?
> 

Here are some instructions from an assembly language program:
  30 0009 803B00   cmpb    $0, (%ebx)      # at null character?      
  31 000c 7410     je      getResp         # yes, get response    
  32              	
  33 000e 6A01     pushl   $1              # no, send one byte    
  34 0010 53       pushl   %ebx            #    at this location  
  35 0011 6A01     pushl   $STDOUT         #        to screen.    
  36 0013 E8FCFFFF call    write
  36      FF
  37 0018 83C40C   addl    $12,%esp
  38              	
  39 001b 43       incl    %ebx            # increment pointer    
  40 001c EBEB     jmp     queryLoop       # check at top of loop 
  41            getResp:
  42 001e 6A01     pushl   $1              # read one byte

The first column is the line number of the original source code. The
second column is the relative (from beginning of this function) address
of the instruction, in hex. The third column is the machine language of
the instruction, also in hex. The remaining stuff on the line is the
original assembly language source code that I wrote.

Look at the instruction on line #31, je getResp. The machine code for je
is 0x74. The second byte of this instruction is the distance, in bytes,
of the jump if it takes. (je means "jump if equal"; more precisely, it
will jump if the zero flag in the eflags register is true (one).)

Now, assume that this function begins at 0x1000. If the eip contains
0x100c, the CPU will fetch the byte at this address and automatically
add one to the eip so that it now contains 0x100d. The 0x74 tells the
CPU that it needs to fetch one more byte. So it fetches the 0x10 and
dutifully increments the eip so it now contains 0x100e.

Next, the CPU executes the instruction. If the jump should not be taken,
the eip is all set with the address of the pushl $1 instruction on line
#33.

However, if the jump should be taken, the CPU adds 0x0010 (the second
byte that it fetched when dealing with this instruction) to the value in
the eip. That gives 0x101e in the eip. If you look at the code above,
you will see that this is the address of the getResp label in line #41.
This label is on a line by itself so takes up no memory. Effectively,
getResp applies to the instruction on line #42, which you can see is at
memory address 0x101e.

Hope you are able to follow this explanation. The main thing to keep in
mind is that computers are very stupid. They can only do very simple
things. The reason they are so useful is that they do LOTS of very
simple things in a VERY short period of time.


