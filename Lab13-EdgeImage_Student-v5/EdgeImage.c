#include <stdio.h>
#include  <cstdio>
extern EdgeImageSub(int image_width,int image_height,unsigned int* image_buffer,int Threshhold);
extern ShapenImageSub(int image_width,int image_height,unsigned int* image_buffer,unsigned int* image_new);
int ImageWidth,ImageHeight;

void  Read_Grey_Image();
void  Edge_Grey_Image();

unsigned int *buffer_grey,*buffer_org;
int Threshhold;
float alpha;


void main()
{
    buffer_grey =(unsigned int *)0x00010000;
    buffer_org  =(unsigned int *)0x00020000;
    ImageWidth =300;
    ImageHeight=210;
    Threshhold=120;
    
    Read_Grey_Image("butterfly_300_210_grey_CCS",buffer_grey);
    Read_Grey_Image("butterfly_300_210_grey_CCS",buffer_org);
    //Edge_Grey_Image();
    //EdgeImageSub(ImageWidth,ImageHeight,buffer_grey,Threshhold);
    ShapenImageSub(ImageWidth,ImageHeight,buffer_org,buffer_grey);

}


void   Read_Grey_Image(char *FileName,unsigned int *buffer)
{   unsigned int i;
    int  x,y;
    unsigned int r;
    FILE *fp;

    i=0;
	if (fp=fopen(FileName,"rb+"))
	{    for (y=0;y<ImageHeight;y++)
	        for (x=0;x<ImageWidth;x++)
           {   fread(&r,sizeof(r),1,fp);
               buffer[i++]=r;
  
           }
	      fclose(fp);

     }
     else  puts("can't open file\n");
}


void  Edge_Grey_Image()
{   unsigned int i;
    int  x,y,delta_x,delta_y,delta;


//  Ê¹ÓÃRobertsËã×Ó£¬delta_x=|f(x,y)-f(x+1,y+1)|,delta_y=|f(x+1,y)-f(x,y+1)|
    i=0;
    for (y=0;y<ImageHeight;y++)
	    for (x=0;x<ImageWidth;x++)
        {   delta_x=abs(buffer_org[i]-buffer_org[i+ImageWidth+1]);
            delta_y=abs(buffer_org[i+1]-buffer_org[i+ImageWidth]);
            delta=delta_x+delta_y;
            if (delta>=Threshhold)  buffer_grey[i++]=255;
            else                    buffer_grey[i++]=0;
        }

}
