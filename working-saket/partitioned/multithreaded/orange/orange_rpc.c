#include "orange_rpc.h"
#define TAG_MATCH(X, Y) (X.mux == Y.mux && X.sec == Y.sec && X.typ == Y.typ)
#define WRAP(X) void *_wrapper_##X(void *tag) { while(1) { _handle_##X(tag); } }

#ifndef __LEGACY_XDCOMMS__

void my_type_check(uint32_t typ, codec_map *cmap) {
    if ( (typ >= MY_DATA_TYP_MAX) || (cmap[typ].valid==0) ) {
        exit (1);
    }
}

void my_xdc_register(codec_func_ptr encode, codec_func_ptr decode, int typ, codec_map *cmap) {
    cmap[typ].valid=1;
    cmap[typ].encode=encode;
    cmap[typ].decode=decode;
}

/* Serialize tag onto wire (TODO, Use DFDL schema) */
void my_tag_encode (gaps_tag *tag_out, gaps_tag *tag_in) {
    tag_out->mux = htonl(tag_in->mux);
    tag_out->sec = htonl(tag_in->sec);
    tag_out->typ = htonl(tag_in->typ);
}

/* Convert tag to local host format (TODO, Use DFDL schema) */
void my_tag_decode (gaps_tag *tag_out, gaps_tag *tag_in) {
    tag_out->mux = ntohl(tag_in->mux);
    tag_out->sec = ntohl(tag_in->sec);
    tag_out->typ = ntohl(tag_in->typ);
}

/* Convert tag to local host format (TODO, Use DFDL schema) */
void my_len_encode (uint32_t *out, size_t len) {
    *out = ntohl((uint32_t) len);
}

/* Convert tag to local host format (TODO, Use DFDL schema) */
void my_len_decode (size_t *out, uint32_t in) {
    *out = (uint32_t) htonl(in);
}

void my_gaps_data_encode(sdh_ha_v1 *p, size_t *p_len, uint8_t *buff_in, size_t *len_out, gaps_tag *tag, codec_map *cmap) {
    uint32_t typ = tag->typ;
    my_type_check(typ, cmap);
    cmap[typ].encode (p->data, buff_in, len_out);
    my_tag_encode(&(p->tag), tag);
    my_len_encode(&(p->data_len), *len_out);
    *p_len = (*len_out) + sizeof(p->tag) + sizeof(p->data_len);
}

/* Decode data from packet */
void my_gaps_data_decode(sdh_ha_v1 *p, size_t p_len, uint8_t *buff_out, size_t *len_out, gaps_tag *tag, codec_map *cmap) {
    uint32_t typ = tag->typ;
    my_type_check(typ, cmap);
    my_tag_decode(tag, &(p->tag));
    my_len_decode(len_out, p->data_len);
    cmap[typ].decode (buff_out, p->data, &p_len);
    }

void my_xdc_asyn_send(void *socket, void *adu, gaps_tag *tag, codec_map *cmap) {
    sdh_ha_v1    packet, *p=&packet;
    size_t       packet_len;
    size_t adu_len;         /* Size of ADU is calculated by encoder */
    my_gaps_data_encode(p, &packet_len, adu, &adu_len, tag, cmap);
    int bytes = zmq_send (socket, (void *) p, packet_len, 0);
    if (bytes <= 0) fprintf(stderr, "send error %s %d ", zmq_strerror(errno), bytes);
}

void my_xdc_blocking_recv(void *socket, void *adu, gaps_tag *tag, codec_map *cmap) {
    sdh_ha_v1 packet;
    void *p = &packet;
    int size = zmq_recv(socket, p, sizeof(sdh_ha_v1), 0);
    size_t adu_len;
    my_gaps_data_decode(p, size, adu, &adu_len, tag, cmap);
}

void *my_xdc_pub_socket(void *ctx) {
    int err;
    void *socket;
    socket = zmq_socket(ctx, ZMQ_PUB);
    err = zmq_connect(socket, OUTURI);
    return socket;
}

void *my_xdc_sub_socket(gaps_tag tag, void *ctx) {
    int err;
    gaps_tag tag4filter;
    void *socket;
    socket = zmq_socket(ctx, ZMQ_SUB);
    err = zmq_connect(socket, INURI);
    my_tag_encode(&tag4filter, &tag);
    err = zmq_setsockopt(socket, ZMQ_SUBSCRIBE, (void *) &tag4filter, RX_FILTER_LEN);
    assert(err == 0);
    return socket;
}

void my_tag_write (gaps_tag *tag, uint32_t mux, uint32_t sec, uint32_t typ) {
    tag->mux = mux;
    tag->sec = sec;
    tag->typ = typ;
}

#endif /* __LEGACY_XDCOMMS__ */

void _hal_init(char *inuri, char *outuri) {
#ifdef __LEGACY_XDCOMMS__
    xdc_set_in(inuri);
    xdc_set_out(outuri);
    xdc_register(nextrpc_data_encode, nextrpc_data_decode, DATA_TYP_NEXTRPC);
    xdc_register(okay_data_encode, okay_data_decode, DATA_TYP_OKAY);
    xdc_register(request_get_a_data_encode, request_get_a_data_decode, DATA_TYP_REQUEST_GET_A);
    xdc_register(response_get_a_data_encode, response_get_a_data_decode, DATA_TYP_RESPONSE_GET_A);
#endif /* __LEGACY_XDCOMMS__ */
}

void _handle_nextrpc(gaps_tag* n_tag) {
#ifndef __LEGACY_XDCOMMS__
    void *psocket;
    void *ssocket;
    gaps_tag t_tag;
    gaps_tag o_tag;
    codec_map  mycmap[MY_DATA_TYP_MAX];
    for (int i=0; i < MY_DATA_TYP_MAX; i++)  mycmap[i].valid=0;
    my_xdc_register(nextrpc_data_encode, nextrpc_data_decode, DATA_TYP_NEXTRPC, mycmap);
    my_xdc_register(okay_data_encode, okay_data_decode, DATA_TYP_OKAY, mycmap);
    my_xdc_register(request_get_a_data_encode, request_get_a_data_decode, DATA_TYP_REQUEST_GET_A, mycmap);
    my_xdc_register(response_get_a_data_encode, response_get_a_data_decode, DATA_TYP_RESPONSE_GET_A, mycmap);
#else
    static int inited = 0;
    static void *psocket;
    static void *ssocket;
    gaps_tag t_tag;
    gaps_tag o_tag;
#endif /* __LEGACY_XDCOMMS__ */
#pragma clang attribute push (__attribute__((annotate("TAG_NEXTRPC"))), apply_to = any(function,type_alias,record,enum,variable,field))
    #pragma cle begin TAG_NEXTRPC
    nextrpc_datatype nxt;
    #pragma cle end TAG_NEXTRPC
#pragma clang attribute pop
#pragma clang attribute push (__attribute__((annotate("TAG_OKAY"))), apply_to = any(function,type_alias,record,enum,variable,field))
    #pragma cle begin TAG_OKAY
    okay_datatype okay;
    #pragma cle end TAG_OKAY
#pragma clang attribute pop
#ifndef __LEGACY_XDCOMMS__
    my_tag_write(&t_tag, MUX_NEXTRPC, SEC_NEXTRPC, DATA_TYP_NEXTRPC);
#else
    tag_write(&t_tag, MUX_NEXTRPC, SEC_NEXTRPC, DATA_TYP_NEXTRPC);
#endif /* __LEGACY_XDCOMMS__ */
#ifndef __LEGACY_XDCOMMS__
    void * ctx = zmq_ctx_new();
    psocket = my_xdc_pub_socket(ctx);
    ssocket = my_xdc_sub_socket(t_tag, ctx);
    sleep(1); /* zmq socket join delay */
#else
    if (!inited) {
        inited = 1;
        psocket = xdc_pub_socket();
        ssocket = xdc_sub_socket(t_tag);
        sleep(1); /* zmq socket join delay */
    }
#endif /* __LEGACY_XDCOMMS__ */
#ifndef __LEGACY_XDCOMMS__
    my_xdc_blocking_recv(ssocket, &nxt, &t_tag, mycmap);
    my_tag_write(&o_tag, MUX_OKAY, SEC_OKAY, DATA_TYP_OKAY);
    okay.x = 0;
    my_xdc_asyn_send(psocket, &okay, &o_tag, mycmap);
    zmq_close(psocket);
    zmq_close(ssocket);
    zmq_ctx_shutdown(ctx);
#else
    xdc_blocking_recv(ssocket, &nxt, &t_tag);
    tag_write(&o_tag, MUX_OKAY, SEC_OKAY, DATA_TYP_OKAY);
    okay.x = 0;
    xdc_asyn_send(psocket, &okay, &o_tag);
#endif /* __LEGACY_XDCOMMS__ */
    n_tag->mux = nxt.mux;
    n_tag->sec = nxt.sec;
    n_tag->typ = nxt.typ;
}

void _handle_request_get_a(gaps_tag* tag) {
#ifndef __LEGACY_XDCOMMS__
    void *psocket;
    void *ssocket;
    gaps_tag t_tag;
    gaps_tag o_tag;
    codec_map  mycmap[MY_DATA_TYP_MAX];
    for (int i=0; i < MY_DATA_TYP_MAX; i++)  mycmap[i].valid=0;
    my_xdc_register(nextrpc_data_encode, nextrpc_data_decode, DATA_TYP_NEXTRPC, mycmap);
    my_xdc_register(okay_data_encode, okay_data_decode, DATA_TYP_OKAY, mycmap);
    my_xdc_register(request_get_a_data_encode, request_get_a_data_decode, DATA_TYP_REQUEST_GET_A, mycmap);
    my_xdc_register(response_get_a_data_encode, response_get_a_data_decode, DATA_TYP_RESPONSE_GET_A, mycmap);
#else
    static int inited = 0;
    static void *psocket;
    static void *ssocket;
    static int processed_counter = 0;
    static int restart_state = -1;
    static double last_processed_result;
    static int last_processed_error = 0;
    static int callee_restarted = 0;
    gaps_tag t_tag;
    gaps_tag o_tag;
#endif /* __LEGACY_XDCOMMS__ */
#pragma clang attribute push (__attribute__((annotate("TAG_REQUEST_GET_A"))), apply_to = any(function,type_alias,record,enum,variable,field))
    #pragma cle begin TAG_REQUEST_GET_A
    request_get_a_datatype req_get_a;
    #pragma cle end TAG_REQUEST_GET_A
#pragma clang attribute pop
#ifndef __LEGACY_XDCOMMS__
    my_tag_write(&t_tag, MUX_REQUEST_GET_A, SEC_REQUEST_GET_A, DATA_TYP_REQUEST_GET_A);
#else
    tag_write(&t_tag, MUX_REQUEST_GET_A, SEC_REQUEST_GET_A, DATA_TYP_REQUEST_GET_A);
#endif /* __LEGACY_XDCOMMS__ */
#pragma clang attribute push (__attribute__((annotate("TAG_RESPONSE_GET_A"))), apply_to = any(function,type_alias,record,enum,variable,field))
    #pragma cle begin TAG_RESPONSE_GET_A
    response_get_a_datatype res_get_a;
    #pragma cle end TAG_RESPONSE_GET_A
#pragma clang attribute pop
#ifndef __LEGACY_XDCOMMS__
    my_tag_write(&o_tag, MUX_RESPONSE_GET_A, SEC_RESPONSE_GET_A, DATA_TYP_RESPONSE_GET_A);
#else
    tag_write(&o_tag, MUX_RESPONSE_GET_A, SEC_RESPONSE_GET_A, DATA_TYP_RESPONSE_GET_A);
#endif /* __LEGACY_XDCOMMS__ */
#ifndef __LEGACY_XDCOMMS__
    void * ctx = zmq_ctx_new();
    psocket = my_xdc_pub_socket(ctx);
    ssocket = my_xdc_sub_socket(t_tag, ctx);
    sleep(1); /* zmq socket join delay */
#else
    if (!inited) {
        inited = 1;
         callee_restarted = true;
        psocket = xdc_pub_socket();
        ssocket = xdc_sub_socket(t_tag);
        sleep(1); /* zmq socket join delay */
    }
#endif /* __LEGACY_XDCOMMS__ */
#ifndef __LEGACY_XDCOMMS__
    my_xdc_blocking_recv(ssocket, &req_get_a, &t_tag, mycmap);
#else
    xdc_blocking_recv(ssocket, &req_get_a, &t_tag);
#endif /* __LEGACY_XDCOMMS__ */
    res_get_a.ret = get_a();
#ifndef __LEGACY_XDCOMMS__
#ifndef __ONEWAY_RPC__
    my_xdc_asyn_send(psocket, &res_get_a, &o_tag, mycmap);
#endif /* __ONEWAY_RPC__ */
    zmq_close(psocket);
    zmq_close(ssocket);
    zmq_ctx_shutdown(ctx);
#else
#ifndef __ONEWAY_RPC__
    int reqId = req_get_a.trailer.seq;
    if(reqId > processed_counter){
        bool error = false;
        processed_counter = reqId;
        if(reqId == restart_state) caller_restarted_get_a = true;
        last_processed_result = get_a();
        last_processed_error = error;
        restart_state = -1;
        caller_restarted_get_a = false;
        res_get_a.trailer.seq = processed_counter << 2 | last_processed_error << 1 | callee_restarted;
        res_get_a.ret = last_processed_result;
        xdc_asyn_send(psocket, &res_get_a, &o_tag);
    }
    else if(reqId == processed_counter){        res_get_a.trailer.seq = processed_counter << 2 | last_processed_error << 1 | callee_restarted;
        res_get_a.ret = last_processed_result;
        xdc_asyn_send(psocket, &res_get_a, &o_tag);
    }
    else if(reqId == INT_MIN){
        res_get_a.trailer.seq = processed_counter << 2 | last_processed_error << 1 | callee_restarted;
        res_get_a.ret = last_processed_result;
        restart_state = processed_counter + 1;
        xdc_asyn_send(psocket, &res_get_a, &o_tag);
    }
    callee_restarted = false;
#endif /* __ONEWAY_RPC__ */
#endif /* __LEGACY_XDCOMMS__ */
}

#define NXDRPC 2
WRAP(nextrpc)
WRAP(request_get_a)

int _slave_rpc_loop() {
    gaps_tag n_tag;
    pthread_t tid[NXDRPC];
    _hal_init((char *)INURI, (char *)OUTURI);
    pthread_create(&tid[0], NULL, _wrapper_nextrpc, &n_tag);
    pthread_create(&tid[1], NULL, _wrapper_request_get_a, &n_tag);
    for (int i = 0; i < NXDRPC; i++) pthread_join(tid[i], NULL);
    return 0;
}

