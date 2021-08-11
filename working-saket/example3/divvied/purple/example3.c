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




// blessed on orange side

#pragma cle begin PURPLE
int ewma_main() {
#pragma cle end PURPLE
  double ewma;
  for (int i=0; i < 10; i++) {
    ewma = get_ewma(); // conflict resolveable by wraping in RPC
    printf("%f\n", ewma);
  }
  return 0;
}

int main(int argc, char **argv) {
  return ewma_main();
}

// purple master: main, ewma_main
// orange slave: get_a, get_b, calc_ewma, get_ewma

