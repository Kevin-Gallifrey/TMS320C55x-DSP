#include <stdio.h>

extern MedianImageSub(int image_width,int image_height,unsigned char* buffer_org,unsigned char* buffer_grey);


unsigned int ImageWidth,ImageHeight;


static  Read_Grey_Image();
unsigned char *buffer_org,*buffer_grey;


void main()
{


    buffer_org =(unsigned char *)0x00010000;
    buffer_grey=(unsigned char *)0x00020000;

    ImageWidth =200;
    ImageHeight=300;

    Read_Grey_Image("2020A_200_300_GreyCCS",buffer_org);
    MedianImageSub(ImageWidth,ImageHeight,buffer_org,buffer_grey);

}


static  Read_Grey_Image(char *FileName,unsigned char *buffer)
{   unsigned int i;
    int  x,y;
    unsigned char r;
    FILE *fp;

    i=0;
	if (fp=fopen(FileName,"rb+"))
	{    puts("reading data\n");
	     for (y=0;y<ImageHeight;y++)
	        for (x=0;x<ImageWidth;x++)
           
           {  fread(&r,sizeof(r),1,fp);
              buffer[i++]=r;
  
           }
	   fclose(fp);

     }
     else  puts("can't open file\n");
}




