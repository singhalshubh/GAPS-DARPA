#ifndef GMA_HEADER_FILE
#define GMA_HEADER_FILE
#pragma pack(1)

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <inttypes.h>
#include <arpa/inet.h>
#include <float.h>

#include "float754.h"

#define id(X) (X)

typedef struct _trailer_datatype {
  uint32_t seq;
  uint32_t rqr;
  uint32_t oid;
  uint16_t mid;
  uint16_t crc;
} trailer_datatype;

#ifndef TYP_BASE
#define TYP_BASE 0
#endif /* TYP_BASE */
#define DATA_TYP_NEXTRPC TYP_BASE + 1
#define DATA_TYP_OKAY TYP_BASE + 2
#define DATA_TYP_REQUEST_GET_PRICE TYP_BASE + 3
#define DATA_TYP_RESPONSE_GET_PRICE TYP_BASE + 4

typedef struct _nextrpc_datatype {
  int32_t mux;
  int32_t sec;
  int32_t typ;
  trailer_datatype trailer;
} nextrpc_datatype;

typedef struct _nextrpc_output {
  int32_t mux;
  int32_t sec;
  int32_t typ;
  trailer_datatype trailer;
} nextrpc_output;

typedef struct _okay_datatype {
  int32_t x;
  trailer_datatype trailer;
} okay_datatype;

typedef struct _okay_output {
  int32_t x;
  trailer_datatype trailer;
} okay_output;

typedef struct _request_get_price_datatype {
  int32_t dummy;
  trailer_datatype trailer;
} request_get_price_datatype;

typedef struct _request_get_price_output {
  int32_t dummy;
  trailer_datatype trailer;
} request_get_price_output;

typedef struct _response_get_price_datatype {
  double ret;
  trailer_datatype trailer;
} response_get_price_datatype;

typedef struct _response_get_price_output {
  uint64_t ret;
  trailer_datatype trailer;
} response_get_price_output;

extern void nextrpc_print (nextrpc_datatype *nextrpc);
extern void nextrpc_data_encode (void *buff_out, void *buff_in, size_t *len_out);
extern void nextrpc_data_decode (void *buff_out, void *buff_in, size_t *len_in);

extern void okay_print (okay_datatype *okay);
extern void okay_data_encode (void *buff_out, void *buff_in, size_t *len_out);
extern void okay_data_decode (void *buff_out, void *buff_in, size_t *len_in);

extern void request_get_price_print (request_get_price_datatype *request_get_price);
extern void request_get_price_data_encode (void *buff_out, void *buff_in, size_t *len_out);
extern void request_get_price_data_decode (void *buff_out, void *buff_in, size_t *len_in);

extern void response_get_price_print (response_get_price_datatype *response_get_price);
extern void response_get_price_data_encode (void *buff_out, void *buff_in, size_t *len_out);
extern void response_get_price_data_decode (void *buff_out, void *buff_in, size_t *len_in);

#endif
