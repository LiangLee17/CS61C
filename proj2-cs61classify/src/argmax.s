.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 (int*) is the pointer to the start of the vector
#	a1 (int)  is the # of elements in the vector
# Returns:
#	a0 (int)  is the first index of the largest element
# Exceptions:
# - If the length of the vector is less than 1,
#   this function terminates the program with error code 57
# =================================================================
argmax:
    li t5, 1
    blt a1, t5, exit_argmax
    # Prologue
         
    lw t0, 0(a0)       #max_value
    add t1, x0, x0     #max_index
    
    addi t2, x0, 0

loop_start:
    beq t2, a1, loop_end
    lw t3, 0(a0)
    bgt t3, t0, update
    
loop_continue:
    addi a0, a0, 4
    addi t2, t2, 1
    j loop_start
    
update:
    add t1, t2, x0
    add t0, t3, x0
    j loop_continue


loop_end:
    
    add a0, t1, x0
    # Epilogue

    ret

exit_argmax:
    li a1, 57
    call exit2
