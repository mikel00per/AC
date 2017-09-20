	.file	"pmm-secuencial-modificado-b.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Introduzca El numero de filas/columnas:"
	.align 8
.LC2:
	.string	"Resultado:\nC[0][0]=%d, C[%d][%d]=%d\n"
	.align 8
.LC3:
	.string	"Tiempo transcurrido en segundos: %0.6f\n"
	.align 8
.LC4:
	.string	"No se ha podido reservar memoria"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB21:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	cmpl	$1, %edi
	jle	.L30
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movslq	%eax, %rbp
	movq	%rax, (%rsp)
	movl	%eax, %r15d
	movq	%rbp, %rbx
	imulq	%rbp, %rbx
	salq	$2, %rbx
	movq	%rbx, %rdi
	call	malloc
	movq	%rbx, %rdi
	movq	%rax, %r14
	call	malloc
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	malloc
	testq	%r14, %r14
	movq	%rax, %r13
	setne	%dl
	testq	%r12, %r12
	setne	%al
	orb	%al, %dl
	jne	.L15
	testq	%r13, %r13
	je	.L3
.L15:
	movl	(%rsp), %eax
	testl	%eax, %eax
	jle	.L31
	movl	(%rsp), %eax
	salq	$2, %rbp
	xorl	%edi, %edi
	xorl	%edx, %edx
	leal	(%rax,%rax), %r8d
.L8:
	leal	1(%rdx), %ebx
	leal	(%rdx,%r8), %esi
	movq	%rdi, %rax
	movl	%ebx, %ecx
	.p2align 4,,10
	.p2align 3
.L7:
	movl	%edx, (%r12,%rax)
	addl	$2, %edx
	movl	%ecx, (%r14,%rax)
	movl	$0, 0(%r13,%rax)
	addl	$1, %ecx
	addq	$4, %rax
	cmpl	%edx, %esi
	jne	.L7
	addq	%rbp, %rdi
	cmpl	%r15d, %ebx
	movl	%ebx, %edx
	jne	.L8
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	%r13, %r10
	movq	%r14, %rdi
	xorl	%r11d, %r11d
.L13:
	movq	%r12, %r9
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L11:
	movl	(%r10,%r8,4), %esi
	movq	%r9, %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L10:
	movl	(%rdi,%rax,4), %edx
	addq	$1, %rax
	imull	(%rcx), %edx
	addq	%rbp, %rcx
	addl	%edx, %esi
	cmpl	%eax, %ebx
	jg	.L10
	movl	%esi, (%r10,%r8,4)
	addq	$1, %r8
	addq	$4, %r9
	cmpl	%r8d, %ebx
	jg	.L11
	addl	$1, %r11d
	addq	%rbp, %r10
	addq	%rbp, %rdi
	cmpl	%r15d, %r11d
	jne	.L13
.L14:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	movl	$.LC2, %edi
	pxor	%xmm0, %xmm0
	movl	0(%r13), %esi
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movq	(%rsp), %rax
	leal	-1(%rax), %edx
	addl	$1, %eax
	imull	%edx, %eax
	movl	%edx, %ecx
	divsd	.LC1(%rip), %xmm0
	cltq
	movl	0(%r13,%rax,4), %r8d
	xorl	%eax, %eax
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	call	printf
	movsd	8(%rsp), %xmm0
	movl	$.LC3, %edi
	movl	$1, %eax
	call	printf
	movq	%r14, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	movq	%r13, %rdi
	call	free
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	movl	$.LC4, %edi
	call	puts
	orl	$-1, %edi
	call	exit
.L31:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	jmp	.L14
.L30:
	movl	$.LC0, %edi
	call	puts
	orl	$-1, %edi
	call	exit
	.cfi_endproc
.LFE21:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (GNU) 6.1.1 20160501"
	.section	.note.GNU-stack,"",@progbits
