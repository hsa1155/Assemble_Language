#define _POSIX_C_SOURCE 200809L
#include<stdio.h>
#include<xmmintrin.h>
#include<stdlib.h>
#include<time.h>
#include<math.h>



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
    float arr[200][202];
    float brr[200];
    struct timespec time1, time2;
    clock_gettime(CLOCK_MONOTONIC, &time1);
    
    FILE *fp;

    fp=fopen("data.txt","r");
    for(int i=0;i<200;i++)
    {
        for(int j=0;j<202;j++)  fscanf(fp,"%f",&arr[i][j]);
    }
    fclose(fp);
    clock_gettime(CLOCK_MONOTONIC, &time2);

    printf("scanf time=%lf\n", (double)diff(time1,time2).tv_nsec);
    clock_gettime(CLOCK_MONOTONIC, &time1);
    for(int i=0;i<200;i++)
    {
        float sum=0;
        for(int j=0;j<200;j++)
        {
            for(int k=0;k<202;k++)
            {
                sum+=arr[i][k]*arr[j][k];
            }
        }
        brr[i]=sum;
    }
    clock_gettime(CLOCK_MONOTONIC, &time2);
    printf("computation time=%lf\n", (double)diff(time1,time2).tv_nsec);
    clock_gettime(CLOCK_MONOTONIC, &time1);
    fp=fopen("out1.txt","w");
    for(int i=0;i<200;i++)
    {
            fprintf(fp,"%.1f\n",brr[i]);
    }
    clock_gettime(CLOCK_MONOTONIC, &time2);
    printf("write time=%lf\n", (double)diff(time1,time2).tv_nsec);
}