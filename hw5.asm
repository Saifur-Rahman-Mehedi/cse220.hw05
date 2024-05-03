.data
.align 2
_record: .space 12  # Ensure enough space for ID (4 bytes), Credits (4 bytes), and pointer (4 bytes)

.text
.globl init_student
init_student:
    # Store the ID, credits, and the address of the name string into the record
    sw $a0, 0($a3)      # Store the ID at the beginning of the record
    sw $a1, 4($a3)      # Store the credits next to the ID
    sw $a2, 8($a3)      # Store the pointer to the name string
    jr $ra              # Return to the caller

.text
.globl print_student
print_student:
    # Load student record fields from memory
    lw $t0, 0($a0)      # Load student ID
    lw $t1, 4($a0)      # Load credits
    lw $t2, 8($a0)      # Load address of the name string

    # Print the ID
    move $a0, $t0
    li $v0, 1           # syscall for printing integer
    syscall

    # Print space
    li $a0, ' '
    li $v0, 11          # syscall for printing character
    syscall

    # Print the credits
    move $a0, $t1
    li $v0, 1           # syscall for printing integer
    syscall

    # Print space
    li $a0, ' '
    li $v0, 11          # syscall for printing character
    syscall

    # Print the name
    move $a0, $t2
    li $v0, 4           # syscall for printing string
    syscall

    jr $ra              # Return to the caller        
	
init_student_array:
	jr $ra
	
insert:
	jr $ra
	
search:
	jr $ra

delete:
	jr $ra
