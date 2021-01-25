;EdgeImageSub(ImageWidth,ImageHeight,buffer_grey,Threshhold);
;入口参数：T0=ImageWidth,T1=ImageHeight
;          AR0=buffer_grey,AR1=Threshhold
;将C语言编写的Roberts算法移植到5509汇编_EdgeImageSub中

         .mmregs
         .def  _EdgeImageSub
         .bss  TEMP,1
         .text
_EdgeImageSub:
         MOV	T0,BRC0    		;IMAGE WIDTH
         MOV	T1,BRC1    		;IMAGE HEIGHT
 		 RPTB	LOOP
         RPTB	LOOP
         MOV	XAR0,XAR2		;计算delta时用ar2作为地址
         MOV 	*AR2+,AC0		;AC0=f(x,y)
         MOV	*(AR2+T0),AC1	;AC1=f(x+1,y)
         MOV	*AR2-,AC2		;AC2=f(x+1,y+1)
         MOV	*AR2,AC3		;AC3=f(x,y+1)
         SUB	AC0,AC2
         ABS	AC2,T2			;T2=delta_x
         SUB	AC1,AC3
         ABS	AC3,T3			;T3=delta_y
         ADD	T2,T3			;T3=delta
         CMP	T3>=AR1,TC1
         BCC	EDGE,TC1
         MOV	#0,AC0
         B		LOOP
EDGE:	 MOV	#255,AC0
LOOP:	 MOV	AC0,*AR0+

         RET 
 	            

