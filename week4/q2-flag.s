# This program prints out a danish flag, by
# looping through the rows and columns of the flag.
# Each element inside the flag is a single character.
# (i.e., 1 byte).
#
# (Dette program udskriver et dansk flag, ved at
# sløjfe gennem rækker og kolonner i flaget.)
#

# Registers:
# - $t0 = int row
# - $t1 = int col

FLAG_ROWS = 6
FLAG_COLS = 12

main:
	li	$t0, 0		# int row = 0;

main__for_row_cond:		# while (row < FLAG_ROWS) {
	bge	$t0, FLAG_ROWS, main__for__row_end

	li	$t1, 0		# int col = 0;

main__for_col_cond:		# while (col < FLAG_COLS) {
	bge	$t1, FLAG_COLS, main__for__col_end

	mul	$t2, $t0, FLAG_COLS	# 1. Convert 2D array indices into a single 1D array index
	add	$t2, $t2, $t1
	la	$t3, flag		# 2. Load the array's start address
	add	$t3, $t3, $t2		# 3. Add the offset
	lb	$t4, ($t3)		# 4. Load the value from that address in memory

	move	$a0, $t4	# printf("%c", flag[row][col]);
	li	$v0, 11
	syscall

	addi	$t1, $t1, 1	# col++;
	b	main__for_col_cond

main__for__col_end:
	li	$a0, '\n'	# printf("\n");
	li	$v0, 11
	syscall

	addi	$t0, $t0, 1	# row++;
	b	main__for_row_cond

main__for__row_end:
	li	$v0, 0          # return 0;
	jr	$ra

.data
# This label inside the data region refers to the bytes of the flag.
# Note that even thought the bytes are listed on separate lines,
# they are actually stored as a single contiguous chunk or 'string' in memory.
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
