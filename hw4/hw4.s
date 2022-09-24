 .data
 .align 4
 .type arr,%object
 .size arr,28
    arr:
        .word 5
        .word 4
        .word 2
        .word 7
        .word 1
        .word 3
        .word 6

 .type brr,%object
 .size brr,28
 brr:
    .word
    .word
    .word
    .word
    .word
    .word
    .word
    
    

.section .text
	.global main
	.type main,%function
.array:
    .word arr
    .word brr

main:
    MOV ip, sp
    STMFD sp!, {fp, ip, lr, pc}
    SUB fp, ip, #4

    mov r0,#7
    ldr r1,.array
    ldr r3,.array+4


    bl NumSort

    LDMEA fp, {fp, sp, pc}

    

    MOV r0,r0

    .end
