;��ϱ��ʵ�����ݣ�
;1��ע��۲����ͱ�������Ӧ Tx �Ĵ����е�ֵ��
;2��ע��۲�����ָ������Ӧ XARx �Ĵ����е�ֵ��
;3����д�Ӽ��˳��ӳ���a��b����Ϊ�Ӽ��˳�Դ��������
;4���Ӽ��˳��Ľ�������buffer1�����У�
;      buffer1[0]=�ӷ����
;      buffer1[1]=�������
;      buffer1[2]=�˷����
;      buffer1[3]=�������
;      buffer1[4]=��������
;5��mySub�ӳ��򷵻س˷������
;6����mySub�иı�ȫ�ֱ���k�����ݣ���C�й۲�仯
;7����C�������д�ӡ��Ӧ�����


         .mmregs
         .def  _mySub
         .bss  x,1
         .bss  y,1    
         .bss  _k,1
         .global  _k                      ;kǰ��_������
         
         .text
_mySub:  amov #x,xar5                     ;x variable address
         mov  t0,*ar5
         amov #y,xar6
         mov  t1,*ar6
                    
         mov  #1234,*(_k)      
          
         
         call addition
         call subtraction
         call multiplication
         call division

         sub #2,ar0                          ;return result of multiplication
         mov *ar0,t0

         ret         
         
         
;a->t0, b->t1
;��������[b,a]֮�������ĺ�
addition:
		mov #0,ac2
		sub t1,t0
		mov t0,BRC0
		rptblocal ADD_DATA
		add t1,ac2
ADD_DATA: add #1,t1
		mov ac2,*ar0+
      ret

;���� a-b�Ľ��
subtraction:
     	mov *ar5,ac0
     	mov *ar6,ac1
     	sub ac1,ac0
     	mov ac0,*ar0+
      ret

;���� a*b�Ľ��
multiplication:
		mov *ar6,t1
		mpym *ar5,t1,ac0
		mov ac0,*ar0+
      ret          
         
;���� a/b�Ľ��
division:
        mov *ar5,ac0
        rpt #15
        subc *ar6,ac0
		mov ac0,*ar0+
		mov hi(ac0),*ar0
      ret
