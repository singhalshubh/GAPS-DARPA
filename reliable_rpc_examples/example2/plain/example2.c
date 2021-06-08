#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>


double get_price() {
  srand(time(NULL));
  double stockprice = (rand()%5000)/100.0 + 750.0;
  return stockprice;
}

int stock_main() {
  double x;
  while (1) {
     x = get_price();
     time_t reportTime = time(NULL);
     time_t currTime = time(NULL);
    printf("[%s]The stock price is %.2f reported at %s\n", strtok(asctime(localtime(&currTime)),"\n"), x,  strtok(asctime(localtime(&reportTime)),"\n"));
    sleep(5);
  }
  return 0;
}

int main() {
  return stock_main(); 
}

