# Sum 4 numbers using function calls.
# Note the use of the stack to save $ra in main,
# and $ra $a0, $a1, $s0 in sum2.
# For simplicity we are not using a frame pointer
# Only push/pop are needed for this.

main:
        push    $ra             # move stack pointer down to make room
                                # save $ra on $stack


        li      $a0, 11         # sum4(11, 13, 17, 19);
        li      $a1, 13
        li      $a2, 17
        li      $a3, 19
        jal     sum4

        move    $a0, $v0        # printf("%d", z);
        li      $v0, 1
        syscall

        li      $a0, '\n'       # printf("%c", '\n');
        li      $v0, 11
        syscall

        pop     $ra             # recover $ra from $stack
                                # move stack pointer back up to what it was when main called
                                # equivalent to `pop $ra`

        li      $v0, 0          # return 0 from function main
        jr      $ra             # return from function main

# Sums 4 numbers and returns the result.
#
# Arguments:
# - $a0 = int a
# - $a1 = int b
# - $a2 = int c
# - $a3 = int d
#
# Returns: int
#
# Used:         [$ra, $s0, $s1, $s2, $s3, $a0, $a1]
# Clobbered:    [$a0, $a1]
# Stack:        [$ra, $s0, $s1, $s2, $s3]
#
# Registers:
# - $s0 = int a
# - $s1 = int b
# - $s2 = int res1
# - $s3 = int res2
sum4:
sum4__prologue:
	begin		# Backup the registers we overwrite (only $ra, $s0, $s1, ...)
	push	$ra
	push	$s0
	push	$s1
	push	$s2
	push	$s3

sum4__body:
	move	$s0, $a0	# Backup a, b for use later
	move	$s1, $a1

	move	$a0, $a2	# int res1 = sum2(c, d);
	move	$a1, $a3
	jal	sum2
	move	$s2, $v0

	move	$a0, $s0	# int res2 = sum2(a, b);
	move	$a1, $s1
	jal	sum2
	move	$s3, $v0

	move	$a0, $s2	# sum2(res1, res2)
	move	$a1, $s3
	jal	sum2

sum4__epilogue:
	pop	$s3	# Restore the registers we backed up
	pop	$s2
	pop	$s1
	pop	$s0
	pop	$ra
	end

	jr	$ra	# return

# Sum 2 numbers and return the result.
#
# Arguments:
# - $a0 = int x
# - $a1 = int y
#
# Returns: int
sum2:
	add	$v0, $a0, $a1	# return x + y;
	jr	$ra
