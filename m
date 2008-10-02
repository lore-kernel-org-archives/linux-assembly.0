From: Frank Kotler <fbkotler@verizon.net>
Subject: Nasm 2.05rc1 released
Date: Thu, 02 Oct 2008 14:41:20 -0400
Message-ID: <48E515D0.1010500@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Nasm 2.05rc1 is available at SourceForge.

<http://sourceforge.net/project/showfiles.php?group_id=6208>

Alternate (new!!!) address:

http://www.nasm.us/

I failed to get 2.04rc2 through 2.04rc6 up at SourceForge, and as a 
result of not enough testing, 2.04 turned out to *not* be a "candidate" 
after all. :(

We hope our users will help us test this "release candidate" so it 
doesn't happen again! Partial changelog follows. (this is now Appendix C 
in the Nasm Manual)

Best,
Frank

  C.1.1 Version 2.05

        (*) Fix redundant REX.W prefix on `JMP reg64'.

        (*) Make the behaviour of `-O0' match NASM 0.98 legacy behavior. See
            section 2.1.22.

        (*) `-w-user' can be used to suppress the output of `%warning'
            directives. See section 2.1.24.

        (*) Fix bug where `ALIGN' would issue a full alignment datum instead
            of zero bytes.

        (*) Fix offsets in list files.

        (*) Fix `%include' inside multi-line macros or loops.

  C.1.2 Version 2.04

        (*) Sanitize macro handing in the `%error' directive.

        (*) New `%warning' directive to issue user-controlled warnings.

        (*) `%error' directives are now deferred to the final assembly
            phase.

        (*) New `%fatal' directive to immediately terminate assembly.

        (*) New `%strcat' directive to join quoted strings together.

        (*) New `%use' macro directive to support standard macro directives.
            See section 4.6.4.

        (*) Excess default parameters to `%macro' now issues a warning by
            default. See section 4.3.

        (*) Fix `%ifn' and `%elifn'.

        (*) Fix nested `%else' clauses.

        (*) Correct the handling of nested `%rep's.

        (*) New `%unmacro' directive to undeclare a multi-line macro. See
            section 4.3.10.

        (*) Builtin macro `__PASS__' which expands to the current assembly
            pass. See section 4.11.9.

        (*) `__utf16__' and `__utf32__' operators to generate UTF-16 and
            UTF-32 strings. See section 3.4.5.

        (*) Fix bug in case-insensitive matching when compiled on platforms
            that don't use the `configure' script. Of the official release
            binaries, that only affected the OS/2 binary.

        (*) Support for x87 packed BCD constants. See section 3.4.7.

        (*) Correct the `LTR' and `SLDT' instructions in 64-bit mode.

        (*) Fix unnecessary REX.W prefix on indirect jumps in 64-bit mode.

        (*) Add AVX versions of the AES instructions (`VAES'...).

        (*) Fix the 256-bit FMA instructions.

        (*) Add 256-bit AVX stores per the latest AVX spec.

        (*) VIA XCRYPT instructions can now be written either with or
            without `REP', apparently different versions of the VIA spec
            wrote them differently.

        (*) Add missing 64-bit `MOVNTI' instruction.

        (*) Fix the operand size of `VMREAD' and `VMWRITE'.

        (*) Numerous bug fixes, especially to the AES, AVX and VTX
            instructions.

        (*) The optimizer now always runs until it converges. It also runs
            even when disabled, but doesn't optimize. This allows most
            forward references to be resolved properly.

  C.1.3 Version 2.03.01

        (*) Fix buffer overflow in the listing module.

        (*) Fix the handling of hexadecimal escape codes in `...` strings.

        (*) The Postscript/PDF documentation has been reformatted.

        (*) The `-F' option now implies `-g'.

  C.1.4 Version 2.03

        (*) Add support for Intel AVX, CLMUL and FMA instructions, including
            YMM registers.

        (*) `dy', `resy' and `yword' for 32-byte operands.

        (*) Fix some SSE5 instructions.

        (*) Intel `INVEPT', `INVVPID' and `MOVBE' instructions.

        (*) Fix checking for critical expressions when the optimizer is
            enabled.

        (*) Support the DWARF debugging format for ELF targets.

        (*) Fix optimizations of signed bytes.

        (*) Fix operation on bigendian machines.

        (*) Fix buffer overflow in the preprocessor.

        (*) `SAFESEH' support for Win32, `IMAGEREL' for Win64 (SEH).

        (*) `%?' and `%??' to refer to the name of a macro itself. In
            particular, `%idefine keyword $%?' can be used to make a keyword
            "disappear".

        (*) New options for dependency generation: `-MD', `-MF', `-MP',
            `-MT', `-MQ'.

        (*) New preprocessor directives `%pathsearch' and `%depend'; INCBIN
            reimplemented as a macro.

        (*) `%include' now resolves macros in a sane manner.

        (*) `%substr' can now be used to get other than one-character
            substrings.

        (*) New type of character/string constants, using backquotes
            (``...`'), which support C-style escape sequences.

        (*) `%defstr' and `%idefstr' to stringize macro definitions before
            creation.

        (*) Fix forward references used in `EQU' statements.

