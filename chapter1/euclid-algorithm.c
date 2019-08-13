#include <stdio.h>

int algorithm(int m, int n);

int main() {
  printf("%d\n", algorithm(2166, 6099));
  return 0;
}

int algorithm(int m, int n) {
  int remainder = m % n;
  if (remainder == 0) {
    return n;
  }
  else
    return algorithm(n, remainder);
}
