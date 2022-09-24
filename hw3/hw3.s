/*
3333
2222
1111
3*4 a


111
222
333
444
4*3 b
 */
 @data
 .data
 .align 4

 @b矩陣
.type a,%object
.size a,48
a:
    .word 3
    .word 3
    .word 3
    .word 3
    .word 2
    .word 2
    .word 2
    .word 2
    .word 1
    .word 1
    .word 1
    .word 1
@b矩陣
.type b,%object
.size b,48
b:
    .word 1
    .word 1
    .word 1
    .word 2
    .word 2
    .word 2
    .word 3
    .word 3
    .word 3
    .word 4
    .word 4
    .word 4
c:
    .space 36,0

.section .text
	.global main
	.type main,%function
.matrix:
	.word a
	.word b
	.word c
main:
    ldr r0,.matrix @r0=mem a[0][0]
    ldr r1,.matrix+4 @r1=mem b[0][0]
    ldr r2,.matrix+8 @r2=mem c[0][0]
    
    mov r3,#0 @r3=0用來存內積運算值
    ldr r4,[r0] @r4=a[0][0]
    ldr r5,[r1] @r5=b[0][0]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#4] @r4=a[0][1]
    ldr r5,[r1,#12] @r5=b[1][0]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#8] @r4=a[0][2]
    ldr r5,[r1,#24] @r5=b[2][0]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#12] @r4=a[0][3]
    ldr r5,[r1,#36] @r5=b[3][0]
    mul r6,r4,r5
    add r3,r3,r6
    str r3,[r2],#4 @c[0][0]=r3 r2=mem c[0][1]

    mov r3,#0 @r3=0用來存內積運算值
    ldr r4,[r0] @r4=a[0][0]
    ldr r5,[r1,#4] @r5=b[0][1]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#4] @r4=a[0][1]
    ldr r5,[r1,#16] @r5=b[1][1]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#8] @r4=a[0][2]
    ldr r5,[r1,#28] @r5=b[2][1]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#12] @r4=a[0][3]
    ldr r5,[r1,#40] @r5=b[3][1]
    mul r6,r4,r5
    add r3,r3,r6
    str r3,[r2],#4 @c[0][1]=r3 r2=mem c[0][2]

    mov r3,#0 @r3=0用來存內積運算值
    ldr r4,[r0] @r4=a[0][0]
    ldr r5,[r1,#8] @r5=b[0][2]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#4] @r4=a[0][1]
    ldr r5,[r1,#20] @r5=b[1][2]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#8] @r4=a[0][2]
    ldr r5,[r1,#32] @r5=b[2][2]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#12] @r4=a[0][3]
    ldr r5,[r1,#44] @r5=b[3][2]
    mul r6,r4,r5
    add r3,r3,r6
    str r3,[r2],#4 @c[0][2]=r3 r2=mem c[1][0]

    mov r3,#0 @r3=0用來存內積運算值
    ldr r4,[r0,#16] @r4=a[1][0]
    ldr r5,[r1] @r5=b[0][0]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#20] @r4=a[1][1]
    ldr r5,[r1,#12] @r5=b[1][0]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#24] @r4=a[1][2]
    ldr r5,[r1,#24] @r5=b[2][0]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#28] @r4=a[1][3]
    ldr r5,[r1,#36] @r5=b[3][0]
    mul r6,r4,r5
    add r3,r3,r6
    str r3,[r2],#4 @c[1][0]=r3 r2=mem c[1][1]

    mov r3,#0 @r3=0用來存內積運算值
    ldr r4,[r0,#16] @r4=a[1][0]
    ldr r5,[r1,#4] @r5=b[0][1]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#20] @r4=a[1][1]
    ldr r5,[r1,#16] @r5=b[1][1]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#24] @r4=a[1][2]
    ldr r5,[r1,#28] @r5=b[2][1]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#28] @r4=a[1][3]
    ldr r5,[r1,#40] @r5=b[3][1]
    mul r6,r4,r5
    add r3,r3,r6
    str r3,[r2],#4 @c[1][1]=r3 r2=mem c[1][2]

    mov r3,#0 @r3=0用來存內積運算值
    ldr r4,[r0,#16] @r4=a[1][0]
    ldr r5,[r1,#8] @r5=b[0][2]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#20] @r4=a[1][1]
    ldr r5,[r1,#20] @r5=b[1][2]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#24] @r4=a[1][2]
    ldr r5,[r1,#32] @r5=b[2][2]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#28] @r4=a[1][3]
    ldr r5,[r1,#44] @r5=b[3][2]
    mul r6,r4,r5
    add r3,r3,r6
    str r3,[r2],#4 @c[1][2]=r3 r2=mem c[2][0]

    mov r3,#0 @r3=0用來存內積運算值
    ldr r4,[r0,#32] @r4=a[2][0]
    ldr r5,[r1] @r5=b[0][0]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#36] @r4=a[2][1]
    ldr r5,[r1,#12] @r5=b[1][0]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#40] @r4=a[2][2]
    ldr r5,[r1,#24] @r5=b[2][0]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#44] @r4=a[2][3]
    ldr r5,[r1,#36] @r5=b[3][0]
    mul r6,r4,r5
    add r3,r3,r6
    str r3,[r2],#4 @c[2][0]=r3 r2=mem c[2][1]

    mov r3,#0 @r3=0用來存內積運算值
    ldr r4,[r0,#32] @r4=a[2][0]
    ldr r5,[r1,#4] @r5=b[0][1]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#36] @r4=a[2][1]
    ldr r5,[r1,#16] @r5=b[1][1]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#40] @r4=a[2][2]
    ldr r5,[r1,#28] @r5=b[2][1]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#44] @r4=a[2][3]
    ldr r5,[r1,#40] @r5=b[3][1]
    mul r6,r4,r5
    add r3,r3,r6
    str r3,[r2],#4 @c[2][1]=r3 r2=mem c[2][2]

    mov r3,#0 @r3=0用來存內積運算值
    ldr r4,[r0,#32] @r4=a[2][0]
    ldr r5,[r1,#8] @r5=b[0][2]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#36] @r4=a[2][1]
    ldr r5,[r1,#20] @r5=b[1][2]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#40] @r4=a[2][2]
    ldr r5,[r1,#32] @r5=b[2][2]
    mul r6,r4,r5
    add r3,r3,r6

    ldr r4,[r0,#44] @r4=a[2][3]
    ldr r5,[r1,#44] @r5=b[3][2]
    mul r6,r4,r5
    add r3,r3,r6
    str r3,[r2] @c[2][2]=r3 

    ldr r1,.matrix+8

    LDMIA r1,{r2,r3,r4,r5,r6,r7,r8,r9,r10}    
    ldr r1,.matrix+8@r1=mem c[0][0]

    nop


@0x1e=30
@0x14=20
@0xa=10