.data
student_record:
    .word 0    # ID
    .word 0    # Credits
    .space 128 # Name

.text

init_student:
    sw $a0, student_record
    sw $a1, student_record + 4
    
    la $t0, student_record + 8  
    la $t1, 0($a2)              
    name_copy:
        lb $t2, 0($t1)         
        sb $t2, 0($t0)         
        beqz $t2, end_copy     
        addiu $t0, $t0, 1      
        addiu $t1, $t1, 1      
        j name_copy             
    end_copy:
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
