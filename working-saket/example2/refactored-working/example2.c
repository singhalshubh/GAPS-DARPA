#include <stdio.h>

#pragma cle def PURPLE {"level":"purple"}

#pragma cle def XDLINKAGE_GET_EWMA {"level":"purple",	\
  "cdf": [\
    {"remotelevel":"orange", \
     "direction": "bidirectional", \
     "guarddirective": { "operation": "allow"}, \
     "argtaints": [["TAG_REQUEST_GET_EWMA"]], \
     "codtaints": ["PURPLE"], \
     "rettaints": ["TAG_RESPONSE_GET_EWMA"] }\
  ] }

#pragma cle def ORANGE {"level":"orange",\
  "cdf": [\
    {"remotelevel":"purple", \
     "direction": "egress", \
     "guarddirective": { "operation": "allow"}}\
  ] }

double calc_ewma(double a, double b) {
  const  double alpha = 1;
  static double c = 0.0;
  c = alpha * (a + b) + (1 - alpha) * c;
  return c;
}

double get_a() {
#pragma clang attribute push (__attribute__((annotate("ORANGE"))), apply_to = any(function,type_alias,record,enum,variable,field))
#pragma cle begin ORANGE
  static double a = 0.0;
#pragma cle end ORANGE
#pragma clang attribute pop
  a += 1;
  return a;
}

double get_b() {
#pragma clang attribute push (__attribute__((annotate("PURPLE"))), apply_to = any(function,type_alias,record,enum,variable,field))
#pragma cle begin PURPLE
  static double b = 0.0;
#pragma cle end PURPLE
#pragma clang attribute pop
  b += 1;
  return b;
}

#pragma clang attribute push (__attribute__((annotate("XDLINKAGE_GET_EWMA"))), apply_to = any(function,type_alias,record,enum,variable,field))
#pragma cle begin XDLINKAGE_GET_EWMA
double get_ewma(double x) {
#pragma cle end XDLINKAGE_GET_EWMA
#pragma clang attribute pop
  double y = get_b();
  return calc_ewma(x,y);
}

int ewma_main() {
  double x;
  double y;
#pragma clang attribute push (__attribute__((annotate("ORANGE"))), apply_to = any(function,type_alias,record,enum,variable,field))
#pragma cle begin ORANGE
  double ewma;
#pragma cle end ORANGE
#pragma clang attribute pop
  for (int i=0; i < 10; i++) {
    x = get_a();
    ewma = get_ewma(x);
    printf("%f\n",ewma);
  }
  return 0;
}

int main() {
  return ewma_main();
}
