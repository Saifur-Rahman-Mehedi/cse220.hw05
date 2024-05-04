# Main entry for testing
.text
.globl main
main:
    lw $a0, _num_students
    la $a1, _id_list
    la $a2, _credits_list
    la $a3, _names

    addi $sp, $sp, -4
    la $s0, _records
    sw $s0, 0($sp)

    jal init_student_array
    addi $sp, $sp, 4

    li $s1, 0  # Loop counter
    lw $s2, _num_students

_print_loop:
    beq $s1, $s2, _exit_print_loop
    lw $a0, 0($s0)  # $s0 stores pointer to next student record
    jal print_student
    
    li $a0, '\n'
    li $v0, 11
    syscall
    
    addi $s0, $s0, 12  # Go to the next student record
    addi $s1, $s1, 1
    j _print_loop

_exit_print_loop:
    li $v0, 10
    syscall


# Data segment setup as per test case requirements
.data
_num_students: .word 3
_id_list: .word 3126375, 1264356, 553656
_credits_list: .word 314, 511, 290
_names: .ascii "Kevin T. McDonnell\0Wolfie Seawolf\0Kelly Chen\0"
_records: .space 36  # 3 records each of 12 bytes

# Procedures for initializing and printing students
.text
.globl init_student
init_student:
    sw $a0, 0($a3)  # Store ID
    sw $a1, 4($a3)  # Store credits
    sw $a2, 8($a3)  # Store pointer to the name
    jr $ra

.globl print_student
print_student:
    lw $t0, 0($a0)  # Load ID
    lw $t1, 4($a0)  # Load credits
    lw $t2, 8($a0)  # Load name pointer

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
    move $a0, $t2
    li $v0, 4
    syscall

    jr $ra

.globl init_student_array
init_student_array:
    lw $s0, 0($sp)
    move $t0, $a1
    move $t1, $a2
    move $t2, $a3

    li $t3, 0
    blez $a0, init_exit

init_loop:
    beq $t3, $a0, init_exit

    lw $a0, 0($t0)
    lw $a1, 0($t1)
    move $a2, $t2

    add $a3, $s0, $zero
    jal init_student

    addiu $t0, $t0, 4
    addiu $t1, $t1, 4
    addiu $s0, $s0, 12

    # Find the next name in the names string
    find_next_name:
        lbu $t4, 0($t2)
        beqz $t4, update_name_pointer
        addiu $t2, $t2, 1
        j find_next_name
    update_name_pointer:
        addiu $t2, $t2, 1

    addiu $t3, $t3, 1
    j init_loop

init_exit:
    jr $ra
