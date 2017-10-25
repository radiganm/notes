// segments_2.cc

  #include <stdio.h>

  #define N (1024)

  int value[N]; // .data

  int main(void) {
    value[0] = 0xdeadbeef;
    value[N] = 0xdeadbeef;
    fprintf(stdout, "value: %d\n", value[0]);
    return 0;
  }

// *EOF*
