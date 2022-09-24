.section .text
	.global main
	.type main,%function
main:
    mov r0,#1
    mov r1,#2
    mov r2,#3
    mov r3,#4

    add r2,r2,r0
    add r3,r3,r1

    mov r0,#1
    mov r1,#2
    mov r2,#3
    mov r3,#4

    adds r2,r2,r0
    add r3,r3,r1

    mov r0,#1
    mov r1,#2
    mov r2,#3
    mov r3,#4

    adds r2,r2,r0
    adc r3,r3,r1

    mov r0,#1
    mov r1,#2
    mov r2,#3
    mov r3,#4

    adc r3,r3,r1
    nop
    
