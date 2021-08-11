#include <stdio.h>

#pragma cle def PURPLE {"level":"purple"}
#pragma cle def ORANGE {"level":"orange"}
#pragma cle def EWMA_SHAREABLE {"level":"orange",\
  "cdf": [\
    {"remotelevel":"purple", \
     "direction": "egress", \
     "guarddirective": { "operation": "allow"}, \
     "argtaints": [["ORANGE"], ["ORANGE"]], \
     "codtaints": [], \
     "rettaints": ["EWMA_SHAREABLE"] } \
 ] }

#pragma cle def XDLINKAGE_GET_EWMA {"level":"orange",\
  "cdf": [\
    {"remotelevel":"purple", \
     "direction": "bidirectional", \
     "guarddirective": { "operation": "allow"}, \
     "argtaints": [], \
     "codtaints": ["ORANGE","EWMA_SHAREABLE"], \
     "rettaints": ["TAG_RESPONSE_GET_EWMA"] } \
  ] }

#pragma clang attribute push (__attribute__((annotate("EWMA_SHAREABLE"))), apply_to = any(function,type_alias,record,enum,variable,field))
#pragma cle begin EWMA_SHAREABLE
double calc_ewma(double a, double b) {
#pragma cle end EWMA_SHAREABLE
#pragma clang attribute pop
  const  double alpha = 0.25;
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
#pragma clang attribute push (__attribute__((annotate("ORANGE"))), apply_to = any(function,type_alias,record,enum,variable,field))
#pragma cle begin ORANGE
  static double b = 1.0;
#pragma cle end ORANGE
#pragma clang attribute pop
  b += b;
  return b;
}

// blessed on orange side
#pragma clang attribute push (__attribute__((annotate("XDLINKAGE_GET_EWMA"))), apply_to = any(function,type_alias,record,enum,variable,field))
#pragma cle begin XDLINKAGE_GET_EWMA
double get_ewma() {
#pragma cle end XDLINKAGE_GET_EWMA
#pragma clang attribute pop
  double x = get_a(); 
  double y = get_b(); 
  return calc_ewma(x,y);
}



// purple master: main, ewma_main
// orange slave: get_a, get_b, calc_ewma, get_ewma

