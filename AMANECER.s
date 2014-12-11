	.global AMANECER
AMANECER:
	movia r20, 0x10003040
	movia r5, 0x10000020
	movia r4, 0x10000030
	movia r6, AMANECER_MESSAGE
	mov r14, r6
	mov r21, ra
	movia r22, datos
	movia r19, 44
	movia r17, 38
	
LOOP:
	beq r19, zero, END
	ldw r3, 0(r22)
	ldw r18, 4(r22)
	callr r18
	addi r22, r22, 8
	subi r19, r19, 2
	ldw r7, (r6)
	stwio r7, (r5)
	addi r6, r6, 4
	ble r19, r17, SECOND_DISPLAY
	br LOOP
	
SECOND_DISPLAY:
	ldw r15, 0(r14)
	stwio r15, (r4)
	addi r14, r14, 4
	br LOOP	
	
	
END:
	stwio r0, (r4)
	stwio r0, (r5)
	
	mov ra, r21
	ret
	
PLAY_RE:
	movia r7, RE
	movia r8, 165
	mov r10, r8
	mov r11, r7
	br LOOP_SONGS
	
PLAY_MI:
	movia r7, MI
	movia r8, 147
	mov r10, r8
	mov r11, r7
	br LOOP_SONGS
	
PLAY_FA:
	movia r7, FA
	movia r8, 138
	mov r10, r8
	mov r11, r7
	br LOOP_SONGS
	
PLAY_SOL:
	movia r7, SOL
	movia r8, 123
	mov r10, r8
	mov r11, r7
	br LOOP_SONGS
	
PLAY_DO:
	movia r7, DO
	movia r8, 184
	mov r10, r8
	mov r11, r7
	br LOOP_SONGS
	
PLAY_LA:
	movia r7, LA
	movia r8, 110
	mov r10, r8
	mov r11, r7
	br LOOP_SONGS
	
LOOP_SONGS:
	beq r3, zero, RETURN_SONGS
	ldw r12, (r11)
	ldwio r13, 4(r20)
	andi r13, r13, 0xffff0000
	beq r13, zero, LOOP_SONGS
	movi r16, 32	
	mul r12, r12, r16
	stwio r12, 8(r20)
	stwio r12, 12(r20)
	addi r11, r11, 4
	subi r3, r3, 1
	subi r10, r10, 1
	beq r10, zero, FIX_COUNTER
	br LOOP_SONGS
	
FIX_COUNTER:
	beq r3, zero, RETURN_SONGS
	mov r11, r7 
	mov r10, r8
	br LOOP_SONGS
	
RETURN_SONGS:
	ret

datos: /*44*/
	.word 48000, PLAY_SOL, 48000, PLAY_MI, 48000, PLAY_RE, 48000, PLAY_DO, 48000, PLAY_RE, 48000, PLAY_MI, 48000, PLAY_SOL, 48000, PLAY_MI, 48000, PLAY_RE, 48000, PLAY_DO, 48000, PLAY_RE, 48000, PLAY_MI, 48000, PLAY_SOL, 48000, PLAY_FA, 48000, PLAY_SOL,  48000, PLAY_LA, 48000, PLAY_FA,48000, PLAY_LA, 48000, PLAY_SOL, 48000, PLAY_MI, 96000, PLAY_RE, 48000, PLAY_DO,0
	
.end
