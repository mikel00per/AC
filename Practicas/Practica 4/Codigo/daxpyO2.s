	.file	"daxpy.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Introduzca El tama\303\261o N:"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"No se ha podido reservar memoria"
	.align 8
.LC3:
	.string	"Tiempo transcurrido en segundos: %0.4f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB21:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$40, %rsp
	.cfi_def_cfa_offset 80
	cmpl	$1, %edi
	jle	.L20
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	%rax, %r13
	movl	%eax, %r12d
	cltq
	leaq	1(,%rax,4), %rbp
	movq	%rbp, %rdi
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	malloc
	testq	%rbx, %rbx
	movq	%rax, %rbp
	je	.L3
	testq	%rax, %rax
	je	.L3
	testl	%r13d, %r13d
	leal	3(%r13), %ecx
	movl	$3, %edx
	movl	$2, %eax
	jle	.L21
	.p2align 4,,10
	.p2align 3
.L10:
	movl	%edx, -4(%rbx,%rax,4)
	addl	$1, %edx
	movl	%eax, -4(%rbp,%rax,4)
	addq	$1, %rax
	cmpl	%edx, %ecx
	jne	.L10
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L8:
	movl	0(%rbp,%rax,4), %edx
	leal	(%rdx,%rdx,2), %edx
	addl	%edx, (%rbx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %r12d
	jge	.L8
.L9:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	$.LC3, %edi
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC2(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	printf
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L21:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	jmp	.L9
.L20:
	movl	$.LC0, %edi
	call	puts
	orl	$-1, %edi
	call	exit
.L3:
	movl	$.LC1, %edi
	call	puts
	orl	$-1, %edi
	call	exit
	.cfi_endproc
.LFE21:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (GNU) 6.1.1 20160501"
	.section	.note.GNU-stack,"",@progbits
