.data
record: .space 8  # Space for one record: 4 bytes for ID and credits, 4 bytes for name pointer

.text
.globl init_student
# Arguments:
# $a0 - ID (22 bits)
# $a1 - Credits (10 bits)
# $a2 - Address of Name (char pointer)
# $a3 - Address of Record (struct student *)

init_student:
    li $t0, 0x3FFFFF           # Load mask for ID (22 bits)
    and $t0, $a0, $t0          # Apply mask to ID to ensure it is within 22 bits
    sll $t1, $a1, 22           # Shift credits left to the upper 10 bits of the 32-bit word
    or $t0, $t0, $t1           # Combine ID and credits into a single 32-bit integer
    sw $t0, 0($a3)             # Store ID and credits at the start of the record

    sw $a2, 4($a3)             # Store the address of the name right after the ID and credits
    jr $ra                     # Return to the caller

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
