.text
init_student:
    sll $t0, $a1, 22            # Shift credits left to make space for ID
    or $t0, $t0, $a0            # Combine ID and credits
    sw $t0, 0($a3)              # Store ID and credits at the start of the record
    sw $a2, 4($a3)              # Store the address of the name
    jr $ra                      # Return from the function      
                                         
.text
print_student:
    lw $t0, 0($a0)              # Load the ID and credits
    andi $t1, $t0, 0x3FFFFF     # Mask to get only ID
    srl $t2, $t0, 22            # Shift right to get credits
    li $v0, 1                   # Prepare to print ID
    move $a0, $t1
    syscall
    li $v0, 1                   # Prepare to print credits
    move $a0, $t2
    syscall
    lw $t3, 4($a0)              # Load the address of the name
    li $v0, 4                   # Prepare to print name
    move $a0, $t3
    syscall
    jr $ra                      # Return from the function

	
init_student_array:
	jr $ra
	
insert:
	jr $ra
	
search:
	jr $ra

delete:
	jr $ra
