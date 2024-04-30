.data
record: .space 8

.text
.globl init_student
init_student:
    sll $t0, $a1, 22
    or $t0, $t0, $a0
    sw $t0, 0($a3)
    sw $a2, 4($a3)
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
