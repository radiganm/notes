// variable_stack_1.cc

  #include <stdio.h>

  int main(void) {
    int value;
    for(int k=0; k<10; ++k)
    {
      value = k;
      fprintf(stdout, "value: %d\n", value);
    }
    return 0;
  }

// *EOF*
