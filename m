From: "Charles T. Bell" <cbell44@cfl.rr.com>
Subject: simple hello.asm (NASM) not compile in x64, plz help
Date: Sat, 29 Nov 2014 05:20:26 -0500
Message-ID: <54799DEA.5070408@cfl.rr.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030901070309000507040106"
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
To: linux-assembly@vger.kernel.org

This is a multi-part message in MIME format.
--------------030901070309000507040106
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 11/29/2014 12:26 AM, Brian Raiter wrote:
>>
>> ld -s -o heworl heworl.o
>> ld:i386 architecture of input file *.o is incompatible with
i386:x86-64 output
>
> You told nasm to create a 32-bit .o file. Tell nasm to create a 64-bit
> .o file instead. Use "-f elf64" instead of "-f elf32".
>
> The command "nasm -hf" will display all the valid output formats that
> nasm supports.
>
> b
> --
> To unsubscribe from this list: send the line "unsubscribe
linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

I normally use gold (linker) and yasm (like nasm) since they are more
64-bit friendly.
My Makefile is thus:

hello: hello.o
	gold hello.o -o hello
hello.o: hello.asm
	yasm -f elf64 -g dwarf2 -o hello.o hello.asm

You can use the entries individually or just copy and paste into your
own Makefile and type: make
That will make .o file and link it for the executable, but don't forget
to rename "hello" to "heworl" in every instance, so it will have the
name you chose.
Hope this help!

Tom
-- 
"To argue with a man who has renounced the use of
reason is like administering medicine to the dead."
-- Thomas Paine, The American Crisis No. V(1776)

--------------030901070309000507040106
Content-Type: text/x-vcard; charset=utf-8;
 name="cbell44.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="cbell44.vcf"

begin:vcard
fn:Tom
n:Bell;Charles
email;internet:charles.bell.us@member.mensa.org
tel;home:386-673-8327
tel;cell:386-212-5407
version:2.1
end:vcard


--------------030901070309000507040106--
