From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: newbie question on gnu 'as'  => explaination about the why (for
 really newbie ;-))
Date: Wed, 31 Jul 2002 13:31:32 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D47CA94.3010106@eprocess.fr>
References: <20020731100911.58715.qmail@web14507.mail.yahoo.com>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ruxyz@yahoo.com
Cc: Emanuele Altieri <ealtieri@hampshire.edu>, Linux Assembly List <linux-assembly@vger.kernel.org>

  hum, well...
I don't use the AT&T syntax, so, I may be wrong, but I think your code 
is not right again:
you don't specify any segment! (only the bx register)
So, how do you think the CPU will know where to put your 0x411f ?
You have to specify the segment after having fill it with a value.
movw 0xb800,%bx
movw %bx,%ds
movw $0x411f,(%bx)        <= I'm not sure (perhapse a AT&T guru may help us)
                                            Here, we assume that DS is 
the default segment token by the as compiler

if I take your origin-code:

       mov ax,#0xb800 ; Video Memory address is 0xb800
       mov es,ax      ; Video Memory is made as Extra Segment
       seg es         ; Makes next instruction execute wrt Extra Segment 
       mov [0],#0x41  ; ASCII value of the Character to be displayed 
                      ;  in 1-row & 1-column
       seg es         ; Makes next instruction execute wrt Extra Segment 
       mov [1],#0x1f  ; Attribute of the Character to be displayed
                      ;  in 1-row & 1-column
                      ; 0x1f represents White


The "seg es" lines are what we need.
I think that by default, 'ds' is used, so, my 3 lines of code may work.


in this:

6>       movw $0xb800,%bx  # Video Memory address   
7>       movb $0x41,(%bx)  # ASCII value to 
8>       movw $0xb801,%bx  # Video Memory address    
9>       movb $0x1f,(%bx)  # Attribute of the  

you will put 0x411f at [ds:0xb800], which is somewhere around your 
program code... it will surely erase something you may need (perhapse 
your code!)



Anticipating a Reply wrote:

>Hi Frederic ,
>
>   Thank you very much for all the 
>explanation you have given about the 
>addressing in 16-bit real mode .
>
>   From this explanation , I think 
>I was wrong in line number 7 , 
>which had 0xb800 acting as an 
>offset to the Data Segment .
>
>   That is,if I'am not wrong we 
>always need to specify the addresses 
>in the below format -
>
>    seg_reg:offset 
>----
> OR
>----    
>   if given as 
>  
>   movb $xxx , ( %seg_reg )
>
>then the contents of "seg_reg"
>will be considered as an Offset 
>with respect to the Data Segment.
>     
>
>1> .code16
>2>
>3> .globl _start 
>4>
>5> _start: 
>6>       movw $0xb800,%bx  # Video Memory address   
>7>       movb $0x41,(%bx)  # ASCII value to 
>8>       movw $0xb801,%bx  # Video Memory address    
>9>       movb $0x1f,(%bx)  # Attribute of the  
>10> loop1: 
>11>       jmp loop1
>
>
>Hope I have got the concept correctly .
>
>  Thanking you all for bearing my basic
>doubts and clearing them too.
>
>With best Regards
>
>
> --- Frederic Marmond <fmarmond@eprocess.fr> wrote: >
>Hi,
>  
>
>>Here are some explainations you may want to know.
>>
>>When your PC boots, it is in real mode.
>>This mode (!= protected mode) manage memory in this
>>way:
>>segment+offset
>>The segment is a 64ko range , step by 16 bytes.
>>So, if you want to write to b8000 (video memory
>>start in text mode), you 
>>may set your segment at 0xb800 (=> 0xb800 * 16 =
>>0xb8000)
>>Then, you can adress this segment of 65536 bytes
>>with an offset of 16bits.
>>(that's why in real mode you can only see the first
>>1Mo of your memory: 
>>0xFFFF*16 = 0xFFFF0  ~= 1024*1024  (in fact, a
>>little bit more than 1Mo, 
>>because of the offset of 0xffff max))
>>For your problem, in pseudo code:
>>mov 0x411f to 0xb800:0    (write 0x411f to the
>>corner high-left)
>>mov 0x411f to 0xb800:(80*2 *10+ 20*2)    (write
>>0x411f to the 10th line 
>>(80*2 *10= 80(charPerLine) *2(1char=ascii+attribut)
>>*10(10th line)) and 
>>20th char)
>>
>>in assembly, segments are stored in special
>>registers: ds (Data 
>>Segment), CS(Code Segment), Es,Fs,Gs (Extra
>>Segments), SS(Stack Segment)
>>Offset may be any of the followings
>>(Ax,Bx,Cx,Dx,Si,Di,Sp). (and, in 
>>32bits mode: eAx,eBx,eCx....)
>>
>>So, the pseudo code may be write like that ((in
>>intel syntax, which I 
>>prefer, and that compile with nasm):
>>mov    ax,0xb800
>>mov    es,ax                ; we cannot affect
>>directly value to seg 
>>register (cannot write mov es,0xb800)
>>mov    bx,0x0            ; start of the segment
>>mov     [es:bx],0x411f    ;the compilator will
>>assume automaticaly movw 
>>(mov word => 16 bits)
>>
>>That is what Emanuele wrote you (in At&t syntax):
>>
>>           movw    $0xB800, %ax
>>           movw    %ax, %es			; affect the start
>>adress to the segment
>>           movb    $0x41, %es:0  			; store value in
>>the video memory
>>           movb    $0x1f, %es:1					; these 2 lines
>>may be = to movw $0x411f,%es:0
>>
>>
>>hope it helps!
>>
>>Fred
>>
>>Anticipating a Reply wrote:
>>
>>    
>>
>>>Hello Emanuele ,
>>>
>>>  Thank you for the below code 
>>>you sent . It works perfectly and
>>>will help me learn more of assembly .
>>>
>>>  Can you please help me figure 
>>>out where I'am wrong in the code below,
>>>which I have witten for the same 
>>>functionality .
>>>
>>>.code16
>>>
>>>.globl _start 
>>>
>>>_start: 
>>>      movw $0xb800,%bx  # Video Memory address   
>>>      movb $0x41,(%bx)  # ASCII value to be
>>>      
>>>
>>displayed
>>    
>>
>>>      movw $0xb801,%bx  # Video Memory address    
>>>      movb $0x1f,(%bx)  # Attribute of the
>>>      
>>>
>>Character 
>>    
>>
>>>loop1: 
>>>      jmp loop1
>>>
>>>
>>>   Thanks once again .
>>>
>>>With Best Regards
>>>
>>>--- Emanuele Altieri <ealtieri@hampshire.edu>
>>>      
>>>
>>wrote:
>>    
>>
>>> 
>>>
>>>      
>>>
>>>>I'm assuming that you want to keep your code as a
>>>>boot program:
>>>>
>>>>          .code16               # needed for
>>>>booting
>>>>          .global _start
>>>>  _start:
>>>>          movw    $0xB800, %ax
>>>>          movw    %ax, %es
>>>>          movb    $0x41, %es:0  
>>>>          movb    $0x1f, %es:1
>>>>  loop1:  jmp     loop1
>>>>
>>>>
>>>>To assembly and link the program:
>>>>
>>>>  as -o boot.o boot.s
>>>>  ld -s -oformat binary -Ttext 0x0 -o boot boot.o
>>>>
>>>>The last command creates the "boot" file that is
>>>>ready to be 
>>>>installed in the first sector of the floppy disk:
>>>>
>>>>  dd seek=0 if=boot of=/dev/fd0
>>>>
>>>>
>>>>Hope this helps
>>>>
>>>> -Emanuele
>>>>
>>>>
>>>>On Tue, 2002-07-30 at 07:59, Anticipating a Reply
>>>>wrote:
>>>>   
>>>>
>>>>        
>>>>
>>>>>Hi Everybody,
>>>>>
>>>>>       I have got a small piece of Assembly code
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>,
>>>>   
>>>>
>>>>        
>>>>
>>>>>which writes a character "A" on the screen .
>>>>>
>>>>> The below program is compiled and written 
>>>>>to the boot sector of a floppy. It compiles
>>>>>using the command :
>>>>>
>>>>>	as86 boot.s -o boot.o
>>>>>	ld86 -d boot.o -o boot 
>>>>>
>>>>>  I want to rewrite it in AT&T syntax and
>>>>>want to use GNU "as" assembler to compile it .
>>>>>I tried doing it ,but with no success .
>>>>>
>>>>> Can anybody please help me rewite the
>>>>>below code in AT&T syntax and tell me how
>>>>>to compile & link it ?
>>>>>
>>>>>  Thanks in Advance .
>>>>>
>>>>>With Best Regards
>>>>>
>>>>>
>>>>>THE CODE :
>>>>>------------
>>>>>
>>>>>
>>>>>entry start 
>>>>>
>>>>>start: 
>>>>>      mov ax,#0xb800 ; Video Memory address is
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>0xb800
>>>>   
>>>>
>>>>        
>>>>
>>>>> 
>>>>>      mov es,ax      ; Video Memory is made as
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>Extra
>>>>   
>>>>
>>>>        
>>>>
>>>>>Segment
>>>>>      seg es         ; Makes next instruction
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>execute
>>>>   
>>>>
>>>>        
>>>>
>>>>>wrt Extra Segment 
>>>>>      mov [0],#0x41  ; ASCII value of the
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>Character
>>>>   
>>>>
>>>>        
>>>>
>>>>>to be displayed 
>>>>>                     ;  in 1-row & 1-column
>>>>>      seg es         ; Makes next instruction
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>execute
>>>>   
>>>>
>>>>        
>>>>
>>>>>wrt Extra Segment 
>>>>>      mov [1],#0x1f  ; Attribute of the
>>>>>          
>>>>>
>>Character
>>    
>>
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>to
>>>>   
>>>>
>>>>        
>>>>
>>>>>be displayed
>>>>>                     ;  in 1-row & 1-column
>>>>>                     ; 0x1f represents White
>>>>>Character on a Blue Background
>>>>>loop1: 
>>>>>      jmp loop1
>>>>>
>>>>>
>>>>>
>>>>>     
>>>>>
>>>>>          
>>>>>
>>________________________________________________________________________
>>    
>>
>>> 
>>>
>>>      
>>>
>>>>>Want to sell your car? advertise on Yahoo Autos
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>Classifieds. It's Free!!
>>>>   
>>>>
>>>>        
>>>>
>>>>>      visit http://in.autos.yahoo.com
>>>>>-
>>>>>To unsubscribe from this list: send the line
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>"unsubscribe linux-assembly" in
>>>>   
>>>>
>>>>        
>>>>
>>>>>the body of a message to
>>>>>          
>>>>>
>>majordomo@vger.kernel.org
>>    
>>
>>>>>More majordomo info at 
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>http://vger.kernel.org/majordomo-info.html
>>>>
>>>>
>>>>   
>>>>
>>>>        
>>>>
>>>>># boot.s
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>#
>>>># To assembly and link as a **boot** program:
>>>>#
>>>>#    as boot.s -o boot.o
>>>>#    ld -s -oformat binary -Ttext 0x0 -o boot
>>>>        
>>>>
>>boot.o
>>    
>>
>>>>#
>>>># To copy it to the boot sector of a floppy disk:
>>>>#
>>>>#    dd seek=0 if=boot of=/dev/fd0
>>>>#
>>>># ---
>>>># Emanuele (ealtieri@hampshire.edu)
>>>>	
>>>>	.code16
>>>>	.global _start
>>>>_start:
>>>>	movw	$0xB800, %ax
>>>>	movw	%ax, %es
>>>>	movb	$0x41, %es:0
>>>>	movb	$0x1f, %es:1
>>>>loop1:	jmp	loop1
>>>>
>>>>   
>>>>
>>>>        
>>>>
>>________________________________________________________________________
>>    
>>
>>>Want to sell your car? advertise on Yahoo Autos
>>>      
>>>
>>Classifieds. It's Free!!
>>    
>>
>>>      visit http://in.autos.yahoo.com
>>>-
>>>To unsubscribe from this list: send the line
>>>      
>>>
>>"unsubscribe linux-assembly" in
>>    
>>
>>>the body of a message to majordomo@vger.kernel.org
>>>More majordomo info at 
>>>      
>>>
>>http://vger.kernel.org/majordomo-info.html
>>    
>>
>>> 
>>>
>>>      
>>>
>>
>>-
>>To unsubscribe from this list: send the line
>>"unsubscribe linux-assembly" in
>>the body of a message to majordomo@vger.kernel.org
>>More majordomo info at 
>>    
>>
>http://vger.kernel.org/majordomo-info.html 
>
>________________________________________________________________________
>Want to sell your car? advertise on Yahoo Autos Classifieds. It's Free!!
>       visit http://in.autos.yahoo.com
>
>  
>



