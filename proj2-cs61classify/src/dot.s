.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int vectors
# Arguments:
#   a0 (int*) is the pointer to the start of v0
#   a1 (int*) is the pointer to the start of v1
#   a2 (int)  is the length of the vectors
#   a3 (int)  is the stride of v0
#   a4 (int)  is the stride of v1
# Returns:
#   a0 (int)  is the dot product of v0 and v1
# Exceptions:
# - If the length of the vector is less than 1,
#   this function terminates the program with error code 57
# - If the stride of either vector is less than 1,
#   this function terminates the program with error code 58
# =======================================================
dot:
    li t0, 1
    blt a2, t0, exit_dot1
    blt a3, t0, exit_dot2
    blt a4, t0, exit_dot2
    # Prologue
    
     #init
    add t0, x0, x0 #ans
    add t1, x0, x0 #index

    slli a3, a3, 2
    slli a4, a4, 2


loop_start:
    beq t1, a2, loop_end

    lw t2, 0(a0)
    lw t3, 0(a1)

    mul t4, t2, t3
    add t0, t0, t4

    add a0, a0, a3
    add a1, a1, a4
    addi t1, t1, 1

    j loop_start

loop_end:
    
    add a0, t0, x0
    # Epilogue


    ret

exit_dot1:
    li a1, 57
    call exit2
    
exit_dot2:
    li a1, 58
    call exit2
