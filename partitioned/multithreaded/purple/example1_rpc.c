#include "example1_rpc.h"
#include <limits.h>


#define INVALID -1

enum STATUS{
	FAILED,
	OK,
	RESTARTED
};

enum STATUS _rpc_get_a_sync_request_counter(int* request_counter, void* psocket, void* ssocket, gaps_tag* t_tag, gaps_tag* o_tag) {
	int tries_remaining = 15;
	while(tries_remaining!=0){
		//Initialize the request and response pkts
		#pragma cle begin TAG_REQUEST_GET_A
		request_get_a_datatype req_get_a;
		#pragma cle end TAG_REQUEST_GET_A
		#pragma cle begin TAG_RESPONSE_GET_A
		response_get_a_datatype res_get_a;
		#pragma cle end TAG_RESPONSE_GET_A

		//Prepare the request packet.
		req_get_a.dummy = 0;
		req_get_a.trailer.seq = *request_counter; //Set the reqId to request counter

		xdc_asyn_send(psocket, &req_get_a, t_tag);
		int status = xdc_recv(ssocket, &res_get_a, o_tag);
		int respId = res_get_a.trailer.seq >> 2 ;
		bool error = (res_get_a.trailer.seq >> 1)& 0x01 ;
		bool callee_restarted = res_get_a.trailer.seq & 0x01 ;
		if(status == INVALID){
			tries_remaining--;
			//fprintf(logger_get_a,"[DEBUG:CALLER] Sync request, tries_remaining:%d, TIMEDOUT\n", tries_remaining);
		}
		else{
			*request_counter = respId;
			//fprintf(logger_get_a,"[DEBUG:CALLER] Request Counter Synced:%d\n",*request_counter);
			return OK;
		}
	}
	return FAILED;
}

enum STATUS _rpc_get_a_remote_call(int reqId, double* result, void* psocket, void* ssocket, gaps_tag* t_tag, gaps_tag* o_tag){
	//Send requests
	//Retry NUM_TRIES times
	int tries_remaining = 15;
	while(tries_remaining!=0){
		//Initialize the request and response pkts
		#pragma cle begin TAG_REQUEST_GET_A
		request_get_a_datatype req_get_a;
		#pragma cle end TAG_REQUEST_GET_A
		#pragma cle begin TAG_RESPONSE_GET_A
		response_get_a_datatype res_get_a;
		#pragma cle end TAG_RESPONSE_GET_A

		//Prepare the request packet.
		req_get_a.dummy = 0;
		req_get_a.trailer.seq = reqId; //Set the reqId to request counter

		xdc_asyn_send(psocket, &req_get_a, t_tag);
		int status = xdc_recv(ssocket, &res_get_a, o_tag);
		int respId = res_get_a.trailer.seq >> 2 ;
		bool error = (res_get_a.trailer.seq >> 1)& 0x01 ;
		bool callee_restarted = res_get_a.trailer.seq & 0x01 ;
		if(status == INVALID){
			tries_remaining--;
			fprintf(logger_get_a,"[DEBUG:CALLER] request_id:%d, tries_remaining:%d, TIMEDOUT\n",reqId, tries_remaining);
		}
		else{ // valid status
			if(respId < reqId){
				fprintf(logger_get_a,"[DEBUG:CALLER] request_id:%d, response_id:%d,  IGNORE: Old duplicate packet received\n",reqId, respId );
				continue;
			}
			if(error){
				fprintf(logger_get_a,"[DEBUG:CALLER] ERROR: Errored on callee\n");
				return FAILED;
			}
			if(callee_restarted){
				*result = res_get_a.ret;
				fprintf(logger_get_a,"[DEBUG:CALLER] Callee has restarted request_id:%d, response_id:%d, Value:%f\n",reqId,respId, *result);
				return RESTARTED;
			}
			*result = res_get_a.ret;
			fprintf(logger_get_a,"[DEBUG:CALLER] request_id:%d, response_id:%d, Value:%f\n",reqId,respId, *result);
			return OK;
		}
	}
	fprintf(logger_get_a,"[DEBUG:CALLER] ERROR: Max tries reached\n");
	return FAILED;
}

double _rpc_get_a(int* error, int* restarted) {
	static int inited = 0;
	static void *psocket;
	static void *ssocket;
	static int request_counter = INT_MIN;

	gaps_tag t_tag;
	gaps_tag o_tag;
		tag_write(&t_tag, MUX_REQUEST_GET_A, SEC_REQUEST_GET_A, DATA_TYP_REQUEST_GET_A);
	tag_write(&o_tag, MUX_RESPONSE_GET_A, SEC_RESPONSE_GET_A, DATA_TYP_RESPONSE_GET_A);

	if(!inited) {
		logger_get_a = fopen("rpc_log_get_a", "w");
		inited = 1;
		psocket = xdc_pub_socket();
		ssocket = xdc_sub_socket_non_blocking(o_tag,1000);
		sleep(1); /* zmq socket join delay */

		//Synchronize the request counter to handle system restarts
		//Send an error in case the sync failed
		int status = _rpc_get_a_sync_request_counter(&request_counter, psocket, ssocket, &t_tag, &o_tag );
		if(status == FAILED){
			*error = 1;
			fprintf(logger_get_a,"[DEBUG:CALLER] ERROR: Failed to connect to callee. Max tries reached\n");
			fflush(logger_get_a);
			return 0;
		}
	}

	//Increment the request counter
	request_counter++;

	//Do a remote function call
	double result;
	enum STATUS status = _rpc_get_a_remote_call(request_counter,  &result, psocket, ssocket, &t_tag, &o_tag);

	if(status == FAILED){
		//set error;
		*error = 1;
		fflush(logger_get_a);
		return 0;
	}
	if(status == RESTARTED){
		*restarted = 1;
		printf("SERVER RESTARTED");
	}
	fflush(logger_get_a);
	return (result);
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

