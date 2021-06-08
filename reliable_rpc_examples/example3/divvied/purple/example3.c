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
#pragma cle begin PURPLE
  double x;
#pragma cle end PURPLE
  while (1) {
    x = get_a();
    printf("%f\n", x);
    sleep(3);
  }
  return 0;
}

int main(int argc, char **argv) {
  return sequence_generator_main(); 
}

