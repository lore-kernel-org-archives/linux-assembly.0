From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: I need help about inline assembly
Date: Mon, 29 Mar 2004 09:39:40 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <4067D2BC.2030504@eprocess.fr>
References: <S262538AbUC2Ayw/20040329005452Z+285@vger.kernel.org>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <S262538AbUC2Ayw/20040329005452Z+285@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: RaZoR <razor@NewBG.org>
Cc: linux-assembly@vger.kernel.org

hum, something like:

int main()
{
    char a=1,b=2;
    printf("a=%i    b=%i\n",a,b);
           __asm__ __volatile__(
            "movb    %0,%1\n\t"    /*a=b*/
               :"=r" (a)
               :"r" (b)
               :"cx","dx","di","si");
    printf("a=%i    b=%i\n",a,b);
            return 0;
}

tell me if you need explainations
Fred

RaZoR wrote:

>Hi again :) I've got one question and here it is:
>
>There's a C program:
>main() {
>char c='g',b='j';
>...
>
>Now how (with the help of inline assembly) to copy c in b. (Without using C
>library functions)
>
>And if you can give me an example using mov*.
>
>Thank you
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>

