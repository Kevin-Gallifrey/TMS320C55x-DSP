;_SmoothImageSub(ImageWidth,ImageHeight,buffer_org,buffer_grey);
;入口参数：T0=ImageWidth,T1=ImageHeight
;AR0=buffer_org,AR1=buffer_grey


         .mmregs
         .def  _SmoothImageSub
         .bss  TEMP,1
         .text

_SmoothImageSub:
		 SUB	#3,T0,T2		;循环次数=图片宽度-1-2（第一行和最后一行）
		 MOV	T2,BRC1    		;内循环，x方向
		 SUB	#3,T1,T3
         MOV	T3,BRC0    		;外循环，y方向

		 AMOV 	#010000h,XAR2
		 MOV	#7,*AR2

         ADD	T0,AR0
         ADD	T0,AR1
         ADD	#1,AR1
 		 RPTB	Y_LOOP
         RPTB	X_LOOP
         MOV	*(AR0+T0),AC0	;AC0=f(x-1,y), AR0->f(x-1,y+1)
         MOV	*AR0+,AC1		;AC1=f(x-1,y+1), AR0->f(x,y+1)
         SFTL	AC1,#-1			;AC1=AC1/2
         ADD	AC1,AC0			;AC0=f(x-1,y)+f(x-1,y+1)/2
         ADD	*(AR0-T0),AC0	;AC0=f(x-1,y)+f(x-1,y+1)/2+f(x,y+1), AR0->f(x,y)
         MOV	*(AR0-T0),AC1	;AC1=f(x,y), AR0->f(x,y-1)
         SFTL	AC1,#2			;AC1=AC1*4
         ADD	AC1,AC0			;AC0=f(x-1,y)+f(x-1,y+1)/2+f(x,y+1)+4*f(x,y)
         MOV	*AR0(#1),AC1	;AC1=f(x,y-1), AR0->f(x,y-1)
         SFTL	AC1,#-1			;AC1=AC1/2
         ADD	AC1,AC0			;AC0=f(x-1,y)+f(x-1,y+1)/2+f(x,y+1)+4*f(x,y)+f(x+1,y-1)/2
         ADD	T0,AR0			;AR0->f(x,y)

         RPT	#15
         SUBC 	*AR2,AC0 			;利用循环SUBC，进行除法操作, AC0=AC0/*AR2
         and 	#0xffff, AC0		;取低16位（商）

X_LOOP:  MOV	AC0,*AR1+

		 ADD	#2,AR0
Y_LOOP:  ADD	#2,AR1

         RET



