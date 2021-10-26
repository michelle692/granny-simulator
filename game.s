	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	initGranny
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGranny, %function
initGranny:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #28
	mov	ip, #130
	mov	r0, #210
	mov	r1, #2
	ldr	r3, .L3
	stmib	r3, {r0, r1, r2}
	str	ip, [r3]
	str	r2, [r3, #16]
	bx	lr
.L4:
	.align	2
.L3:
	.word	granny
	.size	initGranny, .-initGranny
	.align	2
	.global	updateGranny
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGranny, %function
updateGranny:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L20
	ldrh	r3, [r3, #48]
	ldr	r4, .L20+4
	tst	r3, #32
	ldr	r0, [r4, #4]
	ldr	r2, [r4, #16]
	ldr	r1, [r4]
	ldr	r3, [r4, #12]
	sub	sp, sp, #20
	bne	.L6
	ldr	ip, [r4, #8]
	cmp	ip, r0
	suble	r0, r0, ip
	strle	r0, [r4, #4]
	ble	.L7
.L6:
	ldr	ip, .L20
	ldrh	ip, [ip, #48]
	tst	ip, #16
	bne	.L8
	ldr	lr, [r4, #8]
	add	ip, r0, r2
	rsb	r5, lr, #240
	cmp	ip, r5
	addle	r0, r0, lr
	strle	r0, [r4, #4]
	ble	.L7
.L8:
	ldr	ip, .L20
	ldrh	ip, [ip, #48]
	tst	ip, #64
	beq	.L19
.L9:
	ldr	ip, .L20
	ldrh	ip, [ip, #48]
	tst	ip, #128
	bne	.L7
	ldr	lr, [r4, #8]
	add	ip, r1, r3
	rsb	r5, lr, #160
	cmp	ip, r5
	addle	r1, r1, lr
	strle	r1, [r4]
.L7:
	mov	ip, #28
	mov	lr, #90
	mov	r5, #30
	str	ip, [sp, #12]
	stmib	sp, {r5, ip}
	str	lr, [sp]
	ldr	r5, .L20+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, .L20+12
	mov	r1, #80
	strne	r2, [r3]
	mov	r3, #28
	mov	r2, #145
	stmib	sp, {r1, r3}
	str	r3, [sp, #12]
	str	r2, [sp]
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #16]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, .L20+16
	strne	r2, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L19:
	ldr	ip, [r4, #8]
	cmp	ip, r1
	suble	r1, r1, ip
	strle	r1, [r4]
	ble	.L7
	b	.L9
.L21:
	.align	2
.L20:
	.word	67109120
	.word	granny
	.word	collision
	.word	timeCollected
	.word	heartCollected
	.size	updateGranny, .-updateGranny
	.align	2
	.global	drawGranny
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGranny, %function
drawGranny:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L24
	ldr	ip, .L24+4
	sub	sp, sp, #8
	ldr	r3, [r0, #12]
	ldr	r2, [r0, #16]
	ldr	r1, [r0]
	ldr	r4, .L24+8
	ldr	r0, [r0, #4]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	granny
	.word	grannyBitmap
	.word	drawImage4
	.size	drawGranny, .-drawGranny
	.align	2
	.global	drawClock
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawClock, %function
drawClock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #28
	push	{r4, lr}
	ldr	ip, .L28
	sub	sp, sp, #8
	mov	r2, r3
	str	ip, [sp]
	ldr	r4, .L28+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	timeBitmap
	.word	drawImage4
	.size	drawClock, .-drawClock
	.align	2
	.global	drawHeart
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHeart, %function
drawHeart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #28
	push	{r4, lr}
	ldr	ip, .L32
	sub	sp, sp, #8
	mov	r2, r3
	str	ip, [sp]
	ldr	r4, .L32+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	heartBitmap
	.word	drawImage4
	.size	drawHeart, .-drawHeart
	.align	2
	.global	initTeslas
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTeslas, %function
initTeslas:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, lr}
	mov	ip, #2
	mov	lr, r2
	mov	r4, #180
	mov	r0, #1
	mov	r1, #28
	ldr	r3, .L40
	b	.L35
.L37:
	tst	r2, #1
	movne	r4, #70
	moveq	r4, #180
	add	r3, r3, #36
.L35:
	add	r2, r2, #1
	cmp	r2, #6
	str	r4, [r3, #4]
	str	lr, [r3]
	str	ip, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #28]
	str	r0, [r3, #24]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	lr, [r3, #32]
	bne	.L37
	pop	{r4, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	teslas
	.size	initTeslas, .-initTeslas
	.align	2
	.global	updateTesla
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTesla, %function
updateTesla:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #28]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #20
	beq	.L43
	ldr	r2, .L64
	ldr	r2, [r2]
	cmp	r2, #0
	ldreq	r1, [r0, #8]
	ldr	r2, [r0]
	ldr	r3, [r0, #32]
	addeq	r2, r2, r1
	add	r3, r3, #1
	streq	r2, [r0]
	str	r3, [r0, #32]
	ands	r3, r3, #1
	ldreq	r1, [r0, #8]
	addeq	r2, r2, r1
	ldr	r1, [r0, #16]
	streq	r3, [r0, #32]
	add	r3, r1, r2
	streq	r2, [r0]
	cmp	r3, #160
	ldr	r3, [r0, #4]
	bgt	.L63
.L46:
	ldr	ip, [r4, #20]
	ldr	r0, .L64+4
	str	r1, [sp, #12]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r5, .L64+8
	ldr	r3, [r0, #12]
	ldr	r2, [r0, #16]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	str	ip, [sp, #8]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L48
	mov	r2, #1
	ldr	r3, .L64+12
	str	r2, [r3]
.L43:
	ldr	r3, [r4, #4]
	cmp	r3, #180
	movne	r3, #70
	mov	r1, #0
	mov	r2, #1
	stm	r4, {r1, r3}
	str	r2, [r4, #28]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L63:
	cmp	r3, #180
	mov	r0, #0
	movne	r3, #70
	mov	r2, r0
	stm	r4, {r0, r3}
	b	.L46
.L48:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L43
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	timeCollected
	.word	granny
	.word	collision
	.word	hasDec
	.size	updateTesla, .-updateTesla
	.align	2
	.global	drawTesla
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTesla, %function
drawTesla:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #28]
	cmp	r2, #0
	bxeq	lr
	mov	r3, r0
	push	{r4, lr}
	ldr	ip, [r0, #24]
	cmp	ip, #0
	ldr	r1, [r3]
	ldr	r2, [r3, #20]
	ldr	r0, [r0, #4]
	ldr	r3, [r3, #16]
	sub	sp, sp, #8
	bne	.L76
	str	ip, [sp]
	ldr	r4, .L77
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L76:
	ldr	ip, .L77+4
	ldr	r4, .L77+8
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	drawRect4
	.word	teslaDownBitmap
	.word	drawImage4
	.size	drawTesla, .-drawTesla
	.align	2
	.global	initTeslasOpp
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTeslasOpp, %function
initTeslasOpp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, lr}
	mov	ip, #2
	mov	r5, r2
	mov	lr, #120
	mov	r4, #160
	mov	r0, #1
	mov	r1, #28
	ldr	r3, .L85
	b	.L80
.L82:
	tst	r2, #1
	movne	lr, #50
	moveq	lr, #120
	add	r3, r3, #36
.L80:
	add	r2, r2, #1
	cmp	r2, #6
	stm	r3, {r4, lr}
	str	ip, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #28]
	str	r0, [r3, #24]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r5, [r3, #32]
	bne	.L82
	pop	{r4, r5, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	teslasOpp
	.size	initTeslasOpp, .-initTeslasOpp
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #28
	mov	ip, #130
	mov	r0, #210
	mov	r1, #2
	push	{r4, r5, r6, lr}
	mov	r4, #0
	mov	r5, #3
	mov	r6, #1
	ldr	r3, .L91
	sub	sp, sp, #24
	str	ip, [r3]
	stmib	r3, {r0, r1, r2}
	str	r2, [r3, #16]
	bl	initTeslas
	bl	initTeslasOpp
	ldr	lr, .L91+4
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #4
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r1, [lr]
	ldr	r3, .L91+8
	str	r1, [ip]
	ldr	r2, .L91+12
	ldr	r1, .L91+16
	ldr	ip, .L91+20
	str	r4, [r2]
	str	r4, [r1]
	mov	r0, r5
	mov	r2, #83886080
	str	r5, [r3]
	ldr	r1, .L91+24
	mov	r3, #256
	ldr	r4, .L91+28
	str	r6, [ip]
	mov	lr, pc
	bx	r4
	ldr	r0, .L91+32
	add	r2, sp, #24
	add	r3, sp, #2
	sub	r0, r0, r2
	add	ip, sp, #22
.L88:
	add	r2, r0, r3
	ldrh	r1, [r3, #2]!
	cmp	r3, ip
	strh	r1, [r2]	@ movhi
	bne	.L88
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L92:
	.align	2
.L91:
	.word	granny
	.word	.LANCHOR0
	.word	grannyLives
	.word	timeCollected
	.word	heartCollected
	.word	flag
	.word	grannyPal
	.word	DMANow
	.word	83886594
	.size	initGame, .-initGame
	.align	2
	.global	updateTeslaOpp
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTeslaOpp, %function
updateTeslaOpp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #28]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #20
	beq	.L94
	ldr	r2, .L115
	ldr	r2, [r2]
	cmp	r2, #0
	ldreq	r1, [r0, #8]
	ldr	r2, [r0]
	ldr	r3, [r0, #32]
	subeq	r2, r2, r1
	add	r3, r3, #1
	streq	r2, [r0]
	str	r3, [r0, #32]
	ands	r3, r3, #1
	ldreq	r1, [r0, #8]
	subeq	r2, r2, r1
	streq	r3, [r0, #32]
	streq	r2, [r0]
	cmp	r2, #0
	ldr	r3, [r0, #4]
	blt	.L113
.L97:
	ldr	lr, [r4, #16]
	ldr	ip, [r4, #20]
	ldr	r0, .L115+4
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r5, .L115+8
	ldr	r3, [r0, #12]
	ldr	r2, [r0, #16]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L114
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L94
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L114:
	mov	r2, #1
	ldr	r3, .L115+12
	str	r2, [r3]
.L94:
	ldr	r3, [r4, #4]
	cmp	r3, #120
	movne	r3, #50
	mov	r1, #160
	mov	r2, #1
	stm	r4, {r1, r3}
	str	r2, [r4, #28]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L113:
	cmp	r3, #120
	mov	r1, #160
	movne	r3, #50
	mov	r2, r1
	stm	r0, {r1, r3}
	b	.L97
.L116:
	.align	2
.L115:
	.word	timeCollected
	.word	granny
	.word	collision
	.word	hasDec
	.size	updateTeslaOpp, .-updateTeslaOpp
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updateGranny
	mov	r3, #0
	ldr	r4, .L130
	ldr	r0, .L130+4
	str	r3, [r4]
	bl	updateTesla
	ldr	r0, .L130+8
	bl	updateTesla
	ldr	r0, .L130+12
	bl	updateTesla
	ldr	r0, .L130+16
	bl	updateTesla
	ldr	r0, .L130+20
	bl	updateTesla
	ldr	r0, .L130+24
	bl	updateTesla
	ldr	r0, .L130+28
	bl	updateTeslaOpp
	ldr	r0, .L130+32
	bl	updateTeslaOpp
	ldr	r0, .L130+36
	bl	updateTeslaOpp
	ldr	r0, .L130+40
	bl	updateTeslaOpp
	ldr	r0, .L130+44
	bl	updateTeslaOpp
	ldr	r0, .L130+48
	bl	updateTeslaOpp
	ldr	r3, [r4]
	cmp	r3, #0
	ldrne	r2, .L130+52
	ldrne	r3, [r2]
	subne	r3, r3, #1
	strne	r3, [r2]
	ldr	r3, .L130+56
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L117
	ldr	r3, .L130+60
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L117
	mov	r0, #0
	ldr	r1, .L130+52
	ldr	r2, [r1]
	add	r2, r2, #1
	str	r2, [r1]
	str	r0, [r3]
.L117:
	pop	{r4, lr}
	bx	lr
.L131:
	.align	2
.L130:
	.word	hasDec
	.word	teslas
	.word	teslas+36
	.word	teslas+72
	.word	teslas+108
	.word	teslas+144
	.word	teslas+180
	.word	teslasOpp
	.word	teslasOpp+36
	.word	teslasOpp+72
	.word	teslasOpp+108
	.word	teslasOpp+144
	.word	teslasOpp+180
	.word	grannyLives
	.word	heartCollected
	.word	flag
	.size	updateGame, .-updateGame
	.align	2
	.global	drawTeslaOpp
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTeslaOpp, %function
drawTeslaOpp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #28]
	cmp	r2, #0
	bxeq	lr
	mov	r3, r0
	push	{r4, lr}
	ldr	ip, [r0, #24]
	cmp	ip, #0
	ldr	r1, [r3]
	ldr	r2, [r3, #20]
	ldr	r0, [r0, #4]
	ldr	r3, [r3, #16]
	sub	sp, sp, #8
	bne	.L142
	str	ip, [sp]
	ldr	r4, .L143
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L142:
	ldr	ip, .L143+4
	ldr	r4, .L143+8
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L144:
	.align	2
.L143:
	.word	drawRect4
	.word	teslaUpBitmap
	.word	drawImage4
	.size	drawTeslaOpp, .-drawTeslaOpp
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L151
	mov	r0, #0
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	bl	drawGranny
	ldr	r3, .L151+4
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L149
	ldr	r3, .L151+8
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L150
.L147:
	ldr	r0, .L151+12
	bl	drawTesla
	ldr	r0, .L151+16
	bl	drawTesla
	ldr	r0, .L151+20
	bl	drawTesla
	ldr	r0, .L151+24
	bl	drawTesla
	ldr	r0, .L151+28
	bl	drawTesla
	ldr	r0, .L151+32
	bl	drawTesla
	ldr	r0, .L151+36
	bl	drawTeslaOpp
	ldr	r0, .L151+40
	bl	drawTeslaOpp
	ldr	r0, .L151+44
	bl	drawTeslaOpp
	ldr	r0, .L151+48
	bl	drawTeslaOpp
	ldr	r0, .L151+52
	bl	drawTeslaOpp
	ldr	r0, .L151+56
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	b	drawTeslaOpp
.L149:
	mov	r3, #28
	ldr	r1, .L151+60
	mov	r2, r3
	str	r1, [sp]
	mov	r0, #90
	mov	r1, #30
	ldr	r4, .L151+64
	mov	lr, pc
	bx	r4
	ldr	r3, .L151+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L147
.L150:
	mov	r3, #28
	ldr	r1, .L151+68
	mov	r2, r3
	str	r1, [sp]
	mov	r0, #145
	mov	r1, #80
	ldr	r4, .L151+64
	mov	lr, pc
	bx	r4
	b	.L147
.L152:
	.align	2
.L151:
	.word	fillScreen4
	.word	timeCollected
	.word	heartCollected
	.word	teslas
	.word	teslas+36
	.word	teslas+72
	.word	teslas+108
	.word	teslas+144
	.word	teslas+180
	.word	teslasOpp
	.word	teslasOpp+36
	.word	teslasOpp+72
	.word	teslasOpp+108
	.word	teslasOpp+144
	.word	teslasOpp+180
	.word	timeBitmap
	.word	drawImage4
	.word	heartBitmap
	.size	drawGame, .-drawGame
	.comm	flag,4,4
	.comm	heartCollected,4,4
	.comm	timeCollected,4,4
	.comm	hasDec,4,4
	.comm	grannyLives,4,4
	.comm	teslasOpp,216,4
	.comm	teslas,216,4
	.comm	granny,20,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.short	18239
	.short	32437
	.short	16747
	.short	22028
	.short	1247
	.short	30653
	.short	27482
	.short	21139
	.short	32767
	.short	15855
	.ident	"GCC: (devkitARM release 53) 9.1.0"
