.data
.align 2
unique_record: .space 12  

.text
.globl init_student
init_student:
    sw $a0, 0($a3)  # Store student ID at base address of record
    sw $a1, 4($a3)  # Store credits next to ID
    sw $a2, 8($a3)  # Store address of the student's name
    jr $ra          # Return from the subroutine

.text
.globl print_student
print_student:
    lw $t0, 0($a0)  # Load student ID
    lw $t1, 4($a0)  # Load credits
    lw $t2, 8($a0)  # Load name pointer

    move $a0, $t0
    li $v0, 1
    syscall          # Print ID

    li $a0, ' '
    li $v0, 11
    syscall          # Print space

    move $a0, $t1
    li $v0, 1
    syscall          # Print credits

    li $a0, ' '
    li $v0, 11
    syscall          # Print space

    move $a0, $t2
    li $v0, 4
    syscall          # Print name

    li $a0, '\n'
    li $v0, 11
    syscall          # Print newline for separation

    jr $ra           # Return from subroutine

.text
.globl init_student_array
init_student_array:
    lw $s0, 0($sp)   # Load base address of the records array
    move $t0, $a1    # Pointer to ID list
    move $t1, $a2    # Pointer to credits list
    move $t2, $a3    # Pointer to names array

    li $t3, 0        # Counter for loop
    blez $a0, init_exit  # Exit if number of students is zero

init_loop:
    beq $t3, $a0, init_exit  # End loop if processed all students

    lw $a0, 0($t0)  # Load student ID
    lw $a1, 0($t1)  # Load credits
    la $a2, ($t2)   # Load address of the current name

    la $a3, ($s0)   # Address to store the record
    jal init_student    # Initialize student record

    addiu $t0, $t0, 4   # Next student ID
    addiu $t1, $t1, 4   # Next credit
    addiu $s0, $s0, 12  # Next record

    find_next_name:     # Move to the next name
        lbu $t4, 0($t2)
        beqz $t4, update_name_pointer  # Check for null terminator
        addiu $t2, $t2, 1
        j find_next_name
    update_name_pointer:
        addiu $t2, $t2, 1  # Move past the null terminator to start of next name

    addiu $t3, $t3, 1
    j init_loop

init_exit:
    jr $ra

# Additional operations if needed
insert:
    jr $ra
    
search:
    jr $ra

delete:
    jr $ra
