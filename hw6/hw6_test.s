.set SWI_Write, 0x5
.set SWI_Open, 0x1
.set SWI_Close, 0x2
.set AngelSWI, 0x123456
    .data
    .align 4
filename:
	.ascii "result.txt\000"
eof:
    .ascii "\0"
format:
    .ascii "%d\n"

    .section .text
    .global main
    .type main,%function
    .open_param:
	    .word filename
	    .word 0x4
	    .word 0xa
    .write_param:
	    .space 4   /* file descriptor */
	    .space 4   /* address of the string */
	    .space 4   /* length of the string */
    .close_param:
	    .space 4
    .sstr:
        .word format 
    .ed_str:
        .word eof
main:
    

    MOV ip, sp
    STMFD sp!, {fp, ip, lr, pc}
    SUB fp, ip, #4
    //start of int* malloc(int)
    
    mov r0,#40
    bl malloc
    mov r7,r0

    

    //end of malloc

    

  //start of int rand()
    mov r5,#0
    mov r6,#0   
    
rng:
    cmp r5,#10//r5<10?
    bge exitrng

    bl rand //r0 =rng num

    mov r6,r5,lsl #2//r6=4*counter
    str r0,[r7,r6] //store into arr
    //str r5,[r7,r6]//debug
    add r5,r5,#1
    
    b rng
exitrng:
   
    
    //end of rand

    mov r0,#10
    mov r1,r7
    bl numsort //int* numsort(int size,int* arr[])
    
    mov r8,r0
    
    ldmia r0,{r1-r6}
    nop
    ldmia r7,{r1-r6}
    nop

    //end of sort
    //start of output
    //start of open file
    mov r0, #SWI_Open
	adr r1, .open_param
	swi AngelSWI
	mov r6, r0
    //end of open file
    //start of write

    mov r0,#120
    bl malloc
    mov r5,r0//to store string to output
    mov r4,#0

gen_str://gen int to string and append to r5
    cmp r4,#10
    bge exit_gen
 
    mov r0,#11 
    mov r9,r4,lsl #2
    bl malloc
    mov r10,r0
    ldr r1,.sstr
    ldr r2,[r8,r9]
    bl sprintf //r0=int to string
    
    mov r1,r10
    mov r0,r5
    bl strcat

    add r4,r4,#1
    b gen_str

exit_gen:
    ldr r1,.ed_str
    mov r0,r5
    bl strcat
    mov r0,r5
    bl strlen
    mov r3,r0


    adr r1, .write_param
	str r6, [r1, #0]          /* store file descriptor */
	
	
	str r5, [r1, #4]          /* store the address of string */

	
    mov r3,r3
	str r3, [r1, #8]          /* store the length of the string */

	mov r0, #SWI_Write
	swi AngelSWI

    //end of write
    //start of close
    adr r1, .close_param
	str r6, [r1, #0]
    mov r0, #SWI_Close
	swi AngelSWI


    LDMEA fp, {fp, sp, pc}
    nop
    .end


/*

size=n=10
r7=arr[] location
r8=brr[] loaction
r5=loop counter before sort =address of str after sort
r6=tmp before sort r6=file descriptor arfter sort
r10=small tmp str
 */