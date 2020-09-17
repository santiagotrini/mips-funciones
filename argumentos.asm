# main llama a argumentos(1, 2, 3, 4, 5) e imprime el resultado
# argumentos equivale en C a
# int argumentos(int a, int b, int c, int d, int e) {
#   return (a + b) + (c + d) - e;
# }

.text
.globl main

main:
li          $a0, 1          # arg 1
li          $a1, 2          # arg 2
li          $a2, 3          # arg 3
li          $a3, 4          # arg 4
li          $t0, 5          # arg 5
addi        $sp, $sp, -32   # hacer espacio en el stack
sw          $t0, 16($sp)    # push arg 5 en el stack
jal         argumentos      # call argumentos(1, 2, 3, 4, 5)

move        $a0, $v0        # mover el resultado
li          $v0, 1          #
syscall                     # print resultado

li          $v0, 10         #
syscall                     # exit

argumentos:
                            # prologo
sw          $s0, 20($sp)    # guardar los registros que usamos
sw          $s1, 24($sp)    #
sw          $s2, 28($sp)    #
                            # fin prologo

add         $s0, $a0, $a1   # $s0 = a + b
add         $s1, $a2, $a3   # $s1 = c + d
add         $s2, $s0, $s1   # $s2 = $s0 + $s1
lw          $t0, 16($sp)    # load arg 5
sub         $v0, $s2, $t0   # $v0 = $s2 - e

                            # epilogo
lw          $s0, 20($sp)    # restaurar los registros que usamos
lw          $s1, 24($sp)    #
lw          $s2, 28($sp)    #
addi        $sp, $sp, 32    # liberar espacio
                            # fin epilogo
jr          $ra             # return
