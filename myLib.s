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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel4
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L5
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	ldr	ip, [r3]
	add	r1, r1, r1, lsr #31
	bic	r1, r1, #1
	ldrh	r3, [ip, r1]
	tst	r0, #1
	andne	r3, r3, #255
	andeq	r3, r3, #65280
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r1]	@ movhi
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #20
	ldrb	lr, [sp, #56]	@ zero_extendqisi2
	ldrb	r4, [sp, #56]	@ zero_extendqisi2
	subs	ip, r3, #0
	orr	lr, lr, r4, lsl #8
	strh	lr, [sp, #14]	@ movhi
	ble	.L7
	add	ip, ip, r1
	sub	r5, r2, #2
	rsb	r4, ip, ip, lsl #4
	asr	r5, r5, #1
	sub	r10, r2, #1
	ldr	r9, .L25
	add	r8, r0, r2
	rsb	r3, r1, r1, lsl #4
	add	r7, r2, r2, lsr #31
	add	r1, r0, r4, lsl #4
	asr	r6, r10, #1
	orr	r4, r5, #-2130706432
	str	r4, [sp, #4]
	asr	r7, r7, #1
	sub	r8, r8, #1
	orr	r4, r6, #-2130706432
	ldr	lr, [r9]
	ldr	ip, [r9, #4]
	add	r3, r0, r3, lsl #4
	str	r4, [sp]
	orr	r7, r7, #-2130706432
	and	r8, r8, #1
	and	r0, r0, #1
	and	r5, r2, #1
	add	r9, sp, #14
	b	.L20
.L9:
	cmp	r5, #0
	beq	.L15
	cmp	r2, #1
	ble	.L24
	mov	r6, #0
	add	r4, r3, #1
	add	r4, r4, r4, lsr #31
	bic	r4, r4, #1
	add	r4, lr, r4
	str	r6, [ip, #44]
	str	r9, [ip, #36]
	str	r4, [ip, #40]
	ldr	r4, [sp]
	str	r4, [ip, #44]
.L24:
	add	r4, r3, r3, lsr #31
	bic	r4, r4, #1
	ldrb	r6, [lr, r4]	@ zero_extendqisi2
	ldrb	fp, [sp, #56]	@ zero_extendqisi2
	orr	r6, r6, fp, lsl #8
	strh	r6, [lr, r4]	@ movhi
.L11:
	add	r3, r3, #240
	cmp	r3, r1
	beq	.L7
.L20:
	cmp	r0, #0
	bne	.L9
	cmp	r5, #0
	bne	.L10
	add	r4, r3, r3, lsr #31
	bic	r4, r4, #1
	add	r3, r3, #240
	add	r4, lr, r4
	cmp	r3, r1
	str	r5, [ip, #44]
	str	r9, [ip, #36]
	str	r4, [ip, #40]
	str	r7, [ip, #44]
	bne	.L20
.L7:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L10:
	cmp	r2, #1
	ble	.L12
	add	r4, r3, r3, lsr #31
	bic	r4, r4, #1
	add	r4, lr, r4
	str	r0, [ip, #44]
	str	r9, [ip, #36]
	str	r4, [ip, #40]
	ldr	r4, [sp]
	str	r4, [ip, #44]
.L12:
	add	r4, r10, r3
	add	r4, r4, r4, lsr #31
	bic	r4, r4, #1
	ldrh	fp, [lr, r4]
	ldrb	r6, [sp, #56]	@ zero_extendqisi2
	cmp	r8, #0
	and	r6, r6, #255
	andne	fp, fp, #255
	andeq	fp, fp, #65280
	orrne	fp, fp, r6, lsl #8
	orreq	fp, fp, r6
	strh	fp, [lr, r4]	@ movhi
	b	.L11
.L15:
	cmp	r2, #2
	ble	.L17
	add	r4, r3, #1
	add	r4, r4, r4, lsr #31
	bic	r4, r4, #1
	add	r4, lr, r4
	str	r5, [ip, #44]
	str	r9, [ip, #36]
	str	r4, [ip, #40]
	ldr	r4, [sp, #4]
	str	r4, [ip, #44]
.L17:
	add	r4, r10, r3
	add	r4, r4, r4, lsr #31
	bic	r4, r4, #1
	ldrh	fp, [lr, r4]
	ldrb	r6, [sp, #56]	@ zero_extendqisi2
	cmp	r8, #0
	and	r6, r6, #255
	andne	fp, fp, #255
	andeq	fp, fp, #65280
	orrne	fp, fp, r6, lsl #8
	orreq	fp, fp, r6
	strh	fp, [lr, r4]	@ movhi
	b	.L24
.L26:
	.align	2
.L25:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldr	r1, .L29
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	ldm	r1, {r0, r3}
	ldr	r1, .L29+4
	orr	r2, r2, ip, lsl #8
	add	ip, sp, #14
	strh	r2, [sp, #14]	@ movhi
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L30:
	.align	2
.L29:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	bxle	lr
	push	{r4, r5, r6, r7, lr}
	mov	r4, #0
	ldr	r7, .L39
	add	r2, r2, r2, lsr #31
	add	r3, r1, r3
	asr	lr, r2, #1
	rsb	r5, r1, r1, lsl #4
	rsb	r3, r3, r3, lsl #4
	ldr	ip, [sp, #20]
	ldr	r6, [r7]
	ldr	r2, [r7, #4]
	add	r1, r0, r3, lsl #4
	add	r0, r0, r5, lsl #4
	orr	r5, lr, #-2147483648
	lsl	lr, lr, #1
.L33:
	add	r3, r0, r0, lsr #31
	bic	r3, r3, #1
	add	r0, r0, #240
	add	r3, r6, r3
	cmp	r0, r1
	str	r4, [r2, #44]
	str	ip, [r2, #36]
	str	r3, [r2, #40]
	add	ip, ip, lr
	str	r5, [r2, #44]
	bne	.L33
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L42
	ldr	r1, .L42+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L43:
	.align	2
.L42:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L45:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L45
	mov	r2, #67108864
.L46:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L46
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	ldrh	r3, [r1]
	tst	r3, #16
	ldr	r2, .L53
	moveq	r2, #100663296
	ldr	r0, .L53+4
	eor	r3, r3, #16
	str	r2, [r0]
	strh	r3, [r1]	@ movhi
	bx	lr
.L54:
	.align	2
.L53:
	.word	100704256
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L57
	ldr	lr, [ip, #4]
	add	r0, r0, r0, lsl #1
	add	ip, lr, r0, lsl #2
	orr	r3, r3, #-2147483648
	lsl	r0, r0, #2
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L58:
	.align	2
.L57:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	lr, [sp, #12]
	ldr	ip, [sp, #20]
	add	ip, lr, ip
	add	r4, r1, #10
	sub	ip, ip, #1
	cmp	r4, ip
	bge	.L63
	add	r1, r1, r3
	sub	r1, r1, #1
	add	lr, lr, #10
	cmp	r1, lr
	bgt	.L65
.L63:
	mov	r0, #0
	pop	{r4, lr}
	bx	lr
.L65:
	ldr	r1, [sp, #16]
	ldr	r3, [sp, #8]
	add	r3, r3, r1
	sub	r3, r3, #1
	add	r1, r0, #10
	cmp	r1, r3
	bge	.L63
	ldr	r3, [sp, #8]
	add	r0, r0, r2
	sub	r0, r0, #1
	add	r3, r3, #10
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	pop	{r4, lr}
	bx	lr
	.size	collision, .-collision
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 53) 9.1.0"
