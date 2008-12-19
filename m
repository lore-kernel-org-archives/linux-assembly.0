From: "pei lin" <telent998@gmail.com>
Subject: Re: LinuxAsmTools Announcement
Date: Fri, 19 Dec 2008 11:50:13 +0800
Message-ID: <d6b7c4190812181950o6bc5d5ebv3196ee2a0cf9b575@mail.gmail.com>
References: <200812131056.00246.linuxasm@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=//G2vUjfwbtaeP4O/Ol4/jp+tZqPOJ7OfDGxioJb3EM=;
        b=t7qyQqmtFWYrIH4oY/caaiQjLuHUgrcPBlyLi9MaGuKD/xA3PpDWUyM9vH2MTTwx6C
         B9zxsW245R2pkPXddj8rRSAVEE1e7QGcmv9OEjMzZ5O0GeSxvwzCrQIWNIDmnaMI2kD7
         O3/2keUxMrLnNtEa/2upE+DwTSkhv/1HF/+Is=
In-Reply-To: <200812131056.00246.linuxasm@gmail.com>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jeff <linuxasm@gmail.com>
Cc: linux-assembly@vger.kernel.org

Firstly,Thanks for your great job.

These day i study about linker and loader,i meet a problem which make me puzzle.

when i disassemble *.o object file on x86 machine and find instruction
"call 0xFCFFFFFF",because not link,but why this address 0xFCFFFFFF not
0xFFFFFFFF or others?

i think must have some results i don't know,plz tell me.Because now
young people like me ,most  ly don't familiar with assemble and link.

Best Regards.


2008/12/14 jeff <linuxasm@gmail.com>:
> Announce:
>  The http://LinuxAsmTools.net web site has completed its
>  first testing milestone.  All programs are still beta, but
>  improving.
>
> Site Description:
>  LinuxAsmTools is devoted to 32-bit Linux assembler programming
>  for tools running in console or x terminal.  The focus is narrowed
>  further by the SFF (small fast friendly) guideline.
>
> Programs Available:
>
>    ainfo-0.9.45.tar.gz - example program for tty wrapping functions
>    asmcolor-0.9.45.tar.gz - example program showing color library
>    asmdis-0.9.49.tar.gz - disassembler
>    asmedit-0.9.48.tar.gz - programmers editor for assembly
>    asmfile-0.9.17.tar.gz - file manager
>    asmfind-0.9.46.tar.gz - disk search tool
>    asmlib-0.9.59.tar.gz - library
>    asmlinks-0.9.47.tar.gz - viewer with links to files
>    asmmenu-0.9.44.tar.gz - example program, provides menu for scripts
>    asmmgr-0.9.49.tar.gz - file manager (being replaced by asmfile)
>    asmplan-0.9.46.tar.gz - todo program
>    asmproject-0.9.44.tar.gz - setup for assembler projects
>    asmpub-0.9.45.tar.gz - extracts documentation from assembler source
>    asmref-0.9.58.tar.gz - help files for assembler
>    asmsrc-0.9.47.tar.gz - generate source for ELF executables
>    asmtimer-0.9.47.tar.gz - simple timer for ELF executables
>    asmtrace-0.9.55.tar.gz - traces kernel calls and disassebler
>    asmview-0.9.52.tar.gz - simple file viewer
>    copy-0.9.06.tar.gz - copy program similiar to DOS copy
>    crt_test-0.9.44.tar.gz - example program, and display test
>    domac-0.9.04.tar.gz - macro processor
>    elfdecode-0.9.47.tar.gz - display of ELF file contents
>    file_browse-0.9.46.tar.gz - file selector
>    fileset-0.9.02.tar.gz - file attribute changer, plus
>    format_doc-0.9.44.tar.gz - example program, modifies text files
>    key_echo-0.9.49.tar.gz - echo keys and check terminfo database
>    minibug-0.9.05.tar.gz - console debugger
>    sort-0.9.44.tar.gz - example program, simple file sort
>    steptest-0.9.44.tar.gz - example program, tests physical fitness
>    tracex-0.9.03.tar.gz - trace x server calls
>    walktest-0.9.44.tar.gz - example program, tests physical fitness
>
> Web Site Contents:
>  The web site is organized as follows:
>
>  whats new
>  programs
>  libraries
>  downloads
>  puzzles
>  opinion
>  tips
>  sff
>  about
>  links
>
> Links:
>  http://LinuxAsmTools.net
>  http://DesktopLinuxAsm@yahoogroups.com
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
