#ifndef _Purple_RPC_
#define _Purple_RPC_
#include "xdcomms.h"
#include "codec.h"
#include <stdbool.h>

# define APP_BASE 0
# define MUX_NEXTRPC APP_BASE + 1
# define SEC_NEXTRPC APP_BASE + 1
# define MUX_OKAY APP_BASE + 2
# define SEC_OKAY APP_BASE + 2
# define MUX_REQUEST_GET_PRICE APP_BASE + 1
# define SEC_REQUEST_GET_PRICE APP_BASE + 1
# define MUX_RESPONSE_GET_PRICE APP_BASE + 2
# define SEC_RESPONSE_GET_PRICE APP_BASE + 2

#define INURI  "ipc:///tmp/example2subpurple"
#define OUTURI "ipc:///tmp/example2pubpurple"
#pragma cle def TAG_RESPONSE_GET_PRICE {"level":"purple",\
	"cdf": [\
		{"remotelevel":"purple", \
			"direction": "egress", \
			"guarddirective": { "operation": "allow", \
						"gapstag": [2,2,4] }} \
	] }
#pragma cle def TAG_REQUEST_GET_PRICE {"level":"purple",\
	"cdf": [\
		{"remotelevel":"orange", \
			"direction": "egress", \
			"guarddirective": { "operation": "allow", \
						"gapstag": [1,1,3] }} \
	] }
#pragma cle def TAG_OKAY {"level":"purple",\
	"cdf": [\
		{"remotelevel":"purple", \
			"direction": "egress", \
			"guarddirective": { "operation": "allow", \
						"gapstag": [2,2,2] }} \
	] }
#pragma cle def TAG_NEXTRPC {"level":"purple",\
	"cdf": [\
		{"remotelevel":"orange", \
			"direction": "egress", \
			"guarddirective": { "operation": "allow", \
						"gapstag": [1,1,1] }} \
	] }
extern void _master_rpc_init();
extern double _rpc_get_price();
FILE* logger_get_price;


#endif /* _PURPLE_RPC_ */