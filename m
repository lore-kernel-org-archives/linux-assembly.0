From: =?iso-8859-1?q?Anticipating=20a=20Reply?= <ruxyz@yahoo.com>
Subject: Re: newbie question on gnu 'as'  => explaination about the why (for really newbie ;-))
Date: Thu, 1 Aug 2002 13:09:14 +0100 (BST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020801120914.23111.qmail@web14508.mail.yahoo.com>
References: <1028179746.1936.35.camel@italia>
Reply-To: ruxyz@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <1028179746.1936.35.camel@italia>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Emanuele Altieri <ealtieri@hampshire.edu>
Cc: Linux Assembly List <linux-assembly@vger.kernel.org>

Hello Emanuele ,

    Thank you very much for the explanation
given by you , which has cleared my doubt 
about 16-bit mode addressing totally .

    Actually , I was fooled by the Video
memory address 0xb800 which is loaded into
the segment register in the orignal code . 

    Now I understand that its lower 4 bits
are left-shifted & the offset is added to 
produce the 20 bit address . 

    Thanks again for the help .

With Best Regards

 --- Emanuele Altieri <ealtieri@hampshire.edu> wrote:
> Hi,
> 
> My reply comes a bit late. I hope it is still
> helpful. 
> This is the code that you wrote:
> 
>  .code16
>  .globl _start 
>  _start: 
>          movw $0xb800,%bx  # Video Memory address   
>          movb $0x41,(%bx)  # ASCII value to be
> displayed
>          movw $0xb801,%bx  # Video Memory address   
>          movb $0x1f,(%bx)  # Attribute of the
>  loop1:  jmp loop1
> 
> The problem with the code above is that it is
> writing to memory address
> 0xB800 rather than 0xB8000 (notice the extra zero),
> where video memory
> is actually located. The (%bx) notation means write
> to (or read from)
> memory at the address specified in %bx, and in %bx
> we have 0xB800.
> 
> Now, how can we make it write to 0xB8000 instead?
> The problem with this
> address is that we can't make it fit in a real-mode
> register, such as
> %bx, because the register can only hold two bytes of
> data.
> To overcome this limitation, Intel provides us with
> segment registers
> (es, ds, fs, gs). You can address memory by
> combining one of these
> registers with %bx. For example:
> 
>          mov $SOME_VALUE, %es:(%bx)
> 
> The memory address to write to is calculated by
> multiplying %es by 16
> and adding %bx to it. So, if we have
> 
>          # %es = $0xB800
>          # %bx = $0
>          mov $SOME_VALUE, %es:(%bx)    # write to
> 0xB8000
> 
> the final address is calculated as following:
> 
>         B800          (value in %es * 16)
>       +  0000         (value in %bx     )
>         =====
>         B8000
> 
> that is the address that we want.
> 
> You can learn more on real-mode addressing and
> segmentation from the
> 16-bit edition of the Art Of Assembly Language,
> section 4.3. Follow the
> link below:
> 
>
http://webster.cs.ucr.edu/Page_asm/ArtofAssembly/ch04/CH04-1.html#HEADING1-64
> 
> The whole chapter 4 is very interesting.
> 
> If you want to find out more about the AT&T's
> addressing modes, there
> are many tutorials on the linuxassembly.org site,
> such as this:
> 
> http://www.linuxassembly.org/linasm.html
> 
> 
> Take care
> 
>   -Emanuele
> 
> 
> 
> On Thu, 2002-08-01 at 00:43, Anticipating a Reply
> wrote:
> > Hi Frederic ,
> > 
> >   Thanks again .
> > 
> >   Let me do some more investigation and 
> > study before I ask anymore questions on 
> > AT&T syntax and Assembly .
> > 
> > With Best Regards
> > 
> >  --- Frederic Marmond <fmarmond@eprocess.fr>
> wrote: >
> > hum, well...
> > > I don't use the AT&T syntax, so, I may be wrong,
> but
> > > I think your code 
> > > is not right again:
> > > you don't specify any segment! (only the bx
> > > register)
> > > So, how do you think the CPU will know where to
> put
> > > your 0x411f ?
> > > You have to specify the segment after having
> fill it
> > > with a value.
> > > movw 0xb800,%bx
> > > movw %bx,%ds
> > > movw $0x411f,(%bx)        <= I'm not sure
> (perhapse
> > > a AT&T guru may help us)
> > >                                            
> Here, we
> > > assume that DS is 
> > > the default segment token by the as compiler
> > > 
> > > if I take your origin-code:
> > > 
> > >        mov ax,#0xb800 ; Video Memory address is
> > > 0xb800
> > >        mov es,ax      ; Video Memory is made as
> > > Extra Segment
> > >        seg es         ; Makes next instruction
> > > execute wrt Extra Segment 
> > >        mov [0],#0x41  ; ASCII value of the
> Character
> > > to be displayed 
> > >                       ;  in 1-row & 1-column
> > >        seg es         ; Makes next instruction
> > > execute wrt Extra Segment 
> > >        mov [1],#0x1f  ; Attribute of the
> Character
> > > to be displayed
> > >                       ;  in 1-row & 1-column
> > >                       ; 0x1f represents White
> > > 
> > > 
> > > The "seg es" lines are what we need.
> > > I think that by default, 'ds' is used, so, my 3
> > > lines of code may work.
> > > 
> > > 
> > > in this:
> > > 
> > > 6>       movw $0xb800,%bx  # Video Memory
> address   
> > > 7>       movb $0x41,(%bx)  # ASCII value to 
> > > 8>       movw $0xb801,%bx  # Video Memory
> address   
> > > 
> > > 9>       movb $0x1f,(%bx)  # Attribute of the  
> > > 
> > > you will put 0x411f at [ds:0xb800], which is
> > > somewhere around your 
> > > program code... it will surely erase something
> you
> > > may need (perhapse 
> > > your code!)
> > > 
> > > 
> > > 
> > > 
> > > Anticipating a Reply wrote:
> > > 
> > > >Hi Frederic ,
> > > >
> > > >   Thank you very much for all the 
> > > >explanation you have given about the 
> > > >addressing in 16-bit real mode .
> > > >
> > > >   From this explanation , I think 
> > > >I was wrong in line number 7 , 
> > > >which had 0xb800 acting as an 
> > > >offset to the Data Segment .
> > > >
> > > >   That is,if I'am not wrong we 
> > > >always need to specify the addresses 
> > > >in the below format -
> > > >
> > > >    seg_reg:offset 
> > > >----
> > > > OR
> > > >----    
> > > >   if given as 
> > > >  
> > > >   movb $xxx , ( %seg_reg )
> > > >
> > > >then the contents of "seg_reg"
> > > >will be considered as an Offset 
> > > >with respect to the Data Segment.
> > > >     
> > > >
> > > >1> .code16
> > > >2>
> > > >3> .globl _start 
> > > >4>
> > > >5> _start: 
> > > >6>       movw $0xb800,%bx  # Video Memory
> address  
> > > 
> > > >7>       movb $0x41,(%bx)  # ASCII value to 
> > > >8>       movw $0xb801,%bx  # Video Memory
> address  
> > >  
> > > >9>       movb $0x1f,(%bx)  # Attribute of the  
> > > >10> loop1: 
> > > >11>       jmp loop1
> > > >
> > > >
> > > >Hope I have got the concept correctly .
> > > >
> > > >  Thanking you all for bearing my basic
> > > >doubts and clearing them too.
> > > >
> > > >With best Regards
> > > >
> > > >
> > > > --- Frederic Marmond <fmarmond@eprocess.fr>
> wrote:
> > > >
> > > >Hi,
> > > >  
> > > >
> > > >>Here are some explainations you may want to
> know.
> > > >>
> > > >>When your PC boots, it is in real mode.
> > > >>This mode (!= protected mode) manage memory in
> > > this
> > > >>way:
> > > >>segment+offset
> > > >>The segment is a 64ko range , step by 16
> bytes.
> > > >>So, if you want to write to b8000 (video
> memory
> > > >>start in text mode), you 
> > > >>may set your segment at 0xb800 (=> 0xb800 * 16
> =
> > > >>0xb8000)
> > > >>Then, you can adress this segment of 65536
> bytes
> > > >>with an offset of 16bits.
> > > >>(that's why in real mode you can only see the
> > > first
> > > >>1Mo of your memory: 
> > > >>0xFFFF*16 = 0xFFFF0  ~= 1024*1024  (in fact, a
> > > >>little bit more than 1Mo, 
> > > >>because of the offset of 0xffff max))
> > > >>For your problem, in pseudo code:
> > > >>mov 0x411f to 0xb800:0    (write 0x411f to the
> > > >>corner high-left)
> > > >>mov 0x411f to 0xb800:(80*2 *10+ 20*2)   
> (write
> > > >>0x411f to the 10th line 
> > > >>(80*2 *10= 80(charPerLine)
> > > *2(1char=ascii+attribut)
> > > >>*10(10th line)) and 
> > > >>20th char)
> > > >>
> > > >>in assembly, segments are stored in special
> > > >>registers: ds (Data 
> > > >>Segment), CS(Code Segment), Es,Fs,Gs (Extra
> > > >>Segments), SS(Stack Segment)
> > > >>Offset may be any of the followings
> > > >>(Ax,Bx,Cx,Dx,Si,Di,Sp). (and, in 
> > > >>32bits mode: eAx,eBx,eCx....)
> > > >>
> > > >>So, the pseudo code may be write like that
> ((in
> > > >>intel syntax, which I 
> > > >>prefer, and that compile with nasm):
> > > >>mov    ax,0xb800
> > > >>mov    es,ax                ; we cannot affect
> > > >>directly value to seg 
> > > >>register (cannot write mov es,0xb800)
> > > >>mov    bx,0x0            ; start of the
> segment
> > > >>mov     [es:bx],0x411f    ;the compilator will
> > > >>assume automaticaly movw 
> > > >>(mov word => 16 bits)
> > > >>
> > > >>That is what Emanuele wrote you (in At&t
> syntax):
> > > >>
> > > >>           movw    $0xB800, %ax
> > > >>           movw    %ax, %es			; affect the
> start
> > > >>adress to the segment
> > > >>           movb    $0x41, %es:0  			; store
> value
> > > in
> > > >>the video memory
> > > >>           movb    $0x1f, %es:1					; these 2
> > > lines
> > > >>may be = to movw $0x411f,%es:0
> > > >>
> > > >>
> > > >>hope it helps!
> > > >>
> > > >>Fred
> > > >>
> > > >>Anticipating a Reply wrote:
> > > >>
> > > >>    
> > > >>
> > > >>>Hello Emanuele ,
> > > >>>
> > > >>>  Thank you for the below code 
> > > >>>you sent . It works perfectly and
> > > >>>will help me learn more of assembly .
> > > >>>
> > > >>>  Can you please help me figure 
> > > >>>out where I'am wrong in the code below,
> > > >>>which I have witten for the same 
> > > >>>functionality .
> > > >>>
> > > >>>.code16
> > > >>>
> > > >>>.globl _start 
> > > >>>
> > > >>>_start: 
> > > >>>      movw $0xb800,%bx  # Video Memory
> address   
> > > >>>      movb $0x41,(%bx)  # ASCII value to be
> > > >>>      
> > > >>>
> > > >>displayed
> > > >>    
> > > >>
> > > >>>      movw $0xb801,%bx  # Video Memory
> address   
> > > 
> > > >>>      movb $0x1f,(%bx)  # Attribute of the
> > > >>>      
> > > >>>
> > > >>Character 
> > > >>    
> > > >>
> > > >>>loop1: 
> > > >>>      jmp loop1
> > > >>>
> > > >>>
> > > >>>   Thanks once again .
> > > >>>
> > > >>>With Best Regards
> > > >>>
> > > >>>--- Emanuele Altieri <ealtieri@hampshire.edu>
> > > >>>      
> > > >>>
> > > >>wrote:
> > > >>    
> > > >>
> > > >>> 
> > > >>>
> > > >>>      
> > > >>>
> > > >>>>I'm assuming that you want to keep your code
> as
> > > a
> > > >>>>boot program:
> > > >>>>
> > > >>>>          .code16               # needed for
> > > >>>>booting
> > > >>>>          .global _start
> > > >>>>  _start:
> > > >>>>          movw    $0xB800, %ax
> > > >>>>          movw    %ax, %es
> > > >>>>          movb    $0x41, %es:0  
> > > >>>>          movb    $0x1f, %es:1
> > > >>>>  loop1:  jmp     loop1
> > > >>>>
> > > >>>>
> > > >>>>To assembly and link the program:
> > > >>>>
> > > >>>>  as -o boot.o boot.s
> > > >>>>  ld -s -oformat binary -Ttext 0x0 -o boot
> > > boot.o
> > > >>>>
> > > >>>>The last command creates the "boot" file
> that is
> > > >>>>ready to be 
> > > >>>>installed in the first sector of the floppy
> > > disk:
> > > >>>>
> > > >>>>  dd seek=0 if=boot of=/dev/fd0
> > > >>>>
> > > >>>>
> > > >>>>Hope this helps
> > > >>>>
> > > >>>> -Emanuele
> > > >>>>
> > > >>>>
> > > >>>>On Tue, 2002-07-30 at 07:59, Anticipating a
> > > Reply
> > > >>>>wrote:
> > > >>>>   
> > > >>>>
> > > >>>>        
> > > >>>>
> > > >>>>>Hi Everybody,
> > > >>>>>
> > > >>>>>       I have got a small piece of Assembly
> > > code
> > > >>>>>     
> > > >>>>>
> > > >>>>>          
> > > >>>>>
> > > >>>>,
> > > >>>>   
> > > >>>>
> > > >>>>        
> > > >>>>
> > > >>>>>which writes a character "A" on the screen
> .
> > > >>>>>
> > > >>>>> The below program is compiled and written 
> > > >>>>>to the boot sector of a floppy. It compiles
> > > >>>>>using the command :
> > > >>>>>
> > > >>>>>	as86 boot.s -o boot.o
> > > >>>>>	ld86 -d boot.o -o boot 
> > > >>>>>
> > > >>>>>  I want to rewrite it in AT&T syntax and
> > > >>>>>want to use GNU "as" assembler to compile
> it .
> > > >>>>>I tried doing it ,but with no success .
> > > >>>>>
> > > >>>>> Can anybody please help me rewite the
> > > >>>>>below code in AT&T syntax and tell me how
> > > >>>>>to compile & link it ?
> > > >>>>>
> > > >>>>>  Thanks in Advance .
> > > >>>>>
> > > >>>>>With Best Regards
> > > >>>>>
> > > >>>>>
> > > >>>>>THE CODE :
> > > >>>>>------------
> > > >>>>>
> > > >>>>>
> > > >>>>>entry start 
> > > >>>>>
> > > >>>>>start: 
> > > >>>>>      mov ax,#0xb800 ; Video Memory address
> is
> > > >>>>>     
> > > >>>>>
> > > >>>>>          
> > > >>>>>
> > > >>>>0xb800
> > > >>>>   
> > > >>>>
> > > >>>>        
> > > >>>>
> > > >>>>> 
> > > >>>>>      mov es,ax      ; Video Memory is made
> as
> > > >>>>>     
> > > >>>>>
> > > >>>>>          
> > > >>>>>
> > > >>>>Extra
> > > >>>>   
> > > >>>>
> > > >>>>        
> > > >>>>
> > > >>>>>Segment
> > > >>>>>      seg es         ; Makes next
> instruction
> > > >>>>>     
> > > >>>>>
> > > >>>>>          
> > > >>>>>
> > > >>>>execute
> > > >>>>   
> > > >>>>
> > > >>>>        
> > > >>>>
> > > >>>>>wrt Extra Segment 
> > > >>>>>      mov [0],#0x41  ; ASCII value of the
> > > >>>>>     
> > > >>>>>
> > > >>>>>          
> > > >>>>>
> > > >>>>Character
> > > >>>>   
> > > >>>>
> > > >>>>        
> > > >>>>
> > > >>>>>to be displayed 
> > > >>>>>                     ;  in 1-row & 1-column
> > > >>>>>      seg es         ; Makes next
> instruction
> > > >>>>>     
> > > >>>>>
> > > >>>>>          
> > > >>>>>
> > > >>>>execute
> > > >>>>   
> > > >>>>
> > > >>>>        
> > > >>>>
> > > >>>>>wrt Extra Segment 
> > > >>>>>      mov [1],#0x1f  ; Attribute of the
> > > >>>>>          
> > > >>>>>
> > > >>Character
> > > >>    
> > > >>
> > > >>>>>     
> > > >>>>>
> > > >>>>>          
> > > >>>>>
> > > >>>>to
> > > >>>>   
> > > >>>>
> > > >>>>        
> > > >>>>
> > > >>>>>be displayed
> > > >>>>>                     ;  in 1-row & 1-column
> > > >>>>>                     ; 0x1f represents
> White
> > > >>>>>Character on a Blue Background
> > > >>>>>loop1: 
> > > >>>>>      jmp loop1
> > > >>>>>
> > > >>>>>
> > > >>>>>
> > > >>>>>     
> > > >>>>>
> > > >>>>>          
> > > >>>>>
> > >
> >
>
>>________________________________________________________________________
> > > >>    
> > > >>
> > > >>> 
> > > >>>
> > > >>>      
> > > >>>
> > > >>>>>Want to sell your car? advertise on Yahoo
> Autos
> > > >>>>>     
> > > >>>>>
> > > >>>>>          
> > > >>>>>
> > > >>>>Classifieds. It's Free!!
> > > >>>>   
> > > >>>>
> > > >>>>        
> > > >>>>
> > > >>>>>      visit http://in.autos.yahoo.com
> > > >>>>>-
> > > >>>>>To unsubscribe from this list: send the
> line
> > > >>>>>     
> > > >>>>>
> > > >>>>>          
> > > >>>>>
> > > >>>>"unsubscribe linux-assembly" in
> > > >>>>   
> > > >>>>
> > > >>>>        
> > > >>>>
> > > >>>>>the body of a message to
> > > >>>>>          
> > > >>>>>
> > > >>majordomo@vger.kernel.org
> > > >>    
> > > >>
> > > >>>>>More majordomo info at 
> > > >>>>>     
> > > >>>>>
> > > >>>>>          
> > > >>>>>
> > > >>>>http://vger.kernel.org/majordomo-info.html
> > > >>>>
> > > >>>>
> > > >>>>   
> > > >>>>
> > > >>>>        
> > > >>>>
> > > >>>>># boot.s
> > > >>>>>     
> > > >>>>>
> > > >>>>>          
> > > >>>>>
> > > >>>>#
> > > >>>># To assembly and link as a **boot**
> program:
> > > >>>>#
> > > >>>>#    as boot.s -o boot.o
> > > >>>>#    ld -s -oformat binary -Ttext 0x0 -o
> boot
> > > >>>>        
> > > >>>>
> > > >>boot.o
> > > >>    
> > > >>
> > > >>>>#
> > > >>>># To copy it to the boot sector of a floppy
> > > disk:
> > > >>>>#
> > > >>>>#    dd seek=0 if=boot of=/dev/fd0
> > > >>>>#
> > > >>>># ---
> > > >>>># Emanuele (ealtieri@hampshire.edu)
> > > >>>>	
> > > >>>>	.code16
> > > >>>>	.global _start
> > > >>>>_start:
> > > >>>>	movw	$0xB800, %ax
> > > >>>>	movw	%ax, %es
> > > >>>>	movb	$0x41, %es:0
> > > >>>>	movb	$0x1f, %es:1
> > > >>>>loop1:	jmp	loop1
> > > >>>>
> > > >>>>   
> > > >>>>
> > > >>>>        
> > > >>>>
> > >
> >
>
>>________________________________________________________________________
> > > >>    
> > > >>
> > > >>>Want to sell your car? advertise on Yahoo
> Autos
> > > >>>      
> > > >>>
> > > >>Classifieds. It's Free!!
> > > >>    
> > > >>
> > > >>>      visit http://in.autos.yahoo.com
> > > >>>-
> > > >>>To unsubscribe from this list: send the line
> > > >>>      
> > > >>>
> > > >>"unsubscribe linux-assembly" in
> > > >>    
> > > >>
> > > >>>the body of a message to
> > > majordomo@vger.kernel.org
> > > >>>More majordomo info at 
> > > >>>      
> > > >>>
> > > >>http://vger.kernel.org/majordomo-info.html
> > > >>    
> > > >>
> > > >>> 
> > > >>>
> > > >>>      
> > > >>>
> > > >>
> > > >>-
> > > >>To unsubscribe from this list: send the line
> > > >>"unsubscribe linux-assembly" in
> > > >>the body of a message to
> majordomo@vger.kernel.org
> > > >>More majordomo info at 
> > > >>    
> > > >>
> > > >http://vger.kernel.org/majordomo-info.html 
> > > >
> > >
> >
>
>________________________________________________________________________
> > > >Want to sell your car? advertise on Yahoo Autos
> > > Classifieds. It's Free!!
> > > >       visit http://in.autos.yahoo.com
> > > >
> > > >  
> > > >
> > > 
> > > 
> > >  
> > 
> >
>
________________________________________________________________________
> > Want to sell your car? advertise on Yahoo Autos
> Classifieds. It's Free!!
> >        visit http://in.autos.yahoo.com
> > -
> > To unsubscribe from this list: send the line
> "unsubscribe linux-assembly" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 
>  

________________________________________________________________________
Want to sell your car? advertise on Yahoo Autos Classifieds. It's Free!!
       visit http://in.autos.yahoo.com
