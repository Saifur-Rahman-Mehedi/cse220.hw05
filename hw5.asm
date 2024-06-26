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

insert:
    jr $ra
    
search:
    jr $ra

delete:
    jr $ra
