.text
.globl init_student

init_student:
    andi $t0, $a0, 3
    bnez $t0, align_address

continue:
    sll $t1, $a1, 10
    or $t0, $t1, $a2

    sw $t0, 0($a0)
    sw $a3, 4($a0)

    jr $ra

align_address:
    addi $a0, $a0, 4
    andi $a0, $a0, 0xFFFC
    j continue

                          
	
print_student:
	jr $ra
	
init_student_array:
	jr $ra
	
insert:
	jr $ra
	
search:
	jr $ra

delete:
	jr $ra
