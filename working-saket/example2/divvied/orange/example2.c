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


double get_a() {
#pragma cle begin ORANGE
  static double a = 0.0;
#pragma cle end ORANGE
  a += 1;
  return a;
}



int ewma_main() {
  double x;
  double y;
#pragma cle begin ORANGE
  double ewma;
#pragma cle end ORANGE
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
