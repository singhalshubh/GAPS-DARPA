#include "purple_rpc.h"
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

void my_xdc_recv(void *socket, void *adu, gaps_tag *tag, codec_map *cmap) {
    sdh_ha_v1 packet;
    void *p = &packet;
    int size = zmq_recv(socket, p, sizeof(sdh_ha_v1), 0);
    size_t adu_len;
    my_gaps_data_decode(p, size, adu, &adu_len, tag, cmap);
    return size;
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

void *my_xdc_sub_socket_non_blocking(gaps_tag tag, void *ctx, int timeout) {
    int  err, len;
    void    *socket;
    gaps_tag tag4filter;
    void    *filter;
    socket = zmq_socket(ctx, ZMQ_SUB);
    if (timeout>=0) {
        err = zmq_setsockopt(socket, ZMQ_RCVTIMEO, &timeout, sizeof(timeout));
        assert(err == 0);
    }
    err = zmq_connect(socket, INURI);
    if ((tag.mux) != 0) {
        len = RX_FILTER_LEN;
        my_tag_encode(&tag4filter, &tag);
        filter = (void *) &tag4filter;
    } else {
        len = 0;
        filter = (void *) "";
    }
    err = zmq_setsockopt(socket, ZMQ_SUBSCRIBE, filter, len);
    assert(err == 0);
    return socket;
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

void _notify_next_tag(gaps_tag* n_tag) {
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
#ifndef __LEGACY_XDCOMMS__
    my_tag_write(&t_tag, MUX_NEXTRPC, SEC_NEXTRPC, DATA_TYP_NEXTRPC);
#else
    tag_write(&t_tag, MUX_NEXTRPC, SEC_NEXTRPC, DATA_TYP_NEXTRPC);
#endif /* __LEGACY_XDCOMMS__ */
#pragma clang attribute push (__attribute__((annotate("TAG_OKAY"))), apply_to = any(function,type_alias,record,enum,variable,field))
    #pragma cle begin TAG_OKAY
    okay_datatype okay;
    #pragma cle end TAG_OKAY
#pragma clang attribute pop
#ifndef __LEGACY_XDCOMMS__
    my_tag_write(&o_tag, MUX_OKAY, SEC_OKAY, DATA_TYP_OKAY);
#else
    tag_write(&o_tag, MUX_OKAY, SEC_OKAY, DATA_TYP_OKAY);
#endif /* __LEGACY_XDCOMMS__ */
#ifndef __LEGACY_XDCOMMS__
    void * ctx = zmq_ctx_new();
    psocket = my_xdc_pub_socket(ctx);
    ssocket = my_xdc_sub_socket_non_blocking(o_tag, ctx,1000);
    sleep(1); /* zmq socket join delay */
#else
    if (!inited) {
        inited = 1;
        psocket = xdc_pub_socket();
        ssocket = xdc_sub_socket_non_blocking(o_tag,1000);
        sleep(1); /* zmq socket join delay */
    }
#endif /* __LEGACY_XDCOMMS__ */
    nxt.mux = n_tag->mux;
    nxt.sec = n_tag->sec;
    nxt.typ = n_tag->typ;
#ifndef __LEGACY_XDCOMMS__
    my_xdc_asyn_send(psocket, &nxt, &t_tag, mycmap);
    my_xdc_blocking_recv(ssocket, &okay, &o_tag, mycmap);
    zmq_close(psocket);
    zmq_close(ssocket);
    zmq_ctx_shutdown(ctx);
#else
    xdc_asyn_send(psocket, &nxt, &t_tag);
    xdc_blocking_recv(ssocket, &okay, &o_tag);
#endif /* __LEGACY_XDCOMMS__ */
    // XXX: check that we got valid OK?
}

#ifndef __LEGACY_XDCOMMS__
int my_rpc_get_a_sync_request_counter(int* request_counter, void* psocket, void* ssocket, gaps_tag* t_tag, gaps_tag* o_tag, void * ctx, codec_map *mycmap) {
    int tries_remaining = 40;
    while(tries_remaining != 0){
#pragma clang attribute push (__attribute__((annotate("TAG_REQUEST_GET_A"))), apply_to = any(function,type_alias,record,enum,variable,field))
        #pragma cle begin TAG_REQUEST_GET_A
        request_get_a_datatype req_get_a;
        #pragma cle end TAG_REQUEST_GET_A
#pragma clang attribute pop

#pragma clang attribute push (__attribute__((annotate("TAG_RESPONSE_GET_A"))), apply_to = any(function,type_alias,record,enum,variable,field))
        #pragma cle begin TAG_RESPONSE_GET_A
        response_get_a_datatype res_get_a;
        #pragma cle end TAG_RESPONSE_GET_A
#pragma clang attribute pop

        req_get_a.dummy = 0;
        req_get_a.trailer.seq = *request_counter;
        my_xdc_asyn_send(psocket, &req_get_a, &t_tag, mycmap);
        #ifndef __ONEWAY_RPC__
        int status = my_xdc_recv(ssocket, &res_get_a, &o_tag, mycmap);
        #endif /* __ONEWAY_RPC__ */
        int respId = res_get_a.trailer.seq >> 2 ;
        int error = (res_get_a.trailer.seq >> 1)& 0x01 ;
        if(status == -1){
            tries_remaining--;
        }
        else{
            *request_counter = respId;
            return 1;
        }
    }
    return 0;
}

int my_rpc_get_a_remote_call(int reqId, double* result, void* psocket, void* ssocket, gaps_tag* t_tag, gaps_tag* o_tag, void * ctx, codec_map *mycmap) {
    int tries_remaining = 40;
    while(tries_remaining!=0){
#pragma clang attribute push (__attribute__((annotate("TAG_REQUEST_GET_A"))), apply_to = any(function,type_alias,record,enum,variable,field))
        #pragma cle begin TAG_REQUEST_GET_A
        request_get_a_datatype req_get_a;
        #pragma cle end TAG_REQUEST_GET_A
#pragma clang attribute pop

#pragma clang attribute push (__attribute__((annotate("TAG_RESPONSE_GET_A"))), apply_to = any(function,type_alias,record,enum,variable,field))
        #pragma cle begin TAG_RESPONSE_GET_A
        response_get_a_datatype res_get_a;
        #pragma cle end TAG_RESPONSE_GET_A
#pragma clang attribute pop

        req_get_a.dummy = 0;
        req_get_a.trailer.seq = reqId;
        my_xdc_asyn_send(psocket, &req_get_a, &t_tag, mycmap);
        #ifndef __ONEWAY_RPC__
        int status = my_xdc_recv(ssocket, &res_get_a, &o_tag, mycmap);
        #endif /* __ONEWAY_RPC__ */
        int respId = res_get_a.trailer.seq >> 2 ;
        int error = (res_get_a.trailer.seq >> 1)& 0x01 ;
        if(status == -1){
            tries_remaining--;
        }
        else{
            if(respId < reqId){
                continue;
            }
            if(error){
                return 0;
            }
            *result = res_get_a.ret;
            return 1;
        }
    }
    return 0;
}
#else
int _rpc_get_a_sync_request_counter(int* request_counter, void* psocket, void* ssocket, gaps_tag* t_tag, gaps_tag* o_tag) {
    int tries_remaining = 40;
    while(tries_remaining != 0){
#pragma clang attribute push (__attribute__((annotate("TAG_REQUEST_GET_A"))), apply_to = any(function,type_alias,record,enum,variable,field))
        #pragma cle begin TAG_REQUEST_GET_A
        request_get_a_datatype req_get_a;
        #pragma cle end TAG_REQUEST_GET_A
#pragma clang attribute pop

#pragma clang attribute push (__attribute__((annotate("TAG_RESPONSE_GET_A"))), apply_to = any(function,type_alias,record,enum,variable,field))
        #pragma cle begin TAG_RESPONSE_GET_A
        response_get_a_datatype res_get_a;
        #pragma cle end TAG_RESPONSE_GET_A
#pragma clang attribute pop

        req_get_a.dummy = 0;
        req_get_a.trailer.seq = *request_counter;
        xdc_asyn_send(psocket, &req_get_a, t_tag);
        #ifndef __ONEWAY_RPC__
        int status = xdc_recv(ssocket, &res_get_a, o_tag);
        #endif /* __ONEWAY_RPC__ */
        int respId = res_get_a.trailer.seq >> 2 ;
        int error = (res_get_a.trailer.seq >> 1)& 0x01 ;
        if(status == -1){
            tries_remaining--;
        }
        else{
            *request_counter = respId;
            return 1;
        }
    }
    return 0;
}

int _rpc_get_a_remote_call(int reqId, double* result, void* psocket, void* ssocket, gaps_tag* t_tag, gaps_tag* o_tag) {
    int tries_remaining = 40;
    while(tries_remaining!=0){
#pragma clang attribute push (__attribute__((annotate("TAG_REQUEST_GET_A"))), apply_to = any(function,type_alias,record,enum,variable,field))
        #pragma cle begin TAG_REQUEST_GET_A
        request_get_a_datatype req_get_a;
        #pragma cle end TAG_REQUEST_GET_A
#pragma clang attribute pop

#pragma clang attribute push (__attribute__((annotate("TAG_RESPONSE_GET_A"))), apply_to = any(function,type_alias,record,enum,variable,field))
        #pragma cle begin TAG_RESPONSE_GET_A
        response_get_a_datatype res_get_a;
        #pragma cle end TAG_RESPONSE_GET_A
#pragma clang attribute pop

        req_get_a.dummy = 0;
        req_get_a.trailer.seq = reqId;
        xdc_asyn_send(psocket, &req_get_a, t_tag);
        #ifndef __ONEWAY_RPC__
        int status = xdc_recv(ssocket, &res_get_a, o_tag);
        #endif /* __ONEWAY_RPC__ */
        int respId = res_get_a.trailer.seq >> 2 ;
        int error = (res_get_a.trailer.seq >> 1)& 0x01 ;
        if(status == -1){
            tries_remaining--;
        }
        else{
            if(respId < reqId){
                continue;
            }
            if(error){
                return 0;
            }
            *result = res_get_a.ret;
            return 1;
        }
    }
    return 0;
}
#endif /* __LEGACY_XDCOMMS__ */
double _rpc_get_a(int *error) {
#ifndef __LEGACY_XDCOMMS__
    void *psocket;
    void *ssocket;
    gaps_tag t_tag;
    gaps_tag o_tag;
    static int request_counter = INT_MIN;
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
    static int request_counter = INT_MIN;
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
        ssocket = my_xdc_sub_socket_non_blocking(o_tag, ctx, 1000);
    sleep(1); /* zmq socket join delay */
        int status = my_rpc_get_a_sync_request_counter(&request_counter, psocket, ssocket, &t_tag, &o_tag, ctx, mycmap);
    if(status == 0) {
        *error = 1;
        return 0;
    }
    request_counter++;
#else
    if (!inited) {
        inited = 1;
        psocket = xdc_pub_socket();
        ssocket = xdc_sub_socket_non_blocking(o_tag,1000);
        sleep(1); /* zmq socket join delay */
        int status = _rpc_get_a_sync_request_counter(&request_counter, psocket, ssocket, &t_tag, &o_tag);
        if(status == 0){
            *error = 1;
            return 0;
        }
    }
    request_counter++;
#endif /* __LEGACY_XDCOMMS__ */
#ifndef __LEGACY_XDCOMMS__
    double result;
    int status1 = my_rpc_get_a_remote_call(request_counter,  &result, psocket, ssocket, &t_tag, &o_tag, ctx, mycmap);
    if(status1 == 0){
        *error = 1;
        return 0;
    }
    zmq_close(psocket);
    zmq_close(ssocket);
    zmq_ctx_shutdown(ctx);
#else
    double result;
    int status1 = _rpc_get_a_remote_call(request_counter,  &result, psocket, ssocket, &t_tag, &o_tag);
    if(status1 == 0){
        *error = 1;
        return 0;
    }
#endif /* __LEGACY_XDCOMMS__ */
#ifndef __ONEWAY_RPC__
    return (result);
#else
    return 0;
#endif /* __ONEWAY_RPC__ */
}

void _master_rpc_init() {
    _hal_init((char*)INURI, (char *)OUTURI);
}

