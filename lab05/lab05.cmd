
MEMORY
{
	DARAM: o=0x100, l=0x7f00
	DARAM2: o=0x8000, l=0x8000
}

SECTIONS
{
	.text: {} > DARAM
	.bss:  {} > DARAM
	.stack {} > DARAM
}

