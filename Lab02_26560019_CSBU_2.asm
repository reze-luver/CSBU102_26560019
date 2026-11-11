.data
str1: .asciiz "nguyen van an"
tag:  .asciiz " [end]"
nl:   .asciiz "\n"

.text
.globl main
main:
    la   $s0, str1        # $s0 = address of str1
    
    # Capitalize offset 0 ('n' -> 'N')
    lb   $t0, 0($s0)
    addi $t0, $t0, -32
    sb   $t0, 0($s0)
    
    # Capitalize offset 7 ('v' -> 'V')
    lb   $t0, 7($s0)
    addi $t0, $t0, -32
    sb   $t0, 7($s0)
    
    # Capitalize offset 11 ('a' -> 'A')
    lb   $t0, 11($s0)
    addi $t0, $t0, -32
    sb   $t0, 11($s0)

    li   $v0, 4           # service 4: print string
    add  $a0, $s0, $zero
    syscall
    
    li   $v0, 4
    la   $a0, nl
    syscall
    
    li   $v0, 10
    syscall