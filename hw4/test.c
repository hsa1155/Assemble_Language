#include<stdio.h>
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

int main(void)
{
    int arr[7]={5,3,1,7,2,4,6};
    Bubsort(arr,7);
    int i;
    for(i=0;i<7;i++) printf("%d ",arr[i]);

}