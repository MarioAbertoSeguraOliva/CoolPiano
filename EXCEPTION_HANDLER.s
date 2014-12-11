.section .exceptions, "ax"
	.global EXCEPTION_HANDLER
	
EXCEPTION_HANDLER:
	rdctl r2, ipending
	movia r3, 0x100
	movia r4, 0x2
	beq r2, r3, JTAG_UART_ROUTINE
	beq r2, r4, BUTTON_ROUTINE
	br EXCEPTION_FINISHED

JTAG_UART_ROUTINE:
	call PLAY_NOTE
	br EXCEPTION_FINISHED
	
BUTTON_ROUTINE:
	movia r5, 0x10000030
	movia r6, 0x10000040
	/* print playing song*/
	call SONGS
	stwio r0, 0(r5)
	stwio r0, 0(r6) /*turn off displays*/

EXCEPTION_FINISHED: /*or not registered*/
	subi ea, ea, 4
	eret
.end

