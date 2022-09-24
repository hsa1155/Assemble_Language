	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"test.c"
	.text
	.align	2
	.global	BubSort
	.type	BubSort, %function
BubSort:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-36]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L2
.L8:
	mov	r3, #1
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L3
.L5:
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	mov	r3, r3, asl #2
	ldr	r1, [fp, #-32]
	add	r3, r1, r3
	ldr	r3, [r3]
	cmp	r2, r3
	bge	.L4
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [fp, #-20]
	add	r2, r2, #1
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-32]
	add	r2, r1, r2
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [fp, #-28]
	str	r2, [r3]
	mov	r3, #0
	str	r3, [fp, #-24]
.L4:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L3:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L5
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	bne	.L6
	b	.L7
.L6:
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L8
.L7:
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	lr
	.size	BubSort, .-BubSort
	.section	.rodata
	.align	2
.LC1:
	.ascii	"%d \000"
	.align	2
.LC0:
	.word	5
	.word	3
	.word	1
	.word	7
	.word	2
	.word	4
	.word	6
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	ldr	r3, .L12
	sub	ip, fp, #44
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	sub	r3, fp, #44
	mov	r0, r3
	mov	r1, #7
	bl	Bubsort
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L10
.L11:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	sub	r2, fp, #12
	add	r3, r2, r3
	ldr	r3, [r3, #-32]
	ldr	r0, .L12+4
	mov	r1, r3
	bl	printf
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L10:
	ldr	r3, [fp, #-16]
	cmp	r3, #6
	ble	.L11
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LC0
	.word	.LC1
	.size	main, .-main
	.ident	"GCC: (GNU) 4.9.4"
