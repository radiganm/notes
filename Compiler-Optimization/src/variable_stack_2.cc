// variable_stack_1.cc

  #include <stdio.h>

  int main(void) {
    for(int k=0; k<10; ++k)
    {
      int value = k;
      fprintf(stdout, "value: %d\n", value);
    }
    return 0;
  }

// *EOF*
