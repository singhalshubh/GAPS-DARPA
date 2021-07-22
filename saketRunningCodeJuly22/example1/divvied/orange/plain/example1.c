#include <stdio.h>


double get_a() {
  static double a = 0.0;
  a += 1;
  return a;
}




