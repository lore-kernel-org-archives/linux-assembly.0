From: Ribamar Santarosa de Sousa <ribamar.sousa@ic.unicamp.br>
Subject: newbie question about integers size/portabilty.
Date: Tue, 28 Dec 2004 10:29:16 -0200
Message-ID: <20041228122916.GA7137@ic.unicamp.br>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org


Hi all,
	(about this question is about C programming, i think the
	"assemblers-guys" are most likely to answers quickly than not so
	advanced c programmers.... :)
	in the c style guide:
	http://www.psgd.org/paul/docs/cstyle/cstyle16.htm
	we can found a table (shown bellow) for integer data sizes. 
	there we can se that some architecture have more than one possible 
	value for the same size, depending on -- i guess -- the compiler.
	Does anyone know where i can get a accurate table for gcc compiler?

	
	Can those values change from a processor in the x86 to another with
	fixed-size word (e.g. 486 -> 586)? (The document provides a "safe
	minimal size" table, but note, as i am mixing several integer types
	to pass to a hardware data structure, this is not enough, i need
	exact values). 
	
TIA, Riba.

     type     pdp11  VAX/11   68000  Cray-2  Unisys  Harris      80386
	           series          family            1100    H800
	_________________________________________________________________
	char         8       8       8       8       9       8          8
	short       16      16    8/16  64(32)      18      24       8/16
	int         16      32   16/32  64(32)      36      24      16/32
	long        32      32      32      64      36      48         32
	char*       16      32      32      64      72      24   16/32/48
	int*        16      32      32  64(24)      72      24   16/32/48
	int(*)()    16      32      32      64     576      24   16/32/48

