From: linuxassembly@evobsyniva.com
Subject: Re: Does anyone code in assembler today?
Date: Thu, 18 Sep 2003 09:00:41 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <oprvo43fxwlmcbdf@smtp-server.woh.rr.com>
References: <200309110801.37516.rafael.diniz@ic.unicamp.br> <200309111414.47716.wklux@yahoo.co.uk> <200309150730.23968.jko@save-net.com> <200309171020.17639.jko@save-net.com>
Reply-To: linuxassembly@evobsyniva.com
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200309171020.17639.jko@save-net.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

> My release of a few days ago resulted in three responses.

Could it be that few people use assembly language debuggers?

I've always been surprised at the number of people who talk about using one 
on this list.  I figured people didn't use them and debugged using other 
methods.  When I first started assembly I used DOS debug to debug things, 
but as soon as I used graphics modes it became useless, and so I learned 
new ways to debug.  Many of my programming mistakes are obvious as soon as 
I run the executable, and so I know exactly what to fix.  Others require 
tossing in a few print-type macro calls so that I can see what code is 
being executed and what isn't (I can leave these in the code, and enable or 
disable the macro when compiling).  Sometimes I use another macro to print 
out a register's contents.  I've got code that prints a register dump, so 
if I need to see a lot of registers I'll just insert a 'cli' or something 
that will segfault.  This code also keeps track of what functions are 
executing in a stack structure and prints it out (also can be disabled at 
compile time) and this about eliminates the need to track execution.  If 
things are really bad I'll write out a section of memory to a file and 
examine it with a hex editor, but that seldom happens.  I've just always 
debugged this way, and it's worked fine.  I really wouldn't know what to do 
with a debugger.

> So.. maybe we are a small community which is difficult to join?

It could be.  Assembly programmers look at my code and freak out over the 
vast number of macro calls and such, and declare it 'not real assembly'.  
Consider that anything to help you get started in assembly language is 
going to be written by these same people.

If you're debugging a piece of code that segfaults, it'll be quite easy to 
do this:

status "first"
mov eax, [ebx]
status "second"
mov edx, [ecx]
status "third"
div dword [ebp+12]
status "fourth"

If you run the code and it prints...

crap:/home/sloop/$ ./program
first
second
Segmentation Fault
crap:/home/sloop/$

...you pretty much know where to look for the problem.  Yet no one likes to 
use macros for anything.  People getting into assembly language are never 
introduced to using macros to simplify programming, and when you can't so 
much as write five lines of code without a mistake (common for beginners) 
adding in more code to debug it will likely just result in even more bugs.  
Beginners need to be encouraged to use macros, at least as a stepping stone 
to help them in the beginning.

But macros are good for everything.

http://www.evobsyniva.com/softer/archive/softer-118.tgz

file: /src/macros.nasm  - 63 macros, without which Softer wouldn't exist at 
all.

9 macros create if/then type statements, 6 for do/loop, and a skip/land 
(just jumps over a block of code) and they almost always produce the same 
code I would have written without them.  There are a couple cases they 
won't, usually I use them anyway because they do one very important thing:  
they keep the code readable.  When you've got a hundred different branches 
in a piece of code, it's impossible to give them all a meaningful label, 
and you can't look at a jump instruction and tell if it goes forwards or 
backwards, and how far.  When you use if/elseif/else/endif, you just follow 
the indenting and there's your answer.

Case in point:  /pjasm/*.asm
I wanted to write these in pure assembly language without any macros just 
for fun.  By the time I was finished I was having a heck of a time 
debugging them because I simply couldn't keep track of how they worked in 
my head.  Lack of indenting and nested code structures makes any 
programming language extremly difficult.  I couldn't follow code I wrote 
ten minutes earlier.

print 2, "yes, this macro does what you think"  -- when you're debugging 
you don't want to have to declare the string here, write code there to do 
the system call, and clean up the mess afterwards.

3 macros that read/write blocks of data fully checking system call return 
values, good for debugging and quick programs you'll only use once, I have 
the same code in functions in a different file if I plan to use it in a 
real program.

enter/leave macros.  These aren't the enter/leave instructions, I couldn't 
figure out what they did, so I made macros with the same name.  They work 
like ' enter "easy.asm - easyprint" ' and just db the string and call a 
function that adds the address of the string to a stack, leave pops the 
address off the stack.  When I get a register dump from a trap macro or a 
system signal, I get this:


Signal 11 recieved.

EAX: 00000000  EBX: 00000002  ECX: 08052455  EDX: 000002D4
ESI: BFFFFC50  EDI: 0805272A  EBP: BFFFFB44  ESP: BFFFFB24
EIP: 08048C30  EFLAGS: 00000000 00000000 00000010 00000110                  
                                                                  ..OD   SZ 
A P C
Debugging Stack:

Softer 0.118
startup.asm
 -- framebuffer check
easy.asm - easyprint
!!! Signal Trap

Happy debugging!

Under the section "Debugging Stack"  "Softer 0.118" is the main.asm file 
that starts the program.  It called startup.asm which was in the middle of 
the framebuffer check when it called easy.asm's easyprint function.  At 
this point a signal 11 was recieved (see top line), and thus we got this 
error message.

It'd have been impractical without macros.  I'd just have a segmentation 
fault message and have to guess where the problem was.

Now to assembly language itself.  Why do we only allow one instruction on a 
line of code?  Take the example below for example.  Once you read the 
contents of the first if section, you basically know what the next three 
do, since you can easily see they're at least almost the same.  Do this one 
instruction on a line and you can't even fit it all on the screen.  You 
also have one long stream of code all of which basically looks the same 
except for a blank line here and there, but like this it has a certain 
shape that can be recognized at sight, making this function easier to find 
in a file.

The third line, all three instructions work towards a single goal, it makes 
sense to group them together.  The fifth line all six instructions select 
the correct video page, makes sense to group them as well.

softer_outof_video
  # Save Softer's video in RAM.
  mov ebx, [display_mode]; shl ebx, 4; add ebx, ram_counts
  if dword [ebx+0], 0, nz
    mov dx, $3CE; mov al, $04; outb; mov dx, $3CF; mov al, $00; outb;
    mov edi, softer_mem_store + $00000; mov esi, [video_ram_pointer]
    mov ecx, [ebx+0]; rep; movsd
  endif
  if dword [ebx+4], 0, nz
    mov dx, $3CE; mov al, $04; outb; mov dx, $3CF; mov al, $01; outb;
    mov edi, softer_mem_store + $10000; mov esi, [video_ram_pointer]
    mov ecx, [ebx+4]; rep; movsd
  endif
 if dword [ebx+8], 0, nz
    mov dx, $3CE; mov al, $04; outb; mov dx, $3CF; mov al, $02; outb;
    mov edi, softer_mem_store + $20000; mov esi, [video_ram_pointer]
    mov ecx, [ebx+8]; rep; movsd
  endif
  if dword [ebx+12], 0, nz
    mov dx, $3CE; mov al, $04; outb; mov dx, $3CF; mov al, $03; outb;
    mov edi, softer_mem_store + $30000; mov esi, [video_ram_pointer]
    mov ecx, [ebx+12]; rep; movsd
  endif
ret

> Of course, the argument is that hardware is getting faster
> and speed is no longer an issue.  Also, memory is cheap
> and big bloated programs are best because they get into the
> market quickly.  It is much easier to train programmers
> in the newer languages and todays tools isolates everyone
> from knowing much about hardware or hex.

I never see large programs (compared to other non-assembly programs) 
written in assembly language.  In it's natural state, assembly isn't well 
suited for large projects.  There's the madness of 10,000 labels I 
mentioned earlier from every single control branch and little temporary 
variable.  Etremely long source files since every operation is broken down 
into 6 steps, each on it's own line.  Any large program has to be split 
into seperate files to be managable (scrolling down 18,000 lines to get to 
the function you're looking for just isn't acceptable), but with NASM, 
every variable shared between files has to be global'd in the one file and 
extern'd in the other, and seeing the associated compiler errors gets old 
after a while, as does starting a new source file and copy&pasting the 
externs over for every shared variable you're going to use.  Worse yet you 
can't global on the same line you declare the variable.

I fixed this kind of with /tools/vernix.pl..  You make your global varibles 
with code line "vernix global_variable" and when compiled, these lines are 
looked for..  The word vernix is macro'd to null so it doesn't affect NASM, 
and a header file is created for each source file which contains global 
statements for each vernix variable in that file, and extern statements for 
each vernix variable in all the other files but that one (if you extern a 
global nasm gets upset).  It works pretty well.

In the end, I've got assembly pretty easy so I can program in it, but the 
problem is that beginners have to go and duplicate all the work I did 
above.  I can see why people would look at assembly and think it's too 
difficult to be worth the effort put into it.

> So.. i wonder if it would be better to port some old DOS
> libraries to work under X or stay with the console?

Stay away from X.  Everyone secretly hates it, it's the only thing that 
makes them have to reboot their linux box.  If you just want to do VGA 
graphics modes Softer contains all the code you need to switch modes in 
src/video.asm, and the stuff you need to do because of this in console.asm, 
switcher.asm, signal.asm, keyboard.asm, ... most the other files.  It's 
complicated, you have to make up for Linux's lack of a VGA driver and do 
all the multitasking of the display device between your program and the 
other programs yourself.  But it's workable, I even figured out all the 
race conditions although one took me like a year.

BTW, I have screenshots now:  
http://www.evobsyniva.com/softer/captures.html  VGA modes in Linux are 
really quite nice, much nicer than GUI windows in X.

 
