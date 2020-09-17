.data
msg: .asciiz "Hola mundo!\n"

.text
.globl main

main:                   # int main()
jal       hola          #   hola();
li        $v0, 10       #
syscall                 #   return 0;

hola:                   # void hola()
la        $a0, msg      #
li        $v0, 4        #
syscall                 #   printf("Hola mundo!\n");
jr        $ra           #
