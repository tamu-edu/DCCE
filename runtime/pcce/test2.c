#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

uint64_t getCCID(uint64_t nid);

int main() {

  printf("%lu\n", getCCID(0));

  return 0;
}
