	.global SONGS

SONGS:
	movia r2, 0x10000050
	ldwio r3, 12(r2)
	stwio r0, 12(r2)
	movi r4, 2
	movi r5, 4
	movi r6, 8
	movi r7, 1
	movia r8, 0x10000040
	ldwio r9, 0(r8)
	movia r10, 0x10000000
	beq r3, r4, SONG_01
	beq r3, r5, SONG_02
	br SONG_03
	
SONG_01:
	mov r22, ra
	call TETRIS
	br COMEBACK
	
SONG_02:
	mov r22, ra
	call WIZARD
	br COMEBACK
	
SONG_03	:
	mov r22, ra
	call AMANECER

COMEBACK:
	mov ra, r22
	ret

	
WIZARD:
	movia r20, 0x55
	movia r21, 0x10000020
	movia r22, 0x10000030
	stwio r20, (r21)
	stwio r20, (r22)
	ret
	
.end
