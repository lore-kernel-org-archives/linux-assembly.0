From: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Subject: Addessing by index
Date: Tue, 15 Jul 2003 14:25:05 -0600 (CST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0307151418320.25164-100000@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hi, I would like to understand how addressing by index works focused on
motorola hc6811.

Instructions such as:
addd X
addd ,X
addd 0,X

The document I have give example of addressing by index using "ADDD", that
is "Add 16-bit D", What's that supposed to mean?

2. What is relatived addressing?
The example is below:

there 	bra where
where 	bhi there
	bcc lbcc
hang	beq	hang
	beq	*
lbcc	jmp	$1000
	bsr 	hang

How this works?

In both case, How I am using CPU register to "address" data instead of the
memory itself?.


---
Fabio Andres Miranda
Ingenieria de sistemas informaticos
Universidad Latina - Costa Rica


