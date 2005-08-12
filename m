From: Lauri Pihlajakangas <lpihlajak@gmail.com>
Subject: Problems with OpenGL asm program.
Date: Fri, 12 Aug 2005 20:00:30 +0300
Message-ID: <9b9a53ad050812100027b53687@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hello. I am learning x86 linux assembly and OpenGL.
I've translated a C-written example from NeHe into my own NASM syntax
asm program.
Problem is that it doesn't work, i've been debugging it for eight
hours now. I think the
problem is in InitGL routine, the gluPerspective() call. Below is part
of gluPerspective() manpage.


NAME
       gluPerspective - set up a perspective projection matrix

C SPECIFICATION
       void gluPerspective( GLdouble fovy,
                            GLdouble aspect,
                            GLdouble zNear,
                            GLdouble zFar )

And..
/usr/include/GL/gl.h:150:typedef double         GLdouble;       /*
double precision float */

Ok, so i translated the gluPerspective(45.0f,1.0f,0.1f,100.0f); C call
into assembly. The code for it is below:

   finit
    
    sub esp,8
    fild qword [d_100.0]
    fstp qword [esp]

    sub esp,8
    fild qword [d_0.1]
    fstp qword [esp]

    fild dword [esp+20] ;width
    fild dword [esp+24] ;height
    sub esp,8
    fdiv st1, st0
    fstp qword [esp] ; BUG?


    sub esp,8
    fild qword [d_45.0]
    fstp qword [esp]
        call gluPerspective
    add esp, 32

I suspect i didn't get this right. I'd greatly appreciate if someone
finds something funny in it. The program runs on my computer fine, and
i'm able to quit it with pressing ESC, but it just wont draw the quad.
 Please report if you find anything obivously wrong in this code,
please. :)

;----gl.inc-------

%define GL_LESS 0201h
%define GL_DEPTH_TEST 0B71h
%define GL_SMOOTH 1D01h
%define GL_PROJECTION 1701h
%define GL_MODELVIEW 1700h

%define GL_POLYGON 0009h
%define GL_LINE_STRIP 0003h
%define GL_QUADS 0007h
%define GL_TRIANGLES 0004h

%define GL_COLOR_BUFFER_BIT 00004000h
%define GL_DEPTH_BUFFER_BIT 00000100h

EXTERN glClear, glClearColor, glClearDepth
EXTERN glColor3f
EXTERN glDepthFunc
EXTERN glEnable
EXTERN glShadeModel
EXTERN glMatrixMode
EXTERN glLoadIdentity
EXTERN glTranslatef
EXTERN glViewport
EXTERN glBegin
EXTERN glEnd
EXTERN glVertex3f
;--- END gl.inc

; --- glut.inc ----------
%define GLUT_RGBA 0000h
%define GLUT_DOUBLE 0002h
%define GLUT_ALPHA 0008h
%define GLUT_DEPTH 0010h

EXTERN glutSwapBuffers
EXTERN glutInit, glutInitWindowSize, glutInitWindowPosition
EXTERN glutInitDisplayMode
EXTERN glutCreateWindow
EXTERN glutDisplayFunc, glutIdleFunc, glutKeyboardFunc
EXTERN glutMainLoop
EXTERN glutDestroyWindow
EXTERN glutFullScreen
EXTERN glViewport
; --- END glut.inc



;---------------------------#
;OGL asm stuff by lpk. 2005.#
;---------------------------#
;nasm -felf test.asm
;ld -lglut -lGL -I/lib/ld-linux.so.2 test.o -e main

%include "gl.inc"
%include "glut.inc"

%define ESCAPE 27 

GLOBAL main
    
EXTERN exit
EXTERN usleep

EXTERN gluPerspective


SECTION .data USE32
title db "Pure NASM syntax assembly linked into C libraries..",0

p_0.0 dd 0.0
p_1.0 dd 1.0
p_45.0 dd 45.0
p_0.1 dd 0.1
p_100.0 dd 100.0
p_3.0 dd 3.0

p_0.5 dd 0.5

n_1.0 dd -1.0
n_1.5 dd -1.5
n_6.0 dd -6.0

d_100.0 dq 100.0
d_0.1 dq 0.1
d_45.0 dq 45.0
;------------------------- Code Section ---
SECTION .text USE32

InitGL: ;--(int Width, int Height)


    sub esp,32
    fldz
    fst qword [esp]
    fst qword [esp]
    fst qword [esp]
    fstp qword [esp]
        call glClearColor
    add esp, 32
    

    fld1
    sub esp,8
    fstp qword [esp]
        call glClearDepth
    add esp, 8
    
    push GL_LESS
        call glDepthFunc
    add esp,4  

    push GL_DEPTH_TEST
        call glEnable
    add esp,4

    push GL_SMOOTH
        call glShadeModel
    add esp,4
    
    push GL_PROJECTION
        call glMatrixMode
    add esp,4
    
        call glLoadIdentity

    finit
    
    sub esp,8
    fild qword [d_100.0]
    fstp qword [esp]

    sub esp,8
    fild qword [d_0.1]
    fstp qword [esp]

    fild dword [esp+20] ;width
    fild dword [esp+24] ;height
    sub esp,8
    fdiv st1, st0
    fstp qword [esp] ; BUG?


    sub esp,8
    fild qword [d_45.0]
    fstp qword [esp]
        call gluPerspective
    add esp, 32

    push GL_MODELVIEW
        call glMatrixMode
    add esp,4

    ret

DrawGLScene:
    push  GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT
        call glClear
    add esp,4

        call glLoadIdentity
    
    push dword [n_6.0]
    push dword [p_0.0]
    push dword [n_1.5]
        call glTranslatef
    add esp,12
    
    push GL_QUADS
        call glBegin
    add esp,4

    push dword [p_0.0]
    push dword [p_1.0]
    push dword [n_1.0]
        call glVertex3f
    add esp,12


    push dword [p_0.0]
    push dword [p_1.0]
    push dword [p_1.0]
        call glVertex3f
    add esp,12

    push dword [p_0.0]
    push dword [n_1.0]
    push dword [p_1.0]
        call glVertex3f
    add esp,12

    push dword [p_0.0]
    push dword [n_1.0]
    push dword [n_1.0]
        call glVertex3f
    add esp,12

        call glEnd
    
        call glutSwapBuffers

    ret 

keyPressed: ;--(unsigned char key, int x, int y)
    push 100
        call usleep
    add esp,4 

    cmp dword [esp+4],ESCAPE
    jnz .escapeFalse
;escape is true
    push dword [window]
        call glutDestroyWindow    
    add esp,4
    push 0
        call exit

    .escapeFalse
    ret 

main:
    mov eax, [esp+4]
    mov ecx, [esp+8]
    mov [argc],eax
    mov [argv],ecx

    push dword [esp+8]
    push argc
        call glutInit
    add esp,8

    push GLUT_RGBA|GLUT_DOUBLE|GLUT_ALPHA|GLUT_DEPTH
        call glutInitDisplayMode
    add esp,4

    push 480
    push 640
        call glutInitWindowSize 
    add esp,8

    push 0
    push 0
        call glutInitWindowPosition
    add esp,8

    push title
        call glutCreateWindow
    mov [window],eax
    add esp,4

    push DrawGLScene
        call glutDisplayFunc
        call glutFullScreen
        call glutIdleFunc
    add esp,4

    push keyPressed
        call glutKeyboardFunc
    add esp,4
    
    push 480
    push 640
        call InitGL
    add esp,8

        call glutMainLoop
    
    ret 1

; ------ end of main 
;------------------ Uninitialized Section ---
SECTION .bss
argc: resd 1
argv: resd 1
fpu_tmp resq 1
window: resd 1
