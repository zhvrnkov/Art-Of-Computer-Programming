#include <stdio.h>
#include <limits.h>

#define NUM_OF_CALLS 1000000

int algorithm(int m, int n);
unsigned long countOfFirstStep(int n);

int main() {
  printf("%lu / %d\n", countOfFirstStep(1), NUM_OF_CALLS);
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

unsigned long countOfFirstStep(int n) {
  unsigned long count = 0;
  for (int i = 1; i < NUM_OF_CALLS; i++) {
    int remainder = 0;
    int divisible = n;
    int divisor = i;
  algorithm:
    remainder = divisible % divisor;
    count++;
    if (remainder == 0)
      continue;
    else {
      divisible = divisor;
      divisor = remainder;
      goto algorithm;
    }
  }
  return count;
}
