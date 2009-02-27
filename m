From: ramregar <ram@ramregar.com>
Subject: correct use of mfence
Date: Fri, 27 Feb 2009 15:07:01 -0800 (PST)
Message-ID: <22256244.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org


Hi,

I am writting atomic inc/dec/cas operations in assembly.

increment64(__int64* value, int val)
{
         __int64* temp = &val;
            _asm
          {
    push    edi
    push    ebx
                mov edi, pValue
                mov eax, [edi]
                mov edx, [edi+4]
           again:
                mov ecx, edx
                mov ebx, eax
                add ebx, 1
                adc ecx, 0
                mfence
                lock cmpxchg8b [edi]
                mfence
                jnz again
                mov eax, temp
                mov [eax], ebx
                mov [eax+4], ecx
                pop     ebx
                pop     edi
           }
}

Requirement is that it should work on single and multi-core
hardwares.

1. Use of mfence is not clear to me. So I temporarily put mfence
before and after cmpxchg8b. I am looking for correct use of mfence
opcode in this context. I would like to know how many lines mfence
serializes before its use.
MFENCE:
This serializing operation guarantees that every load and store
instruction that precedes in program order the MFENCE instruction is
globally visible before any load or store instruction that follows the
MFENCE instruction is globally visible

2. If i use mfence then also i need to use lock opcode before
cmpxchg8b?

What is the correct use of mfence in above assembly code.

Thanks,
Ram
-- 
View this message in context: http://www.nabble.com/correct-use-of-mfence-tp22256244p22256244.html
Sent from the linux-assembly mailing list archive at Nabble.com.

