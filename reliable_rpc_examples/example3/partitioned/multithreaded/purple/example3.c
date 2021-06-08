#include "example3_rpc.h"
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
     "num_tries": 5, \
     "timeout": 1000 \
    } \
  ] }



int sequence_generator_main() {
#pragma clang attribute push (__attribute__((annotate("PURPLE"))), apply_to = any(function,type_alias,record,enum,variable,field))
#pragma cle begin PURPLE
  double x;
#pragma cle end PURPLE
#pragma clang attribute pop
  while (1) {
    int error = 0;
    int restarted = 0;
    x = _rpc_get_a(&error, &restarted);
    if(error == 1) assert(0);
    if(restarted == 1) assert(0);
    printf("%f\n", x);
    sleep(3);
  }
  return 0;
}

int main(int argc, char **argv) {
	_master_rpc_init();
  return sequence_generator_main(); 
}

