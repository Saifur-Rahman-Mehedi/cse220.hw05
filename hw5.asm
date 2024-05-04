.data
.align 2
unique_record: .space 12  

.text
.globl init_student
init_student:
    sw $a0, 0($a3)
    sw $a1, 4($a3)
    sw $a2, 8($a3)
    jr $ra

.text
.globl print_student
print_student:
    lw $t0, 0($a0)
    lw $t1, 4($a0)
    lw $t2, 8($a0)

    move $a0, $t0
    li $v0, 1
    syscall

    li $a0, ' '
    li $v0, 11
    syscall

    move $a0, $t1
    li $v0, 1
    syscall

    li $a0, ' '
    li $v0, 11
    syscall

    move $a0, $t2
    li $v0, 4
    syscall

    jr $ra

.text
.globl init_student_array
init_student_array:
    lw $s0, 0($sp)
    move $t0, $a1  # Pointer to ID list
    move $t1, $a2  # Pointer to credits list
    move $t2, $a3  # Pointer to names array

    li $t3, 0
    blez $a0, init_exit  # If number of students is zero, exit

init_loop:
    beq $t3, $a0, init_exit  # Exit loop if all students are processed

    lw $a0, 0($t0)  # Load student ID
    lw $a1, 0($t1)  # Load credits
    move $a2, $t2   # Address of the current name

    add $a3, $s0, $zero  # Address to store the record
    jal init_student      # Initialize student record

    addiu $t0, $t0, 4     # Move to the next ID
    addiu $t1, $t1, 4     # Move to the next credits
    addiu $s0, $s0, 12    # Move to the next record space

    find_next_name:       # Parse through the name string
        lbu $t4, 0($t2)
        beqz $t4, update_name_pointer  # If char is zero, move to next name
        addiu $t2, $t2, 1
        j find_next_name
    update_name_pointer:
        addiu $t2, $t2, 1  # Move past the null terminator

    addiu $t3, $t3, 1
    j init_loop

init_exit:
    jr $ra

insert:
    jr $ra
    
search:
    jr $ra

delete:
    jr $ra
