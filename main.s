	.global _start

_start:
	movia r2, 0x10001000 /* address of the JTAG UART port */
	movia r3, 0x10000050
	movia r4, 0x102
	movia r5, 0b01110
	stwio r5, 8(r3)
	wrctl ienable, r4
	addi r6, r0, 1
	stwio r6, 4(r2)
	wrctl status, r6

	movia r6, WELCOME_MESSAGE
LOOP:
	ldb r7, 0(r6)
	beq r7, zero, STOP
	call PUT_JTAG
	addi r6, r6, 1
	br LOOP
	
STOP:
	br STOP
	
PUT_JTAG:
	ldwio r3, 4(r2)
	andhi r3, r3, 0xffff
	beq r3, zero, PUT_JTAG
	stwio r7, 0(r2)
	ret
	
	.data
	.global WELCOME_MESSAGE
WELCOME_MESSAGE:
	.asciz "\nBienvenido al Piano, pulse z para obtener instrucciones de uso\n"
	
	.global DO_CODE
DO_CODE: 
	.ascii "a"
	
	.global DO_SOSTENIDO_CODE
DO_SOSTENIDO_CODE:
	.ascii "w"
	
	.global RE_CODE
RE_CODE:
	.ascii "s"
	
	.global RE_SOSTENIDO_CODE
RE_SOSTENIDO_CODE:
	.ascii "e"
	
	.global MI_CODE
MI_CODE:
	.ascii "d"
	
	.global FA_CODE
FA_CODE:
	.ascii "f"
	
	.global FA_SOSTENIDO_CODE
FA_SOSTENIDO_CODE:
	.ascii "t"
	
	.global SOL_CODE
SOL_CODE:
	.ascii "g"
	
	.global SOL_SOSTENIDO_CODE
SOL_SOSTENIDO_CODE:
	.ascii "y"
	
	.global LA_CODE
LA_CODE:
	.ascii "h"
	
	.global LA_SOSTENIDO_CODE
LA_SOSTENIDO_CODE:
	.ascii "u"
	
	.global SI_CODE
SI_CODE:
	.ascii "j"
	
	.global HELP_CODE
HELP_CODE:
	.ascii "z"
	
	.global HELP_MESSAGE
HELP_MESSAGE:
	.asciz "\npress one key: awsedftgyhuj to play a note \npress button 1 or 3 for play a song\n"
	.global TETRIS_MESSAGE
TETRIS_MESSAGE:
	.word 0x50, 0x5079, 0x507973, 0x50797350, 0x7973503f, 0x73503f39, 0x503f3906, 0x3f390679, 0x39067954, 0x0679545e, 0x79545e54, 0x545e545e, 0x5e545e3f 
	.global AMANECER_MESSAGE
AMANECER_MESSAGE:
	.word 0x50, 0x5079, 0x507973, 0x50797350, 0x7973503f, 0x73503f5e, 0x503f5e3e, 0x3f5e3e39, 0x5e3e3906, 0x3e390679, 0x39067954, 0x0679545e, 0x39067954, 0x0679545e, 0x79545e3f, 0x545e3f08, 0x5e3f0877, 0x3f087733, 0x08773327, 0x77332777, 0x33277754, 0x27775479, 0x77547939, 0x54793979, 0x79397950 
.end


