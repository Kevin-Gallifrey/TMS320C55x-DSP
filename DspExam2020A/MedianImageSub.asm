;_MedianImageSub(ImageWidth,ImageHeight,buffer_org,buffer_grey);
;��ڲ�����T0=ImageWidth,T1=ImageHeight
;AR0=buffer_org,AR1=buffer_grey


         .mmregs
         .def  _MedianImageSub
         .bss  TEMP,1
         .text

_MedianImageSub:
		 SUB	#3,T0,T2		;ѭ������=ͼƬ���-1-2����һ�к����һ�У�
		 MOV	T2,BRC1    		;��ѭ����x����
		 SUB	#3,T1,T3
         MOV	T3,BRC0    		;��ѭ����y����

         ADD	T0,AR0
         ADD	T0,AR1
         ADD	#1,AR0
         ADD	#1,AR1			;AR0,AR1->f(1,1)
 		 RPTB	Y_LOOP
         RPTB	X_LOOP

         ;������ֵ�浽�Ĵ���AC0,AC1,AC2��
         MOV	*AR0(#-1),AC0	;AC0=f(x-1,y)
         MOV	*AR0+,AC1		;AC1=f(x,y), AR0->f(x+1,y)
         MOV	*AR0,AC2		;AC2=f(x+1,y)

         ;�Ƚ�AC0,AC1,AC2�Ĵ�С������������ʹ��AC0>AC1>AC2
         CMP	AC0>=AC1,TC1	;�Ƚ�AC0��AC1��������ķ���AC0�У�С�ķ���AC1��
         BCC	CONT1,TC1
         MOV	AC0,AC3
         MOV	AC1,AC0
         MOV	AC3,AC1			;AC0>AC1
CONT1:   CMP	AC1>=AC2,TC2	;�Ƚ�AC1��AC2��������ķ���AC1�У�С�ķ���AC2��
         BCC	CONT2,TC2
         MOV	AC1,AC3
         MOV	AC2,AC1
         MOV	AC3,AC2			;AC1>AC2����ʱAC2Ϊ��Сֵ
CONT2:   CMP	AC0>=AC1,TC1	;�Ƚ�AC0��AC1��������ķ���AC0�У�С�ķ���AC1��
		 BCC	X_LOOP,TC1
         MOV	AC0,AC3
         MOV	AC1,AC0
         MOV	AC3,AC1			;AC0>AC1>AC2���������

X_LOOP:  MOV	AC1,*AR1+		;����ֵAC1����buffer_grey��

		 ADD	#2,AR0
Y_LOOP:  ADD	#2,AR1			;�������һ�к͵�һ��


         RET



