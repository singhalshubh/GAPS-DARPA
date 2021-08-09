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
  const  double alpha = 0.25;
  static double c = 0.0;
  c = alpha * (a + b) + (1 - alpha) * c;
  return c;
}


double get_b() {
#pragma clang attribute push (__attribute__((annotate("PURPLE"))), apply_to = any(function,type_alias,record,enum,variable,field))
#pragma cle begin PURPLE
  static double b = 1.0;
#pragma cle end PURPLE
#pragma clang attribute pop
  b += b;
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


