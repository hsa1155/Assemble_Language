    .section .text
    .global main
    .type main,%function
main:
    mov r1,#1   @r1=1
    mov r2,#2   @r2=2
    mov r3,#3   @r3=3
    mov r0,#0   @r0=0
    add r1,r1,r1 @r1=r1+r1
    add r2,r2,r2,LSL #1 @r2=r2+r2*2
    mov r3,r3,LSL #2 @r3=r3*2^2
    add r0,r1,r2 @r0=r1+r2
    add r0,r0,r3 @r0=r0+r3
    nop
    .end
