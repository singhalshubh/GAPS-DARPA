#include "codec.h"

void nextrpc_print (nextrpc_datatype *nextrpc) {
  fprintf(stderr, "nextrpc(len=%ld): ", sizeof(*nextrpc));
  fprintf(stderr, " %d,", nextrpc->mux);
  fprintf(stderr, " %d,", nextrpc->sec);
  fprintf(stderr, " %d,", nextrpc->typ);
  fprintf(stderr, " %u, %u, %u, %hu, %hu\n",
          nextrpc->trailer.seq,
          nextrpc->trailer.rqr,
          nextrpc->trailer.oid,
          nextrpc->trailer.mid,
          nextrpc->trailer.crc);
}

void nextrpc_data_encode (void *buff_out, void *buff_in, size_t *len_out) {
  nextrpc_datatype *p1 = (nextrpc_datatype *) buff_in;
  nextrpc_output   *p2 = (nextrpc_output *)   buff_out;
  p2->mux = htonl(p1->mux);
  p2->sec = htonl(p1->sec);
  p2->typ = htonl(p1->typ);
  p2->trailer.seq = htonl(p1->trailer.seq);
  p2->trailer.rqr = htonl(p1->trailer.rqr);
  p2->trailer.oid = htonl(p1->trailer.oid);
  p2->trailer.mid = htons(p1->trailer.mid);
  p2->trailer.crc = htons(p1->trailer.crc);
  *len_out = sizeof(int32_t) + sizeof(int32_t) + sizeof(int32_t) + sizeof(trailer_datatype);
}

void nextrpc_data_decode (void *buff_out, void *buff_in, size_t *len_in) {
  nextrpc_output   *p1 = (nextrpc_output *)   buff_in;
  nextrpc_datatype *p2 = (nextrpc_datatype *) buff_out;
  p2->mux = ntohl(p1->mux);
  p2->sec = ntohl(p1->sec);
  p2->typ = ntohl(p1->typ);
  p2->trailer.seq = ntohl(p1->trailer.seq);
  p2->trailer.rqr = ntohl(p1->trailer.rqr);
  p2->trailer.oid = ntohl(p1->trailer.oid);
  p2->trailer.mid = ntohs(p1->trailer.mid);
  p2->trailer.crc = ntohs(p1->trailer.crc);
}

void okay_print (okay_datatype *okay) {
  fprintf(stderr, "okay(len=%ld): ", sizeof(*okay));
  fprintf(stderr, " %d,", okay->x);
  fprintf(stderr, " %u, %u, %u, %hu, %hu\n",
          okay->trailer.seq,
          okay->trailer.rqr,
          okay->trailer.oid,
          okay->trailer.mid,
          okay->trailer.crc);
}

void okay_data_encode (void *buff_out, void *buff_in, size_t *len_out) {
  okay_datatype *p1 = (okay_datatype *) buff_in;
  okay_output   *p2 = (okay_output *)   buff_out;
  p2->x = htonl(p1->x);
  p2->trailer.seq = htonl(p1->trailer.seq);
  p2->trailer.rqr = htonl(p1->trailer.rqr);
  p2->trailer.oid = htonl(p1->trailer.oid);
  p2->trailer.mid = htons(p1->trailer.mid);
  p2->trailer.crc = htons(p1->trailer.crc);
  *len_out = sizeof(int32_t) + sizeof(trailer_datatype);
}

void okay_data_decode (void *buff_out, void *buff_in, size_t *len_in) {
  okay_output   *p1 = (okay_output *)   buff_in;
  okay_datatype *p2 = (okay_datatype *) buff_out;
  p2->x = ntohl(p1->x);
  p2->trailer.seq = ntohl(p1->trailer.seq);
  p2->trailer.rqr = ntohl(p1->trailer.rqr);
  p2->trailer.oid = ntohl(p1->trailer.oid);
  p2->trailer.mid = ntohs(p1->trailer.mid);
  p2->trailer.crc = ntohs(p1->trailer.crc);
}

void request_get_ewma_print (request_get_ewma_datatype *request_get_ewma) {
  fprintf(stderr, "request_get_ewma(len=%ld): ", sizeof(*request_get_ewma));
  fprintf(stderr, " %d,", request_get_ewma->dummy);
  fprintf(stderr, " %u, %u, %u, %hu, %hu\n",
          request_get_ewma->trailer.seq,
          request_get_ewma->trailer.rqr,
          request_get_ewma->trailer.oid,
          request_get_ewma->trailer.mid,
          request_get_ewma->trailer.crc);
}

void request_get_ewma_data_encode (void *buff_out, void *buff_in, size_t *len_out) {
  request_get_ewma_datatype *p1 = (request_get_ewma_datatype *) buff_in;
  request_get_ewma_output   *p2 = (request_get_ewma_output *)   buff_out;
  p2->dummy = htonl(p1->dummy);
  p2->trailer.seq = htonl(p1->trailer.seq);
  p2->trailer.rqr = htonl(p1->trailer.rqr);
  p2->trailer.oid = htonl(p1->trailer.oid);
  p2->trailer.mid = htons(p1->trailer.mid);
  p2->trailer.crc = htons(p1->trailer.crc);
  *len_out = sizeof(int32_t) + sizeof(trailer_datatype);
}

void request_get_ewma_data_decode (void *buff_out, void *buff_in, size_t *len_in) {
  request_get_ewma_output   *p1 = (request_get_ewma_output *)   buff_in;
  request_get_ewma_datatype *p2 = (request_get_ewma_datatype *) buff_out;
  p2->dummy = ntohl(p1->dummy);
  p2->trailer.seq = ntohl(p1->trailer.seq);
  p2->trailer.rqr = ntohl(p1->trailer.rqr);
  p2->trailer.oid = ntohl(p1->trailer.oid);
  p2->trailer.mid = ntohs(p1->trailer.mid);
  p2->trailer.crc = ntohs(p1->trailer.crc);
}

void response_get_ewma_print (response_get_ewma_datatype *response_get_ewma) {
  fprintf(stderr, "response_get_ewma(len=%ld): ", sizeof(*response_get_ewma));
  fprintf(stderr, " %lf,", response_get_ewma->ret);
  fprintf(stderr, " %u, %u, %u, %hu, %hu\n",
          response_get_ewma->trailer.seq,
          response_get_ewma->trailer.rqr,
          response_get_ewma->trailer.oid,
          response_get_ewma->trailer.mid,
          response_get_ewma->trailer.crc);
}

void response_get_ewma_data_encode (void *buff_out, void *buff_in, size_t *len_out) {
  response_get_ewma_datatype *p1 = (response_get_ewma_datatype *) buff_in;
  response_get_ewma_output   *p2 = (response_get_ewma_output *)   buff_out;
  p2->ret = htond(p1->ret);
  p2->trailer.seq = htonl(p1->trailer.seq);
  p2->trailer.rqr = htonl(p1->trailer.rqr);
  p2->trailer.oid = htonl(p1->trailer.oid);
  p2->trailer.mid = htons(p1->trailer.mid);
  p2->trailer.crc = htons(p1->trailer.crc);
  *len_out = sizeof(double) + sizeof(trailer_datatype);
}

void response_get_ewma_data_decode (void *buff_out, void *buff_in, size_t *len_in) {
  response_get_ewma_output   *p1 = (response_get_ewma_output *)   buff_in;
  response_get_ewma_datatype *p2 = (response_get_ewma_datatype *) buff_out;
  p2->ret = ntohd(p1->ret);
  p2->trailer.seq = ntohl(p1->trailer.seq);
  p2->trailer.rqr = ntohl(p1->trailer.rqr);
  p2->trailer.oid = ntohl(p1->trailer.oid);
  p2->trailer.mid = ntohs(p1->trailer.mid);
  p2->trailer.crc = ntohs(p1->trailer.crc);
}

