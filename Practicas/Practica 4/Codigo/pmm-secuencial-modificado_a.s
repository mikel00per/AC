	.file	"pmm-secuencial-modificado_a.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"Introduzca El numero de filas/columnas:"
	.align 8
.LC1:
	.string	"No se ha podido reservar memoria"
	.align 8
.LC3:
	.string	"Resultado:\nC[0][0]=%d, C[%d][%d]=%d\n"
	.align 8
.LC4:
	.string	"Tiempo transcurrido en segundos: %0.6f\n"
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
	addq	$-128, %rsp
	movl	%edi, -100(%rbp)
	movq	%rsi, -112(%rbp)
	movl	$0, -16(%rbp)
	cmpl	$1, -100(%rbp)
	jg	.L2
	movl	$.LC0, %edi
	call	puts
	movl	$-1, %edi
	call	exit
.L2:
	movq	-112(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movl	-20(%rbp), %eax
	cltq
	imulq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -32(%rbp)
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movl	-20(%rbp), %eax
	cltq
	imulq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -40(%rbp)
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movl	-20(%rbp), %eax
	cltq
	imulq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -48(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L3
	cmpq	$0, -40(%rbp)
	je	.L3
	cmpq	$0, -48(%rbp)
	jne	.L4
.L3:
	movl	$.LC1, %edi
	call	puts
	movl	$-1, %edi
	call	exit
.L4:
	movl	$0, -4(%rbp)
	jmp	.L5
.L8:
	movl	$0, -8(%rbp)
	jmp	.L6
.L7:
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %ecx
	movl	-8(%rbp), %edx
	addl	%ecx, %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	leal	(%rdx,%rdx), %ecx
	movl	-4(%rbp), %edx
	addl	%ecx, %edx
	movl	%edx, (%rax)
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, (%rax)
	addl	$1, -8(%rbp)
.L6:
	movl	-8(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L7
	addl	$1, -4(%rbp)
.L5:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L8
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movl	$0, -4(%rbp)
	jmp	.L9
.L14:
	movl	$0, -8(%rbp)
	jmp	.L10
.L13:
	movl	$0, -12(%rbp)
	jmp	.L11
.L12:
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %ecx
	movl	-8(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %ecx
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %esi
	movl	-12(%rbp), %eax
	addl	%esi, %eax
	cltq
	leaq	0(,%rax,4), %rsi
	movq	-32(%rbp), %rax
	addq	%rsi, %rax
	movl	(%rax), %esi
	movl	-12(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edi
	movl	-8(%rbp), %eax
	addl	%edi, %eax
	cltq
	leaq	0(,%rax,4), %rdi
	movq	-40(%rbp), %rax
	addq	%rdi, %rax
	movl	(%rax), %eax
	imull	%esi, %eax
	addl	%ecx, %eax
	movl	%eax, (%rdx)
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %ecx
	movl	-8(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %ecx
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	-12(%rbp), %esi
	addl	$1, %esi
	addl	%esi, %eax
	cltq
	leaq	0(,%rax,4), %rsi
	movq	-32(%rbp), %rax
	addq	%rsi, %rax
	movl	(%rax), %esi
	movl	-12(%rbp), %eax
	addl	$1, %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edi
	movl	-8(%rbp), %eax
	addl	%edi, %eax
	cltq
	leaq	0(,%rax,4), %rdi
	movq	-40(%rbp), %rax
	addq	%rdi, %rax
	movl	(%rax), %eax
	imull	%esi, %eax
	addl	%ecx, %eax
	movl	%eax, (%rdx)
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %ecx
	movl	-8(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %ecx
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	-12(%rbp), %esi
	addl	$2, %esi
	addl	%esi, %eax
	cltq
	leaq	0(,%rax,4), %rsi
	movq	-32(%rbp), %rax
	addq	%rsi, %rax
	movl	(%rax), %esi
	movl	-12(%rbp), %eax
	addl	$2, %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edi
	movl	-8(%rbp), %eax
	addl	%edi, %eax
	cltq
	leaq	0(,%rax,4), %rdi
	movq	-40(%rbp), %rax
	addq	%rdi, %rax
	movl	(%rax), %eax
	imull	%esi, %eax
	addl	%ecx, %eax
	movl	%eax, (%rdx)
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %ecx
	movl	-8(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %ecx
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	-12(%rbp), %esi
	addl	$3, %esi
	addl	%esi, %eax
	cltq
	leaq	0(,%rax,4), %rsi
	movq	-32(%rbp), %rax
	addq	%rsi, %rax
	movl	(%rax), %esi
	movl	-12(%rbp), %eax
	addl	$3, %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edi
	movl	-8(%rbp), %eax
	addl	%edi, %eax
	cltq
	leaq	0(,%rax,4), %rdi
	movq	-40(%rbp), %rax
	addq	%rdi, %rax
	movl	(%rax), %eax
	imull	%esi, %eax
	addl	%ecx, %eax
	movl	%eax, (%rdx)
	addl	$4, -12(%rbp)
.L11:
	movl	-12(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L12
	addl	$1, -8(%rbp)
.L10:
	movl	-8(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L13
	addl	$1, -4(%rbp)
.L9:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L14
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movq	-96(%rbp), %rdx
	movq	-80(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movq	-88(%rbp), %rdx
	movq	-72(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC2(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movl	-20(%rbp), %eax
	leal	1(%rax), %edx
	movl	-20(%rbp), %eax
	subl	$1, %eax
	imull	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %esi
	movl	-20(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	-20(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	movl	%esi, %r8d
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movq	-56(%rbp), %rax
	movq	%rax, -120(%rbp)
	movsd	-120(%rbp), %xmm0
	movl	$.LC4, %edi
	movl	$1, %eax
	call	printf
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	free
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
