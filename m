From: HIToC <hitoc_mail@yahoo.it>
Subject: Re: sys_fork
Date: Sun, 27 Nov 2005 19:22:35 +0100
Message-ID: <200511271337.56268.hitoc_mail@yahoo.it>
References: <20051126192634.43926.qmail@web26006.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20051126192634.43926.qmail@web26006.mail.ukl.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Claudio Fontana <sick_soul@yahoo.it>
Cc: linux-assembly <linux-assembly@vger.kernel.org>

Using select(2) is a possible solution; but I am interested
to understand how to use the fork() system call..
For example, I wish to code in assembly language the
following C code [Beej's Guide to Network Programming]:

//...
   while(1) {  // main accept() loop
            sin_size = sizeof(struct sockaddr_in);
            if ((new_fd = accept(sockfd, (struct sockaddr *)&their_addr, &sin_size)) == -1) 
            {
                perror("accept");
                continue;
            }

            if (!fork()) { // this is the child process
                close(sockfd); // child doesn't need the listener

		// do something with new_fd socket descriptor

                close(new_fd);
                exit(0);
            }
            close(new_fd);  // parent doesn't need this
}

//...


My problem is to tell the OS to create a new child when
a connection is established.

HIToC


On Saturday 26 November 2005 20:26, Claudio Fontana wrote:
> --- HIToC <hitoc_mail@yahoo.it> ha scritto:
> > Hello list,
> > 	I have written a small echo program that listen for
> > a TCP
> > incoming connection on a port, then send all data
> > received.
> >
> > This program can accept only a session at time: I
> > would to
> > handle multiple connections using fork(),
>
> also consider using select(2), which is syscall 82 or
> poll (kernel 2.2+) which is 168 for descriptor
> multiplexing to avoid process creation overhead.
>
> > but in assembly this
> > way is little difficult!
> > How to hold the controll over the child genereted?
> >
> > Can anyone help me?
> > Thanks for every suggestion.
>
> Bye,
>
> CLaudio
>
>
>
>
>
>
>
> ___________________________________
> Yahoo! Mail: gratis 1GB per i messaggi e allegati da 10MB
> http://mail.yahoo.it
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
With regards,


					HIToC
					hitoc_mail@yahoo.it
