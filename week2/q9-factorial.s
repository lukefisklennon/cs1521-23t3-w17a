# Simple factorial calculator - without error checking

# $t0 = n
# $t1 = fac
# $t2 = i

	.text
main:
	la	$a0, prompt	# printf("n  = ");
	li	$v0, 4
	syscall

	li	$v0, 5		# scanf("%d", &x);
	syscall
	move	$t0, $v0

	li	$t1, 1		# int fac = 1;
	li	$t2, 1		# int i = 1;

main__loop_cond:
	bgt	$t2, $t0, main__loop_end	# if (i > n) goto main__loop_end;

main__loop_body:
	mul	$t1, $t1, $t2	# fac = fac * i;
	addi	$t2, 1		# i = i + 1;

	b	main__loop_cond	# goto main__loop_cond;

main__loop_end:
	la	$a0, result	# printf("n! = ");
	li	$v0, 4
	syscall

	move	$a0, $t1	# printf("%d", fac);
	li	$v0, 1
	syscall

	li	$a0, '\n'	# printf("\n");
	li	$v0, 11
	syscall

	li	$v0, 0
	jr	$ra

	.data
prompt:
	.asciiz "n  = "
result:
	.asciiz "n! = "
