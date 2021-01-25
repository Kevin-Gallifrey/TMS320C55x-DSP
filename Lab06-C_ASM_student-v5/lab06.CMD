
-c		    
-l rts55x.lib

MEMORY
{
   DARAM:      origin = 0x200,         len = 0x7e00
   SARAM:      origin = 0x10000,       len = 0x40000
   VECT:       origin = 0x100,         len = 0x100
	
				
}

SECTIONS
{
	.cinit	:    {} > SARAM
	.bss	:    {} > SARAM	
	.text	:    {} > SARAM	

	.stack	:    {} > DARAM	
	.const	:    {} > DARAM
}
