From: Philip Jacob Smith <pj@evobsyniva.com>
Subject: Re: Orphaned Processes and TCSETSW
Date: Sun, 19 Oct 2003 15:50:25 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <oprxa2qb0ob2epmx@localhost>
References: <3F902542.705ADCA4@yahoo.co.uk> <oprw7idjuab2epmx@localhost> <3F92B6E9.BF7360A8@yahoo.co.uk>
Reply-To: pj@evobsyniva.com
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3F92B6E9.BF7360A8@yahoo.co.uk>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

> my solution, not at all perfect, but at least providing some last
> resort, is the aequivalent to <stty sane> coded into the final clean-up
> procedure plus, a (sort of) switch by which that part could be
> dis-abled, at runtime.
> at least, it returns the keyboard in an accessible state and, it's
> results are something which can easily be managed w. the standard tools.

I tried a few perl scripts...  (I'm retying these from memory, so if I forget a semicolon and perl won't accept them, forgive me.)

if (fork == 0) {
	sleep 1;
	`stty sane`;
};

For those who don't know perl, this script forks, then if it's the child, it sleeps for a second then executes the command 'stty sane', or if it's the parent, it'll just exit.

This script causes the error.  You'll see stty complain about an I/O error.

So I went back to the softer source and coded it so that when it does the final equivelent of 'stty sane' it first opens /dev/tty4 and does it on the file descriptor there, thinking maybe a new open might clear up the problem, but that didn't work, the error occoured even with the new file handle.

So I went back to perl and tried this:

if (fork == 0) {
	if (fork == 0) {
		if (fork == 0) {
			sleep 1;
			`stty sane`;
		};
	};
} else {
	sleep 4;
};

That's probably more forks than are necissary, but anyway this script works.  If you comment out the 'sleep 4' then it stops working.

This made me think that maybe it was failing because a process was reading from stdin, so I tried this script.

if (fork == 0) {
	if (fork == 0) {
		if (fork == 0) {
			sleep 1;
			`stty sane`;
		};
	};
} else {
	<>;
};
	
In perl, <> will read a line from standard input.

This script had no problems, so it's not reading from stdin that does it.  So then I tried this.

if (fork == 0) {
	if (fork == 0) {
		if (fork == 0) {
			sleep 3;
			`stty sane`;
		};
	};
} else {
	sleep 1;
	`stty raw`;
	sleep 4;
};

This script didn't have any problems either.

So now I'm thinking maybe it's bash, or that readline library it uses.  So I try a few other shells, they all do it too.  Then I take the first script, lengthen it's sleep time to 5 seconds, then after running it I execute 'sleep 10' before it gets around to doing the stty command, so that bash won't be reading the keyboard when it does the stty command.  This still causes the error.  So this makes me think that it's probably not the shell.

So I'm lost at this point.  As best I can tell, the problem occours when you have a parent-child chain like

shell -> process_1 -> process_2 -> process_3 -> process_4 -> process_5

and any process 2 or greater tries to modify terminal settings when process_1 has already exited.
There's no problem if process 3 or greater does the same after process 2 has exited, but rather the whole chain can do whatever it wants so long as process_1 hasn't exited, and once it has, none of them can do anything, regardless of which others have or haven't exited.

Interestingly, if I start another shell by typing 'bash', it now works as if the new bash is 'shell' in the above diagram, even though it's 'process_1'.  So I don't think it's something to do with who opened that particular TTY first.

So I guess that either bash (or the readline libaray) is making a system call after exit to cause this to happen, or when bash starts up it makes one system call to make this happen automatically.

So I tried one of the scripts that fail, but ran it like this:

	./fork_test.pl | sleep 5

This way it works just fine.  So I'm thinking maybe it's bash making a system call.

Doing an strace on bash, I see it make an ioctl 0x5410, which turns out to be TIOCSPGRP.  As best I can tell, this has something to do with changing the process group of the controlling terminal, or something like that.

So I go to console number 4, and type this:

stty raw -echo < /dev/tty1

Then I switch over to console 1, and sure enough, it did just what it was supposed to.

So it seems that it's not that Softer isn't in the process group, but that it was at one time in the process group, and isn't any longer.

So then I make softer call setsid to make it's own process group.  This fixes the problem, but now we have the problem you described before, as bash saves the incorrect settings when gpsmap exits, then softer fixes them, but of course when bash later goes to restore them, they're incorrect again.  All that trouble for something that didn't even work...

I also noticed that if softer is executed from the shell, it's setsid call fails, which I guess means that softer is the process group leader, not the shell.  So I guess once the process group leader is dead, none of it's child processes can change the terminal settings.

Anyway, I guess I could just make gpsmap execute softer with gpsmap on it's command line, so that softer will start gpsmap and the processes will be lined up in the right order.  It's odd how obvious solutions like this completly slip my mind until I've come to realize that the way I wanted to do it is impossible.  The thought didn't cross my mind until I was typing "when bash later goes to restore them..."

Thanks for helping out, I had pretty much given up until I read that you were writing code to try to help.

 - Pj

