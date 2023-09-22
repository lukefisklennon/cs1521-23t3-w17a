# $t0 = x

	.text
main:
	la	$a0, prompt	# printf("Enter a number: ");
	li	$v0, 4
	syscall

	li	$v0, 5		# scanf("%d", &x);
	syscall
	move	$t0, $v0

	ble	$t0, 100, main__if_small_big	# if (x > 100 && x < 1000) {
	bge	$t0, 1000, main__if_small_big

main__if_medium:
	la	$a0, medium	# printf("medium\n");
	li	$v0, 4
	syscall

	b	main__if_end

main__if_small_big:
	la	$a0, small_big	# printf("small/big\n");
	li	$v0, 4
	syscall

main__if_end:
	li	$v0, 0		# return 0;
	jr	$ra

	.data
prompt:
	.asciiz "Enter a number: "
medium:
	.asciiz "medium\n"
small_big:
	.asciiz "small/big\n"
