#include<stdio.h>
#include<stdlib.h>
int* numsort(int n, int a[])  //氣泡排序法之副程式

{

    int *A=malloc(n*sizeof(int));
    int k,i, j, Temp,sp;
    for(k=0; k<n; k++)A[k]=a[k];
    for(i=0;i<n;i++) printf("%d ",A[i]);
    printf("\n");
    for (i = 0; i < n; ++i) {
    for (j = 0; j < i; ++j) {
      if (A[j] < A[i]) {
        Temp = A[j];
        A[j] = A[i];
        A[i] = Temp;
      }
    }
  }
    /*
    for (i=n-1; i>=0; i--)

    {

        sp=1;

        for (j =0; j <i; j++)

        {
            if (A[j] < A[j+1])

            {
                //兩數交換位置

                Temp = A[j];

                A[j] = A[j+1];

                A[j+1] = Temp;

                sp=0;
                printf("fuck\n");

            }

            if (sp==1) break;
        }

    }
    */

    for(i=0;i<n;i++) printf("%d ",A[i]);
    printf("\n");
    return A;

}
