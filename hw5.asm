.data
.align 2
unique_record: .space 12  

.text
.globl init_student
init_student:
    sw $a0, 0($a3)  # Store ID
    sw $a1, 4($a3)  # Store credits
    sw $a2, 8($a3)  # Store address of name
    jr $ra

.text
.globl print_student
print_student:
    lw $t0, 0($a0)
    lw $t1, 4($a0)
    lw $t2, 8($a0)

    # Print ID
    move $a0, $t0
    li $v0, 1
    syscall

    li $a0, ' '
    li $v0, 11
    syscall

    # Print credits
    move $a0, $t1
    li $v0, 1
    syscall

    li $a0, ' '
    li $v0, 11
    syscall

    # Print name
    la $a0, 0($t2)
    li $v0, 4
    syscall

    # New line after each record
    li $a0, '\n'
    li $v0, 11
    syscall

    jr $ra

.text
.globl init_student_array
init_student_array:
    lw $s0, 0($sp)  # Address of record space
    move $t0, $a1   # ID list
    move $t1, $a2   # Credits list
    move $t2, $a3   # Names array

    li $t3, 0       # Counter for number of students
    blez $a0, init_exit  # Exit if no students

init_loop:
    beq $t3, $a0, init_exit  # All students processed

    lw $a0, 0($t0)  # Load ID
    lw $a1, 0($t1)  # Load credits
    la $a2, 0($t2)  # Start of name string

    la $a3, 0($s0)  # Target record
    jal init_student  # Initialize student

    addiu $t0, $t0, 4  # Next ID
    addiu $t1, $t1, 4  # Next credits
    addiu $s0, $s0, 12 # Next record address

    # Find next name string
    find_next_name:
        lbu $t4, 0($t2)
        beqz $t4, update_name_pointer
        addiu $t2, $t2, 1
        j find_next_name
    update_name_pointer:
        addiu $t2, $t2, 1  # Skip null terminator

    addiu $t3, $t3, 1
    j init_loop

init_exit:
    jr $ra
