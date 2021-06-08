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


#pragma cle begin XDLINKAGE_GET_PRICE 
double get_price() {
#pragma cle end XDLINKAGE_GET_PRICE
#pragma cle begin ORANGE
  double stockprice = 0;
#pragma cle end ORANGE
  srand(time(NULL));
  stockprice = (rand()%5000)/100.0 + 750.0;
  return stockprice;
}


int stock_main() {
  #pragma cle begin PURPLE
  double x;
  #pragma cle end PURPLE
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

