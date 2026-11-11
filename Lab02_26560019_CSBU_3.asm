.data
board: .word 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
.globl main
main:
    la   $s0, board       # $s0 = base address of board
    
    # --- Cell (1, 2) = 1 ---
    li   $s1, 1           # r = 1
    li   $s2, 2           # c = 2
    
    sll  $t0, $s1, 1      # $t0 = 2 * r
    add  $t0, $t0, $s1    # $t0 = 2 * r + r = 3 * r
    add  $t0, $t0, $s2    # $t0 = 3 * r + c (word index)
    sll  $t0, $t0, 2      # $t0 = 4 * (3 * r + c) (byte offset)
    add  $t1, $s0, $t0    # $t1 = effective address
    
    li   $t2, 1           # value X = 1
    sw   $t2, 0($t1)      # store 1 into cell (1, 2)
    
    # --- Cell (2, 0) = 2 ---
    li   $s1, 2           # r = 2
    li   $s2, 0           # c = 0
    
    sll  $t0, $s1, 1      # $t0 = 2 * r
    add  $t0, $t0, $s1    # $t0 = 3 * r
    add  $t0, $t0, $s2    # $t0 = 3 * r + c
    sll  $t0, $t0, 2      # byte offset
    add  $t1, $s0, $t0    # effective address
    
    li   $t2, 2           # value O = 2
    sw   $t2, 0($t1)      # store 2 into cell (2, 0)
    
    li   $v0, 10
    syscall