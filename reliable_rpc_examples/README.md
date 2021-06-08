# Reliable RPC:

Reliable RPC protocol extends the baseline RPC protocol. 
## Semantics

### Assumptions:
* Bidirectional RPC
* Atmost one outstanding request
### Cases it can handle: 
* Loss : Request Packet Drop
* Loss : Response Packet Drop
* Out of order(Arbitrary delays) 
* Duplication
### Features: 
* Propagates RPC error info to the application 
* Propagates system restart info to the application
* Developer can set degree of loss resistance by specifying number of tries
* Developer can mark rpc as idempotent (to be executed once for a given call)


## Usage

### Annotation

* Developers can modify the semantics of the rpc by annotating them with cle-labels during the annotation phase  
* Currently the following labels are supported:
```
- Num Tries: The number of tries the caller will make to send request in case of timeout.
- Timeout: The timeout set for the rpc calls
- Idempotent : If marked true, the function will be executed only once for a given call.
- Pure: To be used with caching logic. Not integrated yet.
```

### Error Propagation and System Restarts

* The RPC implementation informs the application in case of error and system restarts
* The developer can handle these events in whatever way they see fit. Default Implementation is to throw an assertion.
* Caller: The application code is modified to pass flags which are set to 1 in case of an error or system restarts
* Callee: done using global variables. Reason of using global variable instead of passing flags: The rpc can be called locally as well.

## Examples
Demo Link: https://youtu.be/dS8AykXJfrQ
### Example 1: EWMA
* Showcases reliability against Request and Response Packet Loss
* Showcases reliability against Delays
* SHowcases reliability against out of order packets
### Example 2: Stock Price
- Showcases Error Propagation
- Showcases Callee Restarts
### Example 3: Sequence Generation 
- Showcases Caller Restarts

For more details, checkout the README for each example.

### ChangeList:
- build/src/mules/cle-spec/schema/cle-schema.json : Modifications to support new cle-lables (Num_tries, Timeout etc) [Commit](https://github.com/gaps-closure/mules/commit/a4c6fcbc5d21592b792a5feaed627bd4e591e562)
- build/src/capo/gedl/RPCGenerator_ss.py: Reliable RPC generator script [Commit](https://github.com/gaps-closure/capo/commit/7ada1bc4bcfa4e417f8ea9c5b49941e2d61133ad)
- build/apps/reliable_rpc_examples/: Three new examples to showcase RPC properties. [Commit](https://github.com/gaps-closure/build/commit/cf8734efd267898d7b07e3f3ffe26be7ad53e513)


### Steps to reproduce:
- Update the scripts and schema path in .vscode/closure_env.sh in the example directory to point towards the location of RPCGenerator script and cle-schema respectively. Default location is 
```
CLOSURE_TOOLS=/opt/closure
export CLOSURE_SCRIPTS=${CLOSURE_TOOLS}/scripts
export CLOSURE_SCHEMAS=${CLOSURE_TOOLS}/schemas
export RPCGENERATOR=${CLOSURE_SCRIPTS}/RPCGenerator_ss.py
```
- Build and run the examples using standard procedure(CLEAN SOURCE, ANNOTATE, ANALYZE PARTITION CONFLICTS, EMULATE) . 
Note: `.solution/refactored` subdirectory in each example contains a sample(working) annotated code. 


### Simulation of loss and delays(Three ways to do it):
- Use core ui's loss and delay knobs (unreliable)
- Use linux tc command to drop and delay pkts (https://sandilands.info/sgordon/dropping-packets-in-ubuntu-linux-using-tc-and-iptables) 
- Drop and delay pkts at hal level. Need to add some pseduo test code in build/src/hal/api/xdcomms.c. Use env variable to set loss and delay. Code stored in branch [loss_delay_simulation](https://github.com/gaps-closure/hal/compare/develop...loss_delay_simulation?expand=1) 