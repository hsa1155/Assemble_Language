#include<stdio.h>
#include<xmmintrin.h>
#include<stdlib.h>
#include<time.h>
struct timespec diff(struct timespec start, struct timespec end) {
  struct timespec temp;
  if ((end.tv_nsec-start.tv_nsec)<0) {
    temp.tv_sec = end.tv_sec-start.tv_sec-1;
    temp.tv_nsec = 1000000000+end.tv_nsec-start.tv_nsec;
  } else {
    temp.tv_sec = end.tv_sec-start.tv_sec;
    temp.tv_nsec = end.tv_nsec-start.tv_nsec;
  }
  return temp;
}
int main()
{
    float A[200][204];;
    float B[200];
    struct timespec time1, time2;
    clock_gettime(CLOCK_MONOTONIC, &time1);
    FILE *fp;
    fp=fopen("data.txt","r");
    for(int i=0; i<200; i++)
    {
        for(int j=0; j<204; j++)
        {
            if(j==202||j==203)
            {
                A[i][j]=0;
                continue;
            }
            fscanf(fp,"%f",&A[i][j]);
        }
    }
    clock_gettime(CLOCK_MONOTONIC, &time2);

    printf("scanf time=%lf\n", (double)diff(time1,time2).tv_nsec);
    clock_gettime(CLOCK_MONOTONIC, &time1);
    for(int i=0;i<200;i++)
    {
        float A1[204] __attribute__ ((aligned(16)));
        for(int k=0;k<204;k++) A1[k]=A[i][k];
        __m128 *a;
        a=(__m128*)A1;
        float sum=0;
        for(int j=0;j<200;j++)
        {
            float B1[204] __attribute__ ((aligned(16)));
            for(int k=0;k<204;k++) B1[k]=A[j][k];
            __m128 *b;
            b=(__m128*)B1;
            for(int k=0;k<50;k++)
            {
                float tmp[4];
                _mm_store_ps(tmp,_mm_mul_ps(a[k], b[k]));
                sum+=tmp[0];
                sum+=tmp[1];
                sum+=tmp[2];
                sum+=tmp[3];

            }
            sum+=A[i][200]*A[j][200];
            sum+=A[i][201]*A[j][201];
        }

        B[i]=sum;


    }
    clock_gettime(CLOCK_MONOTONIC, &time2);
    printf("computation time=%lf\n", (double)diff(time1,time2).tv_nsec);
    clock_gettime(CLOCK_MONOTONIC, &time1);
    fp=fopen("out2.txt","w");

    for(int i=0;i<200;i++)
    {
            fprintf(fp,"%.1f\n",B[i]);
    }
    clock_gettime(CLOCK_MONOTONIC, &time2);
    printf("write time=%lf\n", (double)diff(time1,time2).tv_nsec);
}