From: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Subject: suggestion needed for assembly code
Date: Tue, 13 Mar 2007 18:53:25 +0530
Message-ID: <45F6A5CD.9020207@sun.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_eYvZAAMnbOe22jAp++Fb8w)"
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
To: linux-assembly@vger.kernel.org

This is a multi-part message in MIME format.

--Boundary_(ID_eYvZAAMnbOe22jAp++Fb8w)
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7BIT

Hi,

I have a code that alternates between 2 funcs unlimitedly. I am curious 
to know the following lines in switch_to() as to what it does
if(!called_once[1] && func==1) {
       asm("movl %0,%%esp\n\t"\
          : "=m"(func_stack));
         called_once[func]=1;

Also, can anyone give me a suggestion as to what needs to be done for 
getting this sequence

main to A;
A to main; /* jump back to main without finishing A */
main to B;
B to main; /* jump back to main without finishing A */
main to A; /* without calling A */
....
....

Thanks
Prasanta

--Boundary_(ID_eYvZAAMnbOe22jAp++Fb8w)
Content-type: text/x-csrc; name=switch2.c
Content-transfer-encoding: 7BIT
Content-disposition: inline; filename=switch2.c

#include <stdio.h>
#include <error.h>
#include <errno.h>

struct float_reg {
    long cwd;
    long swd;
    long twd;
    long fip;
    long fcs;
    long foo;
    long fos;
    long st_space[20];
    long status;
};

struct user_regs {
    int ebx;
    int ecx;
    int edx;
    int esi;
    int edi;
    int ebp;
    int eax;
    int esp;
    int eip;
    struct float_reg fp_status;
};

#define SAVE_REGS(regs) \
asm("movl %%ebx, %0\n\t" \
     "movl %%ecx, %1\n\t" \
     "movl %%edx, %2\n\t" \
     "movl %%esi, %3\n\t" \
     "movl %%edi, %4\n\t" \
     "movl %%eax, %5\n\t" \
     "fsave %6\n\t" \
     "movl $1f, %7\n\t" \
     "movl %%esp, %8\n\t" \
     "movl %%ebp, %9\n\t" \
     "1:\n\t"\
     :: \
     "m"(regs.ebx),\
     "m"(regs.ecx),\
     "m"(regs.edx), \
     "m"(regs.esi), \
     "m"(regs.edi), \
     "m"(regs.eax), \
     "m"(regs.fp_status),\
     "m"(regs.eip),\
     "m"(regs.esp),\
     "m"(regs.ebp))

#define RESTORE_REGS(regs) \
asm("movl %0, %%ebx\n\t" \
     "movl %1,%%ecx\n\t" \
     "movl %2,%%edx\n\t" \
     "movl %3,%%esi\n\t" \
     "movl %4,%%edi\n\t" \
     "movl %5,%%eax\n\t" \
     "movl %6,%%esp\n\t"\
     "movl %7,%%ebp\n\t"\
     "frstor %8\n\t"\
     "pushl %9\n\t"\
     "ret\n\t"\
     : "=m"((regs).ebx),\
       "=m"((regs).ecx),\
       "=m"((regs).edx), \
       "=m"((regs).esi), \
       "=m"((regs).edi), \
       "=m"((regs).eax), \
       "=m"((regs).esp),\
       "=m"((regs).ebp),\
       "=m"((regs).fp_status),\
       "=m"((regs).eip))


#define NUM_FUNCS 2
#define STACK_SIZE 0xffff

struct user_regs regs[2];
struct user_regs temp_reg;
int func=0;
int called_once[NUM_FUNCS];

char * func_stack;


void func_B();

void switch_to() {
	int temp;
	func=1-func;
	temp=func;
	SAVE_REGS(temp_reg);
	if(func == temp) {
		regs[1-func]=temp_reg;
		if(!called_once[1] && func==1) {
			asm("movl %0,%%esp\n\t"\
				: "=m"(func_stack));
			called_once[func]=1;
	       	 	func_B();
			exit(1);  // not reached
		}
	       	 else {
			temp_reg=regs[func]; 
			RESTORE_REGS(temp_reg);
		}
	}
}	

void my_sleep(int secs) {
	sleep(secs);
	switch_to();
}

void func_A() {
	register int i=0;
	while(1) {
		printf("In function A:%d\n",i);
		i += 1;
	        my_sleep(2);
         }		
}

void func_B() {
       register int i=0;
       while(1) {
                printf("In function B:%d\n",i);
		i += 1;
                my_sleep(2);
       }
}

int init_stack() {
	int i;
	called_once[0]=1;
	for(i=1;i<NUM_FUNCS;i++) called_once[i]=0;
	func_stack =(char *)malloc(STACK_SIZE*sizeof(char));
	func_stack = ((char *)func_stack)+STACK_SIZE;
	memset(regs,0,sizeof(regs));
	memset(&temp_reg,0,sizeof(temp_reg));
}
	

main() {
	init_stack();
	func_A();

}

--Boundary_(ID_eYvZAAMnbOe22jAp++Fb8w)--
