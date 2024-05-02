.text
.globl init_student

init_student:
    sw $a0, 0($a3)          
    sw $a1, 4($a3)         
    sw $a2, 8($a3)          
    jr $ra                       

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
