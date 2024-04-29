.data
.align 2   # Ensure that the data is aligned to word boundaries

.text
.globl init_student

# Function: init_student
# Arguments:
#   $a0 - address of the record to initialize (student record)
#   $a1 - ID (22 bits)
#   $a2 - credits (10 bits)
#   $a3 - pointer to the student's name (32 bits)
init_student:
    # Combine ID and credits into a single word.
    sll $t0, $a1, 10        # Shift ID left to leave space for credits
    or $t0, $t0, $a2        # Combine ID with credits in the lower 10 bits

    sw $t0, 0($a0)          # Store ID and credits at the beginning of the record
    sw $a3, 4($a0)          # Store the pointer to the name right after

    jr $ra                  # Return from the function
                          
	
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
