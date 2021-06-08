#include "example2_rpc.h"
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
static double last_reported;
static time_t last_reported_time;
  while (1) {
     time_t reportTime = time(NULL);
     int error = 0;
     int restarted = 0;
     x = _rpc_get_price(&error, &restarted);
     if(error == 1){
       x = last_reported;
       reportTime = last_reported_time;
     }
     else{
       last_reported = x;
       last_reported_time = reportTime;
     }
     if(restarted == 1){
       //
     }
     
    printf("The stock price is %.2f reported at %s", x,  asctime(localtime(&reportTime)));
    sleep(5);
  }
  return 0;
}

int main(int argc, char **argv) {
	_master_rpc_init();
  return stock_main(); 
}

