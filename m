From: HIToC <hitoc_mail@yahoo.it>
Subject: Re: sys_fork
Date: Mon, 28 Nov 2005 11:10:51 +0100
Message-ID: <200511281110.51363.hitoc_mail@yahoo.it>
References: <20051126192634.43926.qmail@web26006.mail.ukl.yahoo.com> <200511271337.56268.hitoc_mail@yahoo.it> <20051127172743.587c2c41.rnsanchez@terra.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20051127172743.587c2c41.rnsanchez@terra.com.br>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Cc: linux-assembly@vger.kernel.org

I have thi piece of code:

wait_new_con:	mov	eax, [sock_fd]
		mov		ebx, their_addr
		mov		ecx, sockaddr_size
		mov		[their_addr_len], ecx
		mov		ecx, their_addr_len

		push	eax
		push	ebx
		push	ecx
		call	accept


		test	eax, eax
		jns	st_connection
		mov		ecx, accept_error
		mov		edx, accept_error_len
		call	print_string
		mov		ebx, 0x01
		jmp	exit

st_connection:	mov	[new_sock], eax	; new socket saved!

		mov	eax, 0x02	; sys_fork
		xor	ebx, ebx
		int	0x80

		mov		eax, 0x06	; sys_close
		mov		ebx, [sock_fd]
		int	0x80


echo_loop:	mov	eax, [new_sock]
		mov	ebx, buffer
		push	eax
		push	ebx
		push	dword MAX_DATA
		push	dword 0
		call	recv

		push	eax

		mov	edi, val
		call	hex2string
		mov	ecx, bytes
		mov	edx, bytes_len
		call	print_string

		pop	eax

		cmp	eax, 0x00000000
		jz	close_conct

		mov ecx, eax
		mov	eax, [new_sock]
		mov	ebx, buffer
		push	eax
		push	ebx
		push	ecx
		push	dword 0
		call	send_all


		jmp	echo_loop




close_conct:	mov		eax, 0x06	; sys_close
		mov		ebx, [new_sock]
		int	0x80

		mov		eax, 0x01	; sys_exit	Child exit?
		xor	ebx, ebx
		int	0x80

		jmp	wait_new_con


		xor	ebx, ebx
exit:		mov	eax, 0x01	; sys_exit
		int	0x80


When the caller has closed the TCP connection, I want that the child
exits, but happens that the entire program exits.
Also, if another client attemps to connect my server, the connecion is
refued.



On Sunday 27 November 2005 20:27, Ricardo Nabinger Sanchez wrote:
> Quoting  HIToC <hitoc_mail@yahoo.it>
> Sent on  Sun, 27 Nov 2005 19:22:35 +0100
>
> > My problem is to tell the OS to create a new child when
> > a connection is established.
>
> you'll have a loop blocking on accept(), with a call to fork() in the
> body.  the child will handle the connection, the parent will block again on
> accept().
>
> can you give more details on your problem?  where are you stuck?

-- 
With regards,


					HIToC
					hitoc_mail@yahoo.it
