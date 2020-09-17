.text
.globl main

main:
li          $s0, 12         # int a = 12;
li          $a0, 1          #
li          $a1, 1          #
li          $a2, -1         #
li          $a3, 2          #
jal         cuenta          # int b = cuenta(1, 1, -1, 2);
add         $a0, $v0, $s0   # b = b + a;
li          $v0, 1          #
syscall                     # printf("%d\n", b);
li          $v0, 10         #
syscall                     # return 0;

cuenta:
                            # prologo de la funcion
addi        $sp, $sp, -4    # hacer lugar en el stack para un word
sw          $s0, 0($sp)     # push s0
                            # fin prologo
add         $s0, $a0, $a1   #
add         $s1, $a2, $a3   #
sub         $v0, $s0, $s1   # return (a + b) - (c + d);
                            # epilogo de la funcion
lw          $s0, 0($sp)     # pop s0
addi        $sp, $sp, 4     # liberamos espacio en el stack
                            # fin epilogo
jr          $ra             # return (a + b) - (c + d);
