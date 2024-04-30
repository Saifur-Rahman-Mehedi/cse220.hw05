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

.globl print_student
# Argument:
# $a0 - Address of Record (struct student *)

print_student:
    lw $t0, 0($a0)             # Load the combined ID and credits
    li $t1, 0x3FFFFF           # Mask for ID
    and $t2, $t0, $t1          # Extract ID
    srl $t3, $t0, 22           # Shift right to get credits

    li $v0, 1                  # Prepare to print ID
    move $a0, $t2
    syscall

    li $v0, 11                 # Print space
    li $a0, 32
    syscall

    li $v0, 1                  # Prepare to print Credits
    move $a0, $t3
    syscall

    li $v0, 11                 # Print space
    li $a0, 32
    syscall

    lw $a0, 4($a0)             # Load the address of the name
    li $v0, 4                  # Prepare to print name
    syscall

    jr $ra                     # Return from the function


	
init_student_array:
	jr $ra
	
insert:
	jr $ra
	
search:
	jr $ra

delete:
	jr $ra
