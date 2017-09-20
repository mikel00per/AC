	.file	"daxpy.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Introduzca El tama\303\261o N:"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"No se ha podido reservar memoria"
	.align 8
.LC7:
	.string	"Tiempo transcurrido en segundos: %0.4f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB21:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	cmpl	$1, %edi
	jle	.L46
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	%rax, %rbx
	cltq
	leaq	1(,%rax,4), %r12
	movq	%r12, %rdi
	call	malloc
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	malloc
	testq	%rbp, %rbp
	movq	%rax, %r12
	je	.L3
	testq	%rax, %rax
	je	.L3
	testl	%ebx, %ebx
	jle	.L47
	leaq	4(%rax), %rax
	shrq	$2, %rax
	negq	%rax
	andl	$3, %eax
	cmpl	%ebx, %eax
	cmova	%ebx, %eax
	cmpl	$6, %ebx
	cmovbe	%ebx, %eax
	testl	%eax, %eax
	je	.L24
	cmpl	$1, %eax
	movl	$2, 4(%r12)
	movl	$3, 4(%rbp)
	je	.L25
	cmpl	$2, %eax
	movl	$3, 8(%r12)
	movl	$4, 8(%rbp)
	je	.L26
	cmpl	$3, %eax
	movl	$4, 12(%r12)
	movl	$5, 12(%rbp)
	je	.L27
	cmpl	$4, %eax
	movl	$5, 16(%r12)
	movl	$6, 16(%rbp)
	je	.L28
	cmpl	$6, %eax
	movl	$6, 20(%r12)
	movl	$7, 20(%rbp)
	jne	.L29
	movl	$7, 24(%r12)
	movl	$8, 24(%rbp)
	movl	$7, %ecx
.L8:
	cmpl	%eax, %ebx
	je	.L48
.L7:
	movl	%ebx, %r8d
	leal	-1(%rbx), %esi
	movl	%eax, %edi
	subl	%eax, %r8d
	leal	-4(%r8), %edx
	subl	%eax, %esi
	shrl	$2, %edx
	addl	$1, %edx
	cmpl	$2, %esi
	leal	0(,%rdx,4), %r9d
	jbe	.L10
	movl	%ecx, 12(%rsp)
	leaq	4(,%rdi,4), %rdi
	xorl	%eax, %eax
	movd	12(%rsp), %xmm6
	xorl	%esi, %esi
	movdqa	.LC3(%rip), %xmm4
	leaq	(%r12,%rdi), %r10
	addq	%rbp, %rdi
	pshufd	$0, %xmm6, %xmm0
	movdqa	.LC4(%rip), %xmm3
	movdqa	.LC5(%rip), %xmm2
	paddd	.LC2(%rip), %xmm0
.L11:
	movdqa	%xmm0, %xmm1
	movdqa	%xmm0, %xmm5
	paddd	%xmm2, %xmm0
	addl	$1, %esi
	paddd	%xmm3, %xmm1
	movups	%xmm0, (%rdi,%rax)
	paddd	%xmm4, %xmm5
	movaps	%xmm1, (%r10,%rax)
	addq	$16, %rax
	cmpl	%esi, %edx
	jbe	.L49
	movdqa	%xmm5, %xmm0
	jmp	.L11
.L49:
	addl	%r9d, %ecx
	cmpl	%r9d, %r8d
	je	.L13
.L10:
	leal	1(%rcx), %edx
	leal	2(%rcx), %eax
	movslq	%ecx, %rsi
	cmpl	%edx, %ebx
	movl	%edx, (%r12,%rsi,4)
	movl	%eax, 0(%rbp,%rsi,4)
	jl	.L13
	leal	3(%rcx), %esi
	movslq	%edx, %rdx
	cmpl	%eax, %ebx
	movl	%eax, (%r12,%rdx,4)
	movl	%esi, 0(%rbp,%rdx,4)
	jl	.L13
	cltq
	addl	$4, %ecx
	movl	%esi, (%r12,%rax,4)
	movl	%ecx, 0(%rbp,%rax,4)
.L13:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	leaq	4(%rbp), %rdx
	movq	%rdx, %rax
	shrq	$2, %rax
	negq	%rax
	andl	$3, %eax
	cmpl	%ebx, %eax
	cmova	%ebx, %eax
	cmpl	$4, %ebx
	cmovbe	%ebx, %eax
.L17:
	testl	%eax, %eax
	je	.L50
.L23:
	imull	$3, 4(%r12), %ecx
	addl	%ecx, (%rdx)
	cmpl	$1, %eax
	je	.L32
	imull	$3, 8(%r12), %edx
	addl	%edx, 8(%rbp)
	cmpl	$2, %eax
	je	.L33
	imull	$3, 12(%r12), %edx
	addl	%edx, 12(%rbp)
	cmpl	$4, %eax
	jne	.L34
	imull	$3, 16(%r12), %edx
	movl	$5, %ecx
	addl	%edx, 16(%rbp)
.L19:
	cmpl	%eax, %ebx
	je	.L22
.L18:
	movl	%ebx, %r8d
	leal	-1(%rbx), %esi
	movl	%eax, %edi
	subl	%eax, %r8d
	leal	-4(%r8), %edx
	subl	%eax, %esi
	shrl	$2, %edx
	addl	$1, %edx
	cmpl	$2, %esi
	leal	0(,%rdx,4), %r10d
	jbe	.L21
	leaq	4(,%rdi,4), %rdi
	xorl	%eax, %eax
	xorl	%esi, %esi
	leaq	0(%rbp,%rdi), %r9
	addq	%r12, %rdi
.L15:
	movdqu	(%rdi,%rax), %xmm1
	addl	$1, %esi
	movdqa	%xmm1, %xmm0
	pslld	$1, %xmm0
	paddd	%xmm1, %xmm0
	paddd	(%r9,%rax), %xmm0
	movaps	%xmm0, (%r9,%rax)
	addq	$16, %rax
	cmpl	%edx, %esi
	jb	.L15
	addl	%r10d, %ecx
	cmpl	%r10d, %r8d
	je	.L22
.L21:
	movslq	%ecx, %rax
	addl	$1, %ecx
	imull	$3, (%r12,%rax,4), %edx
	addl	%edx, 0(%rbp,%rax,4)
	cmpl	%ecx, %ebx
	jl	.L22
	movslq	%ecx, %rcx
	imull	$3, (%r12,%rcx,4), %eax
	addl	%eax, 0(%rbp,%rcx,4)
.L22:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	40(%rsp), %rax
	pxor	%xmm0, %xmm0
	subq	24(%rsp), %rax
	pxor	%xmm1, %xmm1
	movl	$.LC7, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC6(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	printf
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L50:
	.cfi_restore_state
	movl	$1, %ecx
	jmp	.L18
.L48:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	leaq	4(%rbp), %rdx
	movq	%rdx, %rax
	shrq	$2, %rax
	negq	%rax
	andl	$3, %eax
	cmpl	%ebx, %eax
	cmova	%ebx, %eax
	cmpl	$4, %ebx
	ja	.L17
	movl	%ebx, %eax
	jmp	.L23
.L24:
	movl	$1, %ecx
	jmp	.L7
.L33:
	movl	$3, %ecx
	jmp	.L19
.L34:
	movl	$4, %ecx
	jmp	.L19
.L32:
	movl	$2, %ecx
	jmp	.L19
.L28:
	movl	$5, %ecx
	jmp	.L8
.L29:
	movl	$6, %ecx
	jmp	.L8
.L25:
	movl	$2, %ecx
	jmp	.L8
.L26:
	movl	$3, %ecx
	jmp	.L8
.L27:
	movl	$4, %ecx
	jmp	.L8
.L47:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	jmp	.L22
.L46:
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC3:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC4:
	.long	1
	.long	1
	.long	1
	.long	1
	.align 16
.LC5:
	.long	2
	.long	2
	.long	2
	.long	2
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC6:
	.long	0
	.long	1104006501
	.ident	"GCC: (GNU) 6.1.1 20160501"
	.section	.note.GNU-stack,"",@progbits
