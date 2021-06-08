#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>

#pragma cle def PURPLE {"level":"purple"}

#pragma cle def ORANGE {"level":"orange",\
  "cdf": [\
    {"remotelevel":"purple", \
     "direction": "egress", \
     "guarddirective": { "operation": "allow"}}\
  ] }

#pragma cle def XDLINKAGE_GET_PRICE {"level":"orange",\
  "cdf": [\
    {"remotelevel":"purple", \
     "direction": "bidirectional", \
     "guarddirective": { "operation": "allow"}, \
     "argtaints": [], \
     "codtaints": ["ORANGE"], \
     "rettaints": ["TAG_RESPONSE_GET_PRICE"], \
     "idempotent": true, \
     "num_tries": 5, \
     "timeout": 1000 \
    } \
  ] }




int stock_main() {
#pragma clang attribute push (__attribute__((annotate("PURPLE"))), apply_to = any(function,type_alias,record,enum,variable,field))
  #pragma cle begin PURPLE
  double x;
  #pragma cle end PURPLE
#pragma clang attribute pop
  while (1) {
     x = get_price();
     time_t reportTime = time(NULL);
     time_t currTime = time(NULL);
    printf("[%s]The stock price is %.2f reported at %s\n", strtok(asctime(localtime(&currTime)),"\n"), x,  strtok(asctime(localtime(&reportTime)),"\n"));
    sleep(5);
  }
  return 0;
}

int main(int argc, char **argv) {
  return stock_main(); 
}

