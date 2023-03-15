	.file	"tutorial.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_a2p0_v1p0_zvamo1p0_zvlsseg1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	max
	.type	max, @function
max:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-40(s0)
	sw	a1,-36(s0)
	sw	a2,-48(s0)
	sw	a3,-44(s0)
	lw	a2,-36(s0)
	lw	a3,-48(s0)
	mul	a2,a2,a3
	lw	a1,-44(s0)
	lw	a3,-40(s0)
	mul	a3,a1,a3
	add	a1,a2,a3
	lw	a2,-40(s0)
	lw	a3,-48(s0)
	mul	a0,a2,a3
	mulhu	a5,a2,a3
	mv	a4,a0
	add	a3,a1,a5
	mv	a5,a3
	sw	a4,-24(s0)
	sw	a5,-20(s0)
	sw	a4,-24(s0)
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	mv	a0,a4
	mv	a1,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	max, .-max
	.globl	a
	.section	.sbss,"aw",@nobits
	.align	2
	.type	a, @object
	.size	a, 4
a:
	.zero	4
	.globl	b
	.align	2
	.type	b, @object
	.size	b, 4
b:
	.zero	4
	.globl	res
	.align	2
	.type	res, @object
	.size	res, 4
res:
	.zero	4
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	lui	a5,%hi(a)
	li	a4,1221
	sw	a4,%lo(a)(a5)
	lui	a5,%hi(b)
	li	a4,666
	sw	a4,%lo(b)(a5)
	lui	a5,%hi(a)
	lw	a5,%lo(a)(a5)
	mv	a0,a5
	srai	a5,a5,31
	mv	a1,a5
	lui	a5,%hi(b)
	lw	a5,%lo(b)(a5)
	mv	a2,a5
	srai	a5,a5,31
	mv	a3,a5
	call	max
	mv	a4,a0
	mv	a5,a1
	lui	a5,%hi(res)
	sw	a4,%lo(res)(a5)
	lui	a5,%hi(res)
	lw	a5,%lo(res)(a5)
	mv	a0,a5
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (SiFive GCC-Metal 10.2.0-2020.12.8) 10.2.0"
