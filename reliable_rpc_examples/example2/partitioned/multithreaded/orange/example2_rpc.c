#include "example2_rpc.h"
#include <limits.h>
#define TAG_MATCH(X, Y) (X.mux == Y.mux && X.sec == Y.sec && X.typ == Y.typ)
#define WRAP(X) void *_wrapper_##X(void *tag) { while(1) { _handle_##X(tag); } }

bool caller_restarted_get_price = false;
void _handle_request_get_price(gaps_tag* tag) {
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
	#pragma cle begin TAG_REQUEST_GET_PRICE
	request_get_price_datatype req_get_price;
	#pragma cle end TAG_REQUEST_GET_PRICE
	#pragma cle begin TAG_RESPONSE_GET_PRICE
	response_get_price_datatype res_get_price;
	#pragma cle end TAG_RESPONSE_GET_PRICE

	tag_write(&t_tag, MUX_REQUEST_GET_PRICE, SEC_REQUEST_GET_PRICE, DATA_TYP_REQUEST_GET_PRICE);
	tag_write(&o_tag, MUX_RESPONSE_GET_PRICE, SEC_RESPONSE_GET_PRICE, DATA_TYP_RESPONSE_GET_PRICE);
	if(!inited) {
		callee_restarted = true;
		logger_get_price = fopen("rpc_log_get_price", "w");
		inited = 1;
		psocket = xdc_pub_socket();
		ssocket = xdc_sub_socket(t_tag);
		sleep(1); /* zmq socket join delay */
	}

	xdc_blocking_recv(ssocket, &req_get_price, &t_tag);

	int reqId = req_get_price.trailer.seq;
	if(reqId > processed_counter){
		bool error = false;
		processed_counter = reqId;
		if(reqId == restart_state)caller_restarted_get_price = true;;
		last_processed_result = get_price();
		last_processed_error = error;
		restart_state = -1;
		caller_restarted_get_price = false;
		res_get_price.trailer.seq = processed_counter << 2 | last_processed_error << 1 | callee_restarted;
		res_get_price.ret = last_processed_result;
		fprintf(logger_get_price,"[DEBUG:CALLE] RECEIVED REQUEST:%d  FUNCTION EXECUTED  SENT:%f\n",req_get_price.trailer.seq, res_get_price.ret);
		xdc_asyn_send(psocket, &res_get_price, &o_tag);
	}
	else if(reqId == processed_counter){
		res_get_price.trailer.seq = processed_counter << 2 | last_processed_error << 1 | callee_restarted;
		res_get_price.ret = last_processed_result;
		fprintf(logger_get_price,"[DEBUG:CALLE] RECEIVED REQUEST:%d  FUNCTION NOT EXECUTED  SENT:%f\n",req_get_price.trailer.seq, res_get_price.ret);
		xdc_asyn_send(psocket, &res_get_price, &o_tag);
	}
	else if(reqId == INT_MIN){
		res_get_price.trailer.seq = processed_counter << 2 | last_processed_error << 1 | callee_restarted;
		res_get_price.ret = last_processed_result;
		restart_state = processed_counter + 1;
		//fprintf(logger_get_price,"[DEBUG:CALLE] CALLER SYNC PROCESSED:%d    SENT:%d\n",req_get_price.trailer.seq, res_get_price.trailer.seq);
		xdc_asyn_send(psocket, &res_get_price, &o_tag);
	}
	else {
		//Ignore
	}
	callee_restarted = false;
	fflush(logger_get_price);
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
	xdc_register(request_get_price_data_encode, request_get_price_data_decode, DATA_TYP_REQUEST_GET_PRICE);
	xdc_register(response_get_price_data_encode, response_get_price_data_decode, DATA_TYP_RESPONSE_GET_PRICE);
}

#define NXDRPC 2
WRAP(nxtrpc)
WRAP(request_get_price)

int _slave_rpc_loop() {
	gaps_tag n_tag;
	pthread_t tid[NXDRPC];
	_hal_init((char *)INURI, (char *)OUTURI);
	pthread_create(&tid[0], NULL, _wrapper_nxtrpc, &n_tag);
	pthread_create(&tid[1], NULL, _wrapper_request_get_price, &n_tag);
	for (int i = 0; i < NXDRPC; i++) pthread_join(tid[i], NULL);
	return 0;
}

