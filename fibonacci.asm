.text
.globl main

main:
li          $a0, 10         # n = 10
jal         fibonacci       # fibonacci(n)
move        $a0, $v0        # copio el resultado
li          $v0, 1          #
syscall                     # print resultado
li          $v0, 10         #
syscall                     # exit

fibonacci:
                            # prologo
addi        $sp, $sp, -20   # 5 words para el stack frame
sw          $a0, 0($sp)     # guardar a0
sw          $s0, 4($sp)     # guardar s0
sw          $s1, 8($sp)     # guardar s1
sw          $s2, 12($sp)    # guardar s2
sw          $ra, 16($sp)    # guardar ra
                            # fin prologo

li          $s0, 1          # s0 = 1 (para el beq)

beq         $a0, $zero, f0  # if (n == 0)
beq         $a0, $s0, f1    # if (n == 1)

addi        $a0, $a0, -1    # n - 1
jal         fibonacci       #
move        $s1, $v0        # s1 = fibonacci(n - 1)
addi        $a0, $a0, -1    # ya le habiamos restado 1 antes
jal         fibonacci       #
move        $s2, $v0        # s2 = fibonacci(n - 2)
add         $v0, $s1, $s2   # return s1 + s2
j           return          # vamos a return

f0:                         # caso base fibonacci(0)
li          $v0, 0          # return 0
j           return          #
f1:                         # caso base fibonacci(1)
li          $v0, 1          # return 1
j           return          #

return:
                            # epilogo
lw          $a0, 0($sp)     # recuperar a0
lw          $s0, 4($sp)     # recuperar s0
lw          $s1, 8($sp)     # recuperar s1
lw          $s2, 12($sp)    # recuperar s2
lw          $ra, 16($sp)    # recuperar ra
addi        $sp, $sp, 20    # pop stack frame
                            # fin epilogo
jr          $ra             # return
