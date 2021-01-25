;_MedianImageSub(ImageWidth,ImageHeight,buffer_org,buffer_grey);
;入口参数：T0=ImageWidth,T1=ImageHeight
;AR0=buffer_org,AR1=buffer_grey


         .mmregs
         .def  _MedianImageSub
         .bss  TEMP,1
         .text

_MedianImageSub:
		 SUB	#3,T0,T2		;循环次数=图片宽度-1-2（第一行和最后一行）
		 MOV	T2,BRC1    		;内循环，x方向
		 SUB	#3,T1,T3
         MOV	T3,BRC0    		;外循环，y方向

         ADD	T0,AR0
         ADD	T0,AR1
         ADD	#1,AR0
         ADD	#1,AR1			;AR0,AR1->f(1,1)
 		 RPTB	Y_LOOP
         RPTB	X_LOOP

         ;将像素值存到寄存器AC0,AC1,AC2中
         MOV	*AR0(#-1),AC0	;AC0=f(x-1,y)
         MOV	*AR0+,AC1		;AC1=f(x,y), AR0->f(x+1,y)
         MOV	*AR0,AC2		;AC2=f(x+1,y)

         ;比较AC0,AC1,AC2的大小，并进行排序，使得AC0>AC1>AC2
         CMP	AC0>=AC1,TC1	;比较AC0和AC1，并将大的放在AC0中，小的放在AC1中
         BCC	CONT1,TC1
         MOV	AC0,AC3
         MOV	AC1,AC0
         MOV	AC3,AC1			;AC0>AC1
CONT1:   CMP	AC1>=AC2,TC2	;比较AC1和AC2，并将大的放在AC1中，小的放在AC2中
         BCC	CONT2,TC2
         MOV	AC1,AC3
         MOV	AC2,AC1
         MOV	AC3,AC2			;AC1>AC2，此时AC2为最小值
CONT2:   CMP	AC0>=AC1,TC1	;比较AC0和AC1，并将大的放在AC0中，小的放在AC1中
		 BCC	X_LOOP,TC1
         MOV	AC0,AC3
         MOV	AC1,AC0
         MOV	AC3,AC1			;AC0>AC1>AC2，排序完成

X_LOOP:  MOV	AC1,*AR1+		;将中值AC1存入buffer_grey中

		 ADD	#2,AR0
Y_LOOP:  ADD	#2,AR1			;跳过最后一列和第一列


         RET



