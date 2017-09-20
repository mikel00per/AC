	.file	"daxpy.c"
	.section	.rodata
.LC0:
	.string	"Introduzca El tama\303\261o N:"
	.align 8
.LC1:
	.string	"No se ha podido reservar memoria"
	.align 8
.LC3:
	.string	"Tiempo transcurrido en segundos: %0.4f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movl	$3, -8(%rbp)
	cmpl	$1, -84(%rbp)
	jg	.L2
	movl	$.LC0, %edi
	call	puts
	movl	$-1, %edi
	call	exit
.L2:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -24(%rbp)
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -32(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L3
	cmpq	$0, -32(%rbp)
	jne	.L4
.L3:
	movl	$.LC1, %edi
	call	puts
	movl	$-1, %edi
	call	exit
.L4:
	movl	$1, -4(%rbp)
	jmp	.L5
.L6:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	addl	$2, %edx
	movl	%edx, (%rax)
	addl	$1, -4(%rbp)
.L5:
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jle	.L6
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movl	$1, -4(%rbp)
	jmp	.L7
.L8:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %ecx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rsi
	movq	-32(%rbp), %rax
	addq	%rsi, %rax
	movl	(%rax), %eax
	imull	-8(%rbp), %eax
	addl	%ecx, %eax
	movl	%eax, (%rdx)
	addl	$1, -4(%rbp)
.L7:
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jle	.L8
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movq	-80(%rbp), %rdx
	movq	-64(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movq	-72(%rbp), %rdx
	movq	-56(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC2(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -104(%rbp)
	movsd	-104(%rbp), %xmm0
	movl	$.LC3, %edi
	movl	$1, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (GNU) 6.1.1 20160501"
	.section	.note.GNU-stack,"",@progbits
