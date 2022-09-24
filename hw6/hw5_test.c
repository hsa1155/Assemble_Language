#include<stdio.h>
#include<stdlib.h>
extern int* NumSort(int, int*,int,int*);
int main()
{
    int arr[7];
    arr[0]=5;
    arr[1]=4;
    arr[2]=7;
    arr[3]=2;
    arr[4]=6;
    arr[5]=1;
    arr[6]=3;
    int len=7;
    int sp=1;
    int* brr=(int*)malloc(len*sizeof(int));
    brr=NumSort(len,arr,1,brr);

    int i;
    for(i=0;i<len;i++) printf("%d ",brr[i]);
}

/*
asm
    (
    "MOV ip, sp\n\t"
    "STMFD sp!, {fp, ip, lr, pc}\n\t"
    "SUB fp, ip, #4\n\t"

    "mov r0,%2\n\t"
    "ldr r1,%1\n\t"
    "ldr r3,%3\n\t"


    "bl NumSort\n\t"

    "LDMEA fp, {fp, sp, pc}"

    :"=r"(brr)//%0
    :"r"(arr),"r"(len),"r"(brr)//%1 %2 %3
    :"r0","r1","r3","ip","fp","sp","pc"//放在input output裡面的都要

    
    );
*/