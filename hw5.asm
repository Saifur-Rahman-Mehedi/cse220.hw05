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


init_student_array:
 
    jr $ra

insert:
    jr $ra
    
search:
    jr $ra

delete:
    jr $ra
