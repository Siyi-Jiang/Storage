.data

loop: "Sort Results: "

.text
.globl studentMain
studentMain:
	addiu $sp, $sp, -24 # allocate stack space -- default of 24 here
	sw $fp, 0($sp) # save caller¡¯s frame pointer
	sw $ra, 4($sp) # save return address
	addiu $fp, $sp, 20 # setup main¡¯s frame pointer
	
	la $t0, sort	# t0 is address of the sort
	lw $t0, 0($t0) 	# t0 = sort
	beq $t0, $zero, Compare # move to Compare if sort = 0
	
Sort:
	la $t0, alpha
	lw $s0, 0($t0) # val1 = alpha
	la $t0, bravo
	lw $s1, 0($t0) # val2 = bravo
	la $t0, charlie
	lw $s2, 0($t0) # val3 = charlie
	la $t0, delta
	lw $s3, 0($t0) # val4 = delta
	
SortLoop:
	slt $t0, $s1, $s0
	beq $t0, $zero, check2 # if val1 <= val2, jump to next check
	
	add $t1, $zero, $s0 # temp = val1
	add $s0, $zero, $s1 # val1 = val2
	add $s1, $zero, $t1 # val2 = temp
	
	j SortLoop
	
check2:
	slt $t0, $s2, $s1
	beq $t0, $zero, check3 # if val2 <= val3, jump to next check
	
	add $t1, $zero, $s1 # temp = val2
	add $s1, $zero, $s2 # val2 = val3
	add $s2, $zero, $t1 # val3 = temp
	
	j SortLoop
	
check3:
	slt $t0, $s3, $s2
	beq $t0, $zero, Out # if val3 <= val4, break loop
	
	add $t1, $zero, $s2 # temp = val3
	add $s2, $zero, $s3 # val3 = val4
	add $s3, $zero, $t1 # val4 = temp
	
	j SortLoop
	
Out:
	
	syscall print("Sort Results: %d %d %d %d\n", val1,val2,val3,val4);
	
Compare:
	la $t0, compare	# t0 is address of the compare
	lw $t0, 0($t0) 	# t0 = compare
	beq $t0, $zero, Swap # move to Swap if compare = 0
	
	la $t1, bravo
	lw $s0, 0($t1) # s0 = bravo
	la $t1, charlie
	lw $s1, 0($t1) # s1 = charlie
	
	slt $s2, $s0, $s1
	beq $s2, $zero, nextcheck # if bravo >= charlie, jump to nextcheck
	
	syscall print("LESS\n");
	j Swap
	
nextcheck: 
	slt $s2, $s1, $s0
	beq $s2, $zero, equal # if bravo <- charlie, jump to equal
	
	syscall print("MORE\n");
	j Swap
	
equal:
	syscall print("SAME\n");

Swap:
	la $t0, swap	# t0 is address of the swap
	lw $t0, 0($t0) 	# t0 = swap
	beq $t0, $zero, Print # move to Print if swap = 0
	
	la $t0, alpha # t0 is address of alpha
	lw $s0, 0($t0) # s0 = alpha
	la $t1, bravo # t1 is address of bravo
	lw $s1, 0($t1) # s1 = bravo
	
	sw $s1, 0($t0) # save value of bravo to alpha
	sw $s0, 0($t1) # save value of alpha to bravo
	
	la $t0, charlie # t0 is address of charlie
	lw $s0, 0($t0) # s0 = charlie
	la $t1, delta # t1 is address of delta
	lw $s1, 0($t1) # s1 = delta
	
	sw $s1, 0($t0) # save value of delta to charlie
	sw $s0, 0($t1) # save value of charlie to delta
		
Print:
	la $t0, print	# t0 is address of the print
	lw $t0, 0($t0) 	# t0 = print
	beq $t0, $zero, End # move to End if print = 0
	
	la $t0, alpha
	lw $s0, 0($t0) # s0 = alpha
	la $t0, bravo
	lw $s1, 0($t0) # s1 = beta
	la $t0, charlie
	lw $s2, 0($t0) # s2 = charlie
	la $t0, delta
	lw $s3, 0($t0) # s3 = delta
	
	syscall print("Cur Values: %d %d %d %d", $s0, $s1, $s2, $s3);
	
End:
	lw $ra, 4($sp) # get return address from stack
	lw $fp, 0($sp) # restore the caller¡¯s frame pointer
	addiu $sp, $sp, 24 # restore the caller¡¯s stack pointer
	jr $ra # return to caller¡¯s code
