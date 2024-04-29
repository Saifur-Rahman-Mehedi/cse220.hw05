.data
.align 2 
_record: .space 8  

.text
.globl main
.globl init_student

main:
    la $a0, _record  
    li $a1, 3126375  
    li $a2, 314      
    la $a3, _name    

    jal init_student  

    li $v0, 10
    syscall  # Exit the program.

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
