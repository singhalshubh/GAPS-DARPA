#include "purple_rpc.h"
#include <stdio.h>

#pragma cle def PURPLE {"level":"purple"}

#pragma cle def ORANGE {"level":"orange",\
  "cdf": [\
    {"remotelevel":"purple", \
     "direction": "egress", \
     "guarddirective": { "operation": "allow"}}\
  ] }

#pragma cle def XDLINKAGE_GET_A {"level":"orange",\
  "cdf": [\
    {"remotelevel":"purple", \
     "direction": "bidirectional", \
     "guarddirective": { "operation": "allow"}, \
     "argtaints": [], \
     "codtaints": ["ORANGE"], \
     "rettaints": ["TAG_RESPONSE_GET_A"], \
     "idempotent": true, \
     "num_tries": 30, \
     "timeout": 1000 \
    } \
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
  static double b = 0.0;
#pragma cle end PURPLE
#pragma clang attribute pop
  b += 1;
  return b;
}

/*int ewma_main() {
  double x;
  double y;
#pragma clang attribute push (__attribute__((annotate("PURPLE"))), apply_to = any(function,type_alias,record,enum,variable,field))
#pragma cle begin PURPLE
  double ewma;
#pragma cle end PURPLE
#pragma clang attribute pop
  for (int i=0; i < 10; i++) {
    //x = _rpc_get_a();
    int error = 0;
    int restarted = 0;
    x = _rpc_get_a(&error, &restarted);
    if(error == 1) assert(0);
    if(restarted == 1) assert(0);
    y = get_b();
    ewma = calc_ewma(x,y);
    printf("%f\n", ewma);
  }
  return 0;
}*/

int ewma_main() {
  double x;
  double y;
  double last_val = 0;
#pragma clang attribute push (__attribute__((annotate("PURPLE"))), apply_to = any(function,type_alias,record,enum,variable,field))
#pragma cle begin PURPLE
  double ewma;
#pragma cle end PURPLE
#pragma clang attribute pop
  for (int i=0; i < 50; i++) {
    int error = 0;
    int restarted = 0;
    x = _rpc_get_a(&error, &restarted);
    last_val = ewma;
    printf("%d, %d, ", error, restarted);
    if(error == 1) {
      ewma = last_val;
      i--;
      printf("[SERVER STOPPED]%f\n", ewma);
      continue;
    }

    if(restarted == 1) {
      restarted = 0;
      i = -1;
      continue;
    }
    
    y = get_b();
    ewma = calc_ewma(x,y);
    printf("%f\n", ewma);
  }
  return 0;
}

int main(int argc, char **argv) {
  _master_rpc_init();
  return ewma_main(); 
}

