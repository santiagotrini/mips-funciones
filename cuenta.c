#include <stdio.h>

int cuenta(int a, int b, int c, int d) {
  return (a + b) - (c + d);
}

int main() {
  int a = 12;
  int b = cuenta(1, 1, -1, 2);
  b = b + a;
  printf("%d\n", b);
  return 0;
}
