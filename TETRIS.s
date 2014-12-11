	.global TETRIS
TETRIS:
	movia r5, 0x10000020
	movia r4, 0x10000030
	movia r6, TETRIS_MESSAGE
	mov r14, r6
	mov r21, ra
	movia r20, 0x10003040
	
	
	movia r3, 96000
	call PLAY_MI_5
	movia r3, 96000
	call PLAY_DO_5
	movia r3, 96000
	call PLAY_RE_5
	movia r3, 96000
	call PLAY_SI
	movia r3, 96000
	call PLAY_DO_5
	movia r3, 96000
	call PLAY_LA
	movia r3, 144000
	call PLAY_SI
	
	movia r3, 96000
	call PLAY_MI_5
	movia r3, 96000
	call PLAY_DO_5
	movia r3, 96000
	call PLAY_RE_5
	movia r3, 96000
	call PLAY_SI
	movia r3, 48000
	call PLAY_LA
	movia r3, 48000
	call PLAY_MI_5
	movia r3, 48000
	call PLAY_LA_5
	movia r3, 48000
	call PLAY_LA_5
	movia r3, 96000
	call PLAY_SOL_SOSTENIDO_5
	
	mov ra, r21
	
	stwio r0, (r4)
	stwio r0, (r5)
	ret	
	
	
	
	
PLAY_MI_5:
	movia r7, MI_5
	movia r8, 73
	mov r10, r8
	mov r11, r7
	br LOOP_SONGS
	
PLAY_SI:
	movia r7, SI
	movia r8, 98
	mov r10, r8
	mov r11, r7
	br LOOP_SONGS
	
PLAY_DO_5:
	movia r7, DO_5
	movia r8, 92
	mov r10, r8
	mov r11, r7
	br LOOP_SONGS
	
PLAY_RE_5:
	movia r7, RE_5
	movia r8, 82
	mov r10, r8
	mov r11, r7
	br LOOP_SONGS
	
PLAY_LA:
	movia r7, LA
	movia r8, 110
	mov r10, r8
	mov r11, r7
	br LOOP_SONGS
	
PLAY_FA_5:
    movia r7, FA_5
	movia r8, 69
	mov r10, r8
	mov r11, r7
	br LOOP_SONGS
	
PLAY_LA_5:
	movia r7, LA_5
	movia r8, 55
	mov r10, r8
	mov r11, r7
	br LOOP_SONGS
	
PLAY_SOL_5:
	movia r7, SOL_5
	movia r8, 62
	mov r10, r8
	mov r11, r7
	br LOOP_SONGS
	
PLAY_SOL_SOSTENIDO_5:
	movia r7, SOL_SOSTENIDO_5
	movia r8, 58
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
	
.end

