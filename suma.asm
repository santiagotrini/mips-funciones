.text
.globl main

main:                     # int main()
li        $a0, 5          #   // a = 5
li        $a1, 3          #   // b = 3
jal       suma            #   // suma(5, 3);
move      $a0, $v0        #   int c = suma(5,3);
li        $v0, 1          #
syscall                   #   printf("%d", c);
li        $v0, 10         #
syscall                   #   return 0;

suma:                     # int suma(int a, int b)
add       $v0, $a0, $a1   #   return a + b;
jr        $ra             #   
