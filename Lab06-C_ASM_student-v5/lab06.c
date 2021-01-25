
#include  <stdio.h>
#include  <cstdio>

#define BUFSIZE 100
int buffer1[BUFSIZE];
int buffer2[BUFSIZE];
int buffer3[BUFSIZE];

  
extern int mySub(int a,int b,int* c,int* d,int* e);


void main(void)
{
	extern  int k;
	int a,b,c;

	k=0;
	c=0;
	a=102;
	b=9;
	c=mySub(a,b,buffer1,buffer2,buffer3);       /*返回乘法结果*/

	printf("addition       result is: %d\n",buffer1[0]);
	printf("subtraction    result is: %d\n",buffer1[1]);
	printf("multiplication result is: %d\t%d\n",buffer1[2],c);
	printf("division       result is: %d\t%d\n",buffer1[3],buffer1[4]);
	printf("k              result is: %d\n",k);

}

