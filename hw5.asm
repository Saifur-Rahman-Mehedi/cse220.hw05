.data
.align 2
_record: .space 12

.text
.globl init_student
init_student:
    sw $a0, 0($a3)      # Store the ID at the beginning of the record.
    sw $a1, 4($a3)      # Store the credits next to the ID.
    sw $a2, 8($a3)      # Store the address of the name string next.
    jr $ra              # Return to the caller.
                    
.text
.globl print_student
print_student:
    lw $t0, 0($a0)      # Load student ID
    lw $t1, 4($a0)      # Load credits
    lw $t2, 8($a0)      # Load address of the name string

    # Print ID
    move $a0, $t0
    li $v0, 1           # syscall for printing integer
    syscall

    # Print space
    li $a0, ' '
    li $v0, 11          # syscall for printing character
    syscall

    # Print credits
    move $a0, $t1
    li $v0, 1           # syscall for printing integer
    syscall

    # Print space
    li $a0, ' '
    li $v0, 11          # syscall for printing character
    syscall

    # Print name
    move $a0, $t2
    li $v0, 4           # syscall for printing string
    syscall

    jr $ra              # Return to the caller.               
	
init_student_array:
	jr $ra
	
insert:
	jr $ra
	
search:
	jr $ra

delete:
	jr $ra
