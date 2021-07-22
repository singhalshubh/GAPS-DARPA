#include "example1_rpc.h"
#define TAG_MATCH(X, Y) (X.mux == Y.mux && X.sec == Y.sec && X.typ == Y.typ)
#define WRAP(X) void *_wrapper_##X(void *tag) { while(1) { _handle_##X(tag); } }

void _handle_request_get_a(gaps_tag* tag) {
	static int inited = 0;
	static void *psocket;
	static void *ssocket;
	gaps_tag t_tag;
	gaps_tag o_tag;
	#pragma cle begin TAG_REQUEST_GET_A
	request_get_a_datatype req_get_a;
	#pragma cle end TAG_REQUEST_GET_A
	#pragma cle begin TAG_RESPONSE_GET_A
	response_get_a_datatype res_get_a;
	#pragma cle end TAG_RESPONSE_GET_A

	tag_write(&t_tag, MUX_REQUEST_GET_A, SEC_REQUEST_GET_A, DATA_TYP_REQUEST_GET_A);
	if(!inited) {
		inited = 1;
		psocket = xdc_pub_socket();
		ssocket = xdc_sub_socket(t_tag);
		sleep(1); /* zmq socket join delay */
	}

	xdc_blocking_recv(ssocket, &req_get_a, &t_tag);
	res_get_a.ret = get_a();

	tag_write(&o_tag, MUX_RESPONSE_GET_A, SEC_RESPONSE_GET_A, DATA_TYP_RESPONSE_GET_A);
	xdc_asyn_send(psocket, &res_get_a, &o_tag);
}

void _handle_nxtrpc(gaps_tag* n_tag) {
	static int inited = 0;
	static void *psocket;
	static void *ssocket;
	gaps_tag t_tag;
	gaps_tag o_tag;
	#pragma cle begin TAG_NEXTRPC
	nextrpc_datatype nxt;
	#pragma cle end TAG_NEXTRPC
	#pragma cle begin TAG_OKAY
	okay_datatype okay;
	#pragma cle end TAG_OKAY

	tag_write(&t_tag, MUX_NEXTRPC, SEC_NEXTRPC, DATA_TYP_NEXTRPC);
	if(!inited) {
		inited = 1;
		psocket = xdc_pub_socket();
		ssocket = xdc_sub_socket(t_tag);
		sleep(1); /* zmq socket join delay */
	}

	xdc_blocking_recv(ssocket, &nxt, &t_tag);

	tag_write(&o_tag, MUX_OKAY, SEC_OKAY, DATA_TYP_OKAY);
	okay.x = 0;
	xdc_asyn_send(psocket, &okay, &o_tag);

	n_tag->mux = nxt.mux;
	n_tag->sec = nxt.sec;
	n_tag->typ = nxt.typ;
}

void _hal_init(char *inuri, char *outuri) {
	xdc_set_in(inuri);
	xdc_set_out(outuri);
	xdc_register(nextrpc_data_encode, nextrpc_data_decode, DATA_TYP_NEXTRPC);
	xdc_register(okay_data_encode, okay_data_decode, DATA_TYP_OKAY);
	xdc_register(request_get_a_data_encode, request_get_a_data_decode, DATA_TYP_REQUEST_GET_A);
	xdc_register(response_get_a_data_encode, response_get_a_data_decode, DATA_TYP_RESPONSE_GET_A);
}

#define NXDRPC 2
WRAP(nxtrpc)
WRAP(request_get_a)

int _slave_rpc_loop() {
	gaps_tag n_tag;
	pthread_t tid[NXDRPC];
	_hal_init((char *)INURI, (char *)OUTURI);
	pthread_create(&tid[0], NULL, _wrapper_nxtrpc, &n_tag);
	pthread_create(&tid[1], NULL, _wrapper_request_get_a, &n_tag);
	for (int i = 0; i < NXDRPC; i++) pthread_join(tid[i], NULL);
	return 0;
}

