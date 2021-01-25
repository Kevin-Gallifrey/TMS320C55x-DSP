;ShapenImageSub(ImageWidth,ImageHeight,buffer_org,buffer_grey);
;入口参数：T0=ImageWidth,T1=ImageHeight
;          AR0=buffer_org,AR1=buffer_grey

         .mmregs
         .def  _ShapenImageSub
         .bss  TEMP,1
         .text
_ShapenImageSub:
		 SUB	#3,T0,T2		;循环次数=图片宽度-1-2（第一行和最后一行）
		 MOV	T2,BRC1    		;内循环，x方向
		 SUB	#3,T1,T3
         MOV	T3,BRC0    		;外循环，y方向

		 MOV	#1,AC0
         SFTL	AC0,#2
         SFTL	AC0,#-2			;AC0=4*alpha
         ADD	#1,AC0			;AC0=1+4*alpha
         MOV	AC0,T2

         ADD	T0,AR0
         ADD	T0,AR1
 		 RPTB	Y_LOOP
         RPTB	X_LOOP
         ADD	#1,AR0
         MPYM	*AR0,T2,AC2	;AC2=AC1*f(x,y)	AR0->f(x,y)
         SUB	T0,AR0
         MOV	*AR0(#-1),AC3	;AC3=f(x-1,y-1)
         ADD 	*AR0(#1),AC3	;AC3=f(x-1,y-1)+f(x+1,y-1)
         ADD	T0,AR0
         ADD	T0,AR0
         ADD 	*AR0(#-1),AC3	;AC3=f(x-1,y-1)+f(x+1,y-1)+f(x-1,y+1)
         ADD 	*AR0(#1),AC3	;AC3=f(x-1,y-1)+f(x+1,y-1)+f(x-1,y+1)+f(x+1,y+1)
         SUB	T0,AR0
         SFTL	AC3,#-2			;AC3=alpha*AC3
         SUB	AC3,AC2			;AC2=AC2-AC3 AC2=g(x,y)

         BCC	CONT1,AC2>=#0		;灰度>=0
         MOV	#0,AC2
CONT1:   MOV	#255,AC1
   		 CMP	AC2<=AC1,TC1		;灰度<=255
   		 BCC	CONT2,TC1
         MOV	#255,AC2
CONT2:	 ADD	#1,AR1
X_LOOP:  MOV	AC2,*AR1

		 ADD	#2,AR0
Y_LOOP:  ADD	#2,AR1

         RET


