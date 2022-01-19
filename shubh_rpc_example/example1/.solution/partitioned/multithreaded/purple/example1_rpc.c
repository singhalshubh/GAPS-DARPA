#include "example1_rpc.h"
double _rpc_get_a() {
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

	req_get_a.dummy = 0;
	tag_write(&t_tag, MUX_REQUEST_GET_A, SEC_REQUEST_GET_A, DATA_TYP_REQUEST_GET_A);
	tag_write(&o_tag, MUX_RESPONSE_GET_A, SEC_RESPONSE_GET_A, DATA_TYP_RESPONSE_GET_A);

	if(!inited) {
		inited = 1;
		psocket = xdc_pub_socket();
		ssocket = xdc_sub_socket(o_tag);
		sleep(1); /* zmq socket join delay */
	}

	xdc_asyn_send(psocket, &req_get_a, &t_tag);
	xdc_blocking_recv(ssocket, &res_get_a, &o_tag);
	return (res_get_a.ret);
}

void _hal_init(char *inuri, char *outuri) {
	xdc_set_in(inuri);
	xdc_set_out(outuri);
	xdc_register(nextrpc_data_encode, nextrpc_data_decode, DATA_TYP_NEXTRPC);
	xdc_register(okay_data_encode, okay_data_decode, DATA_TYP_OKAY);
	xdc_register(request_get_a_data_encode, request_get_a_data_decode, DATA_TYP_REQUEST_GET_A);
	xdc_register(response_get_a_data_encode, response_get_a_data_decode, DATA_TYP_RESPONSE_GET_A);
}

void _master_rpc_init() {
	_hal_init((char*)INURI, (char *)OUTURI);
}

