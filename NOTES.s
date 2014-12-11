	.global PLAY_NOTE
	
PLAY_NOTE:
	movia r2, 0x10001000
	ldwio r3, 0(r2)
	movia r12, 0x10003040
	
WAIT:
	mov r4, r3
	andi r4, r4, 0xffff /*checks RVALID*/
	beq r4, zero, RETURN
	stwio r3, 0(r2)
	andi r3, r3, 0x00ff

CHECK_CARACTER:
	movia r4, DO_CODE
	ldb r4, 0(r4)
	beq r3, r4, DO_ROUTINE
	
	movia r4, DO_SOSTENIDO_CODE
	ldb r4, 0(r4)
	beq r3, r4, DO_SOSTENIDO_ROUTINE
	
	movia r4, RE_CODE
	ldb r4, 0(r4)
	beq r3, r4, RE_ROUTINE
	
	movia r4, RE_SOSTENIDO_CODE
	ldb r4, 0(r4)
	beq r3, r4, RE_SOSTENIDO_ROUTINE
	
	movia r4, MI_CODE
	ldb r4, 0(r4)
	beq r3, r4, MI_ROUTINE
	
	movia r4, FA_CODE
	ldb r4, 0(r4)
	beq r3, r4, FA_ROUTINE
	
	movia r4, FA_SOSTENIDO_CODE
	ldb r4, 0(r4)
	beq r3, r4, FA_SOSTENIDO_ROUTINE
	
	movia r4, SOL_CODE
	ldb r4, 0(r4)
	beq r3, r4, SOL_ROUTINE
	
	movia r4, SOL_SOSTENIDO_CODE
	ldb r4, 0(r4)
	beq r3, r4, SOL_SOSTENIDO_ROUTINE
	
	movia r4, LA_CODE
	ldb r4, 0(r4)
	beq r3, r4, LA_ROUTINE
	
	movia r4, LA_SOSTENIDO_CODE
	ldb r4, 0(r4)
	beq r3, r4, LA_SOSTENIDO_ROUTINE
	
	movia r4, SI_CODE
	ldb r4, 0(r4)
	beq r3, r4, SI_ROUTINE
	
	movia r4, HELP_CODE
	ldb r4, 0(r4)
	beq r3, r4, PRINT_HELP
	
	br RETURN
	
DO_ROUTINE:
	movia r3, DO
	movia r4, 184
	movia r5, 130
	mov r6, r4
	mov r8, r3
	br LOOP_NOTES
	
DO_SOSTENIDO_ROUTINE:
	movia r3, DO_SOSTENIDO
	movia r4, 173
	movia r5, 138
	mov r6, r4
	mov r8, r3
	br LOOP_NOTES
	
RE_ROUTINE:
	movia r3, RE
	movia r4, 165
	movia r5, 145
	mov r6, r4
	mov r8, r3
	br LOOP_NOTES
	
RE_SOSTENIDO_ROUTINE:
	movia r3, RE_SOSTENIDO
	movia r4, 155
	movia r5, 154
	mov r6, r4
	mov r8, r3
	br LOOP_NOTES
	
MI_ROUTINE:
	movia r3, MI
	movia r4, 147
	movia r5, 163
	mov r6, r4
	mov r8, r3
	br LOOP_NOTES
	
FA_ROUTINE:
	movia r3, FA
	movia r4, 138
	movia r5, 173
	mov r6, r4
	mov r8, r3
	br LOOP_NOTES
	
FA_SOSTENIDO_ROUTINE:
	movia r3, FA_SOSTENIDO
	movia r4, 130
	movia r5, 184
	mov r6, r4
	mov r8, r3
	br LOOP_NOTES
	
SOL_ROUTINE:
	movia r3, SOL
	movia r4, 123
	movia r5, 195
	mov r6, r4
	mov r8, r3
	br LOOP_NOTES
	
SOL_SOSTENIDO_ROUTINE:
	movia r3, SOL_SOSTENIDO
	movia r4, 116
	movia r5, 206
	mov r6, r4
	mov r8, r3
	br LOOP_NOTES
	
LA_ROUTINE:
	movia r3, LA
	movia r4, 110
	movia r5, 218
	mov r6, r4
	mov r8, r3
	br LOOP_NOTES
	
LA_SOSTENIDO_ROUTINE:
	movia r3, LA_SOSTENIDO
	movia r4, 104
	movia r5, 230
	mov r6, r4
	mov r8, r3
	br LOOP_NOTES
	
SI_ROUTINE:
	movia r3, SI
	movia r4, 98
	movia r5, 244
	mov r6, r4
	mov r8, r3
	
LOOP_NOTES:
	beq r6, r0, CHECK_FINISH_LOOP
	ldw r7, 0(r8)
	ldwio r18, 4(r12)
	andi r18, r18, 0xffff0000
	beq r18, zero, LOOP_NOTES
	movi r16, 16		/* volume */
	mul r7, r7, r16
	stwio r7, 8(r12)
	stwio r7, 12(r12)
	addi r8, r8, 4
	subi r6, r6, 1
	br LOOP_NOTES
	
CHECK_FINISH_LOOP:
	beq r5, zero, RETURN
	subi r5, r5, 1
	mov r8, r3 
	mov r6, r4
	br LOOP_NOTES
	
PRINT_HELP:
	movia r3, HELP_MESSAGE
	movia r5, 0x10001000
	
PRINT_HELP_LOOP:
	ldb r4, 0(r3)
	beq r4, zero, RETURN
	mov r6, r4
	andhi r6, r6, 0xffff
	bne r6, zero, PRINT_HELP_LOOP
	stwio r4,(r5)
	addi r3, r3, 1
	br PRINT_HELP_LOOP
	
RETURN:
	movi r21, 1
	stwio r21, 4(r2)
	ret
.end

