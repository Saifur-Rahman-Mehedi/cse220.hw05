.text
.global init_student

init_student:

    sw $a0, student_record        
    sw $a1, student_record + 4    
    la $t0, student_record + 8    
    la $t1, $a2                   
    name_copy_loop:
        lb $t2, 0($t1)            
        sb $t2, 0($t0)            
        beqz $t2, end_copy        
        addiu $t0, $t0, 1         
        addiu $t1, $t1, 1         
        j name_copy_loop          
    end_copy:
    jr $ra                        

.data

student_record:
    .space 136                                            
	
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
