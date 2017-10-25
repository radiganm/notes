// segments_1.cc

  #include <stdio.h>
  #include <string.h>

  #define N (1024)

  int value[N]; // .bss

  int main(void) {
    memset(&value, 'x', N);
    fprintf(stdout, "value: %d\n", value[0]);
    return 0;
  }

// *EOF*
