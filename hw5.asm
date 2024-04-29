.text
.globl init_student

init_student:
    # Ensure address in $a0 is word-aligned
    andi $t2, $a0, 3
    bnez $t2, handle_misalignment

    li $t0, 0                 
    sll $t1, $a1, 10          
    or $t0, $t0, $t1          
    or $t0, $t0, $a2          

    sw $t0, 0($a0)            
    sw $a3, 4($a0)            

    jr $ra                    

handle_misalignment:
    addi $a0, $a0, 4
    andi $a0, $a0, -4
    j init_student                            
	
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
