# CLOSURE Example: Example 2: Stock Price

## Properties:
- Showcases Error Propagation
- Showcases Callee Restarts


## Directory Structure

* plain:       contains original unannotated application
* annotated:   contains annotations applied to plain to reflect security intent below
* refactored:  contains annotated code refactored for making security-compliant partitioning feasible
* divvied:     contains code divvied up into separate directories for each level/enclave as input for GEDL generation, followed by code autogeneration
* partitioned: contains fully paritioned sources with cross-domain RPCs, marshalling, serialization, tags, HAL API, etc.

## Cross Domain Topology

* Enclaves: 2 (Orange, Purple)

## Security Intent

* Variable `stockprice` in `get_price()` is in ORANGE and can be shared with PURPLE
* Time is computed on purple side and price is fetched(from orange side)  on PURPLE side (for printing there)
* Sample Error handling and callee restart handling code
```
while (1) {
     time_t reportTime = time(NULL);
     int error = 0;
     int restarted = 0;
     x = _rpc_get_price(&error, &restarted);
     if(error == 1){
       x = last_reported;
       reportTime = last_reported_time;
     }
     else{
       last_reported = x;
       last_reported_time = reportTime;
     }
     if(restarted == 1){
       //
     }
     
    printf("The stock price is %.2f reported at %s", x,  asctime(localtime(&reportTime)));
    sleep(5);
  }
```

## Example 2 CLE Label Definitions

For convenience, the following CLE label definitions are provided for use in example 2. Place after include directives in `annotated/example2.c`
```
#pragma cle def PURPLE {"level":"purple"}

#pragma cle def ORANGE {"level":"orange",\
  "cdf": [\
    {"remotelevel":"purple", \
     "direction": "egress", \
     "guarddirective": { "operation": "allow"}}\
  ] }

#pragma cle def XDLINKAGE_GET_PRICE {"level":"orange",\
  "cdf": [\
    {"remotelevel":"purple", \
     "direction": "bidirectional", \
     "guarddirective": { "operation": "allow"}, \
     "argtaints": [], \
     "codtaints": ["ORANGE"], \
     "rettaints": ["TAG_RESPONSE_GET_PRICE"], \
     "idempotent": true, \
     "num_tries": 5, \
     "timeout": 1000 \
    } \
  ] }
```

## Full Solution
For reference during the independent exercise only, see `.solution` subdirectory for complete working copy of example2 code.

## Dependencies

* CLE Version:
* Refactoring Methodology:
* HAL API:
* DFDL/DAGR:

## Other Tools

None
