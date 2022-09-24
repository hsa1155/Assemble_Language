.section .text
	.global main
	.type main,%function
main:
    mov r1,#1
    mov r2,#2
    add r0,r1,r2
    mov r0,#4
    mov r1,#1
    mov r2,#2
    adds r0,r1,r2
    addeq r5,r1,r2
    mov r5,#0
    cmp r1,r2
    addeq r5,r1,r2
    mov r5,#0
    mov r3,#3

    cmp r0,r3
    addeq r5,r1,r2
    nop
