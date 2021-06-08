#include <stdio.h>


double get_a() {
  static double a = 0.0;
  a += 1;
  return a;
}

int sequence_generator_main() {
  double x;
  while (1) {
    x = get_a();
    printf("%f\n", x);
    sleep(3);
  }
  return 0;
}

int main() {
  return sequence_generator_main(); 
}

