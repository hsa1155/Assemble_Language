.section .text
.global NumSort
.type NumSort,%function

NumSort:
    MOV ip, sp
    STMFD sp!, {fp, ip, lr, pc}
    SUB fp, ip, #4

    mov r4,#0
loopb://把a內容放進b
    cmp r4,r0//i<n?
    bge exitb
    mov r6,r4,lsl #2
    ldr r7,[r1,r6]
    str r7,[r3,r6]

    add r4,r4,#1
    b loopb
exitb:
    sub r4,r0,#1
loopi://for (i=n-1; i>=0; i--)//{
    cmp r4,#0 //i<=0?
    blt exiti //i<0 break
    mov r2,#1//sp=1
    
    mov r5,#0//r5=j=0
loopj://for (j =0; j <i; j++)
    cmp r5,r4
    bge exitj

    mov r6,r5,lsl #2
    ldr r7,[r3,r6] //r7=a[j]
    add r6,r6,#4
    ldr r8,[r3,r6] //r8=a[j+1]
    cmp r7,r8
    bge endif//a[j]>=a[j+1] jump 2 endif
    mov r6,r7 //tmp=a[j]
    mov r7,r8 //a[j]=a[j]+1
    mov r8,r6 //a[j+1]=a[j]
    mov r6,r5,lsl #2
    str r7,[r3,r6] //input result
    add r6,r6,#4
    str r8,[r3,r6] //input result
    mov r2,#0


endif:
    add r5,r5,#1//j++
    b loopj
exitj:
    cmp r2,#1
    beq exiti//if sp==1 break;
    sub r4,r4,#1//i--
    b loopi
exiti:
    nop
//}

    nop
    nop
    nop
    mov r0,r3 
    ldmea r0,{r4-r10}
    LDMEA fp, { fp, sp, pc}
    nop
    
    

/*
r0=size(n)
r1=arr[0]address(A[])
r2=sp
r3=brr[0]address
r4=i
r5=j
r6=tmp
r7=b[j]
r8=b[j+1]
 */

/*
BubSort(int A[], int n)  //氣泡排序法之副程式

  {

    int i, j , Temp,sp;

    for (i=n-1; i>=0; i--)

       {

        sp=1;

       for (j =0; j <i; j++)

          if (A[j] < A[j+1])

             {  //兩數交換位置

               Temp = A[j];

               A[j] = A[j+1];

               A[j+1] = Temp;

               sp=0;

             }

             if (sp==1) break;

       }

  }

 */