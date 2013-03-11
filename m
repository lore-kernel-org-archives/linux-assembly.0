From: Meher Assel <asselmeher@gmail.com>
Subject: [NASM] ROR -> error: invalid combination of opcode and operands
Date: Mon, 11 Mar 2013 23:09:13 +0100
Message-ID: <CAPf=7QaV18vMLRrG6fuApkOpVEE5LmVnDKfxd=S8kWRz8S=qiQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=KqGw97OrLX3hXtARMXdfPw67ZY7IPp48z0FsXBzZXgg=;
        b=G5n58YW+YocPJyofNYHvXnd5Zcf3Dlyz78thVHi6cOu+FxSECAM+ZmTBqyqE+JUXrG
         xWzaEWxmiEnZiQFotSeRqveXecJ3+iML7e80DvFQFT3RTmxYx5dZCRZuijOBenp9+CYZ
         8eWFo9EaIwp68qVZPx9DHNSvOs97U7KEWgTc16rBXzXtDxsDI1TLFAAdW+wKd0he8DW6
         VYJ8DOJlBFOe9c/Q2qh1BL3gnawdkc0bETAvLomQXKZ9GCMC/YPsvkKVj4v/Irb80i6/
         LvcTD4N0CrWlZWy0KAKv/74NUdDxd4QsMT2a2jW7bXnIGCyDa9af47bcegf+lqLT8wI8
         PT7g==
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hello all,
why i can't do ' ror al,bl' ?
i'am using nasm in 16bits mode ( [BITS 16] )
i get this error when compiling:
error: invalid combination of opcode and operands
