	.text
main:

	li	$v0, 4			# syscall 4: print_string
	la	$a0, hello_world_msg	#
	syscall				# printf("Hello world\n");


	li	$v0, 0
	jr	$ra			# return 0;

	.data

hello_world_msg:
	.asciiz	"Hello world\n"
